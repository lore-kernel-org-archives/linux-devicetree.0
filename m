From: Jorge Ventura <jorge.araujo.ventura-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Question about device tree and modalias
Date: Tue, 15 Oct 2013 09:35:55 -0500
Message-ID: <20131015143544.GA32767@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

I am beginning to study device tree and I have a question.
There is a drive available for the device enc28j60, an ethernet chip with spi interface. The drive has modalias "spi:enc28j60" what is used by the old linux device module to match with the plataform modalias.

I am including in the device tree:

    fragment@1 {
        target = <&spi1>;
        __overlay__ {

             #address-cells = <1>;
             #size-cells = <0>;
             status = "okay";
             pinctrl-names = "default";
             pinctrl-0 = <&spi1_pins_s0>;
             ti,pindir-d0-out-d1-in = <1>;

             spidev@1 {
                 spi-max-frequency = <24000000>;
                 reg = <0>;
                 compatible = "linux,spidev";

                 ethernet: enc28j60@0 {
                        compatible = "microchip,enc28j60";
                 };
             };
        };
    };

but the result for modalias is "platform:enc28j60@0.10" what doesn't match with "spi:enc28j60".

Someone can explain or point some tutorials to describe the correct way to migrate one drive to device tree model?

Sincerely,
Ventura
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
