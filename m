From: "Simon Arlott" <simon@fire.lp0.eu>
Subject: Re: [PATCH 1/2] regulator: Add brcm,bcm63xx-regulator device tree
 binding
Date: Wed, 2 Dec 2015 12:45:50 -0000
Message-ID: <b7ecdc8ebcdf9582620c22b0e8a4a96d24ba67c1@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
References: <565A18DD.60108@simon.arlott.org.uk>
    <20151130121043.GX1929@sirena.org.uk>
    <565CB1CF.5040306@simon.arlott.org.uk>
    <20151201221615.GY1929@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151201221615.GY1929@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Jonas Gorski <jogo@openwrt.org>
List-Id: devicetree@vger.kernel.org

On Tue, December 1, 2015 22:16, Mark Brown wrote:
> On Mon, Nov 30, 2015 at 08:30:07PM +0000, Simon Arlott wrote:
>
>> +- offset: register offset
>> +- mask: register enable mask
>> +- startup-delay-us: startup time in microseconds
>
> Why are these in the DT, I would expect that if this is a driver for a
> specific SoC all these properties would be known as a result of that.

This is a driver for multiple SoCs with the same regulator control in
different places on different SoCs, so the location of it within the misc
register needs to be provided in the DT:

BCM6362:
  #define MISC_BASE 0xb0001800 /* Miscellaneous Registers */
  uint32 miscIddqCtrl; /* 0x48 */

BCM63268/BCM63168:
  #define MISC_BASE 0xb0001800 /* Miscellaneous Registers */
  uint32 miscIddqCtrl; /* 0x4c */


I'll remove the startup-delay-us property and put a default in the driver.


The mask is used as there's one bit per regulator in the register, but
there's more than one way to express this in the DT:

It currently looks like this:
  regulators {
    compatible = "simple-bus";
    #address-cells = <0>;
    #size-cells = <0>;

    sar {
      compatible = "brcm,bcm63168-regulator", "brcm,bcm6345-regulator";
      regulator-name = "sar_power";
      regmap = <&misc>;
      offset = <0x4c>;
      mask = <0x1>;
      startup-delay-us = <100000>;
    };

    ipsec {
      compatible = "brcm,bcm63168-regulator", "brcm,bcm6345-regulator";
      regulator-name = "ipsec_power";
      regmap = <&misc>;
      offset = <0x4c>;
      mask = <0x2>;
      startup-delay-us = <100000>;
    };

    ...
  };

  ubus {
    compatible = "brcm,ubus", "simple-bus";
    #address-cells = <1>;
    #size-cells = <1>;
    ranges;

    misc: syscon@10001800 {
      compatible = "syscon";
      reg = <0x10001800 0xd0>;
    };
  };

Would this be more appropriate?
  regulators {
    compatible = "simple-bus";
    #address-cells = <0>;
    #size-cells = <0>;

    misc_iddq_ctrl {
      compatible = "brcm,bcm63168-regulator", "brcm,bcm6345-regulator";
      regmap = <&misc>;
      offset = <0x4c>;
      #address-cells = <1>;
      #size-cells = <0>;

      sar@0 {
        regulator-name = "sar_power";
      };

      ipsec@1 {
        regulator-name = "ipsec_power";
      };

      ...
    };
  };

  ubus {
    compatible = "brcm,ubus", "simple-bus";
    #address-cells = <1>;
    #size-cells = <1>;
    ranges;

    misc: syscon@10001800 {
      compatible = "syscon";
      reg = <0x10001800 0xd0>;
    };
  };

-- 
Simon Arlott
