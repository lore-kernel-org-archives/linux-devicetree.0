From: Bodo Kaiser <i@bodokaiser.io>
Subject: Enable generic sys/pwm interface with overlay
Date: Sat, 9 Nov 2013 10:44:28 +0100
Message-ID: <B7EF43C1-B62F-44EC-8589-5E2F239D8E53@bodokaiser.io>
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1822\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

I am using the archlinux 3.12.0-rc7-5 kernel and want to enable the generic /sys/pwm interface (not the one over /sys/devices/ocp.*).

Unfortunately I do not get it. The kernel documentation gives following snippet:

ehrpwm0: ehrpwm@0 { /* EHRPWM on am33xx */
       compatible = "ti,am33xx-ehrpwm";
       #pwm-cells = <3>;
       reg = <0x48300200 0x100>;
       ti,hwmods = "ehrpwm0";
};
Source: https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.txt

However adding this to the overlay and exporting via echo BB-PWM-00A0 > /sys/devices/bone_capemgr.*/slots does not show allow me to export
anything to /sys/pwm/export.

My current overlay is:

/dts-v1/;
/plugin/;

/ {

   part-number = "BB-HONEYMOON";
   version     = "00A0";

   compatible = 
       "ti,beaglebone", 
       "ti,beaglebone-black"
       ;

   exclusive-use =
       "P9.21",
       "P9.22",
       "P9.29",
       "P9.31",
       "ehrpwm0A",
       "ehrpwm0B"
       ;

   fragment@0 {
       target = <&am33xx_pinmux>;
       __overlay__ {
           pinctrl-single,pins = <
               0x154 0x03 /* P9_21 PWM Mode */
               0x150 0x03 /* P9_22 PWM Mode */
               0x194 0x01 /* P9_29 PWM Mode */
               0x190 0x01 /* P9_31 PWM Mode */
> ;
       };
   };

   ehrpwm0: ehrpwm@0 {
       compatible = "ti,am33xx-ehrpwm";
       #pwm-cells = <3>;
       reg = <0x48300200 0x100>;
       ti,hwmods = "ehrpwm0";
   };

};

Could somebody tell me what I am doing wrong and how a right overlay would look like?

Best,
Bo--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
