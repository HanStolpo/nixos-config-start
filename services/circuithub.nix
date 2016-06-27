# services required to run circuithub apps locally
{ config, pkgs, ... }:

{
  services = {
    rabbitmq.enable = true;
    redis.enable = true;
    postgresql = {
      enable = true;
      authentication = pkgs.lib.mkForce
         ''
           local all all               trust
           host  all all 127.0.0.1/32  trust
           host  all all ::1/128       trust
         '';
    };
  };
}
