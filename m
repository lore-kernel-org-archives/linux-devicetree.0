From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: node modification by overlay does not trigger probe
Date: Wed, 22 Jun 2016 22:52:13 +0200
Message-ID: <CAOMqctRug-MQh6hk400Ft7ySEd+1HHzGKezAo3mTN51iuxdbpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

I have been experimenting with overlays a bit.

I have a board with SPI interface on an external header.

The first use was like this:

------------board file excerpt:
&spi2 {
        pinctrl-names = "default";
        pinctrl-0 = <&spi2_pins_a>,
                    <&spi2_cs0_pins_a>;
        status = "okay";
};

------------overlay:
/dts-v1/;
/plugin/;

/ {
    compatible = "olimex,a10s-olinuxino-micro";

    /* identification */
    part-number = "A10S-SPI2";

    fragment@0 {
        target = <&spi2>;
        __overlay__ {
            #address-cells = <1>;
            #size-cells = <0>;
            flash: m25p80@0 {
                #address-cells = <1>;
                #size-cells = <1>;
                compatible = "spidev";
                reg = <0>;
                spi-max-frequency = <40000000>;
                   };
        };
    };
};

This is copied from some random example and modified for this use
case. It adds the whole SPI slave device node and specifies the CS in
the overlay.

Later I tried this approach with CS in board file which gives more
generic overlay:
-----------board:
&spi2 {
        pinctrl-names = "default";
        pinctrl-0 = <&spi2_pins_a>,
                    <&spi2_cs0_pins_a>;
        status = "okay";

        uext_spi: spi@uext {
                reg = <0>;
                spi-max-frequency = <40000000>;
                status = "disabled";
        };
};
----------overlay:
/dts-v1/;
/plugin/;

/ {
  compatible = "olimex,uext";

  /* identification */
  part-number = "Olimex-UEXT";

  fragment@0 {
    target = <&uext_spi>;
    __overlay__ {
      compatible = "spidev";
      spi-max-frequency = <40000000>;
      status = "okay";
    };
  };
};

This works so long as I have status = "disabled" frobbed to "okay" by
the overlay. Without the status lines in the board and overlay file
the SPI driver needs to be reloaded for the change to take effect.

It's not entirely out of question to specify the status. However,
there are problems

 - the SPI CS along with the other SPI pins are used on a connector so
they should not have the "disabled" status reserved for unused
hardware. When a patch for automagic binding of spidev to every CS was
proposed a concern was raised that the unused CS lines could cause
other hardware malfunction when triggered. So in that spirit the CS
which *is* used by the connector should be marked as enabled.

- I want to get rid of the spoidev log spam caused by this overlay by
making the spidev binding implicit. That is for each spi slave the
spidev device is created automagically. For that the slave must be
marked as enabled in the board file and that precludes loading another
driver for the slave through overlay because the re-probe is not
triggered when the device was already enabled.

Is there a reasonable way to fix this? Re-probing modified nodes
should be possible. I am not aware of anything that would break given
facilities for actually loading overlays are not mainlined so far.

Thanks

Michal
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
