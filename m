From: Chris Ruehl <chris.ruehl-CR359r9tUDPXPF5Rlphj1Q@public.gmane.org>
Subject: imx27: pinctrl: GPIO set output value failed
Date: Mon, 13 Jan 2014 18:58:05 +0800
Message-ID: <52D3C6BD.1090606@gtsys.com.hk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

some kind of weired problem:
some GPIO's can modified via /sysfs  others cannot

Working OK
[    1.553601] imx27-pinctrl 10015000.iomuxc: imx1_pmx_enable, pin 0x9, 
function 0, gpio 1, direction 1, oconf 3, iconfa 0, iconfb 0
[    1.553657] imx27-pinctrl 10015000.iomuxc: write: register 0xf4415004 
offset 18 value 0x3
[    1.553712] imx27-pinctrl 10015000.iomuxc: write: register 0xf441500c 
offset 18 value 0x0
[    1.553766] imx27-pinctrl 10015000.iomuxc: write: register 0xf4415010 
offset 18 value 0x0
NOT Working
[    1.553833] imx27-pinctrl 10015000.iomuxc: imx1_pmx_enable, pin 0xa, 
function 0, gpio 1, direction 1, oconf 3, iconfa 0, iconfb 0
[    1.553889] imx27-pinctrl 10015000.iomuxc: write: register 0xf4415004 
offset 20 value 0x3
[    1.553944] imx27-pinctrl 10015000.iomuxc: write: register 0xf441500c 
offset 20 value 0x0
[    1.553997] imx27-pinctrl 10015000.iomuxc: write: register 0xf4415010 
offset 20 value 0x0


GPIOs 0-31, platform/10015000.gpio, 10015000.gpio:
  gpio-9   (sysfs               ) out hi
  gpio-10  (sysfs               ) out lo
  gpio-12  (sysfs               ) out lo
  gpio-14  (sysfs               ) in  hi
  gpio-16  (sysfs               ) in  hi
  gpio-24  (green               ) out hi
  gpio-26  (red                 ) out lo
  gpio-30  (yellow              ) out lo
  gpio-31  (10024170.usbphy     ) out hi

root@gtsir20:~# echo 1 > /sys/class/gpio/gpio10/value
root@gtsir20:~# cat /sys/kernel/debug/gpio
GPIOs 0-31, platform/10015000.gpio, 10015000.gpio:
  gpio-9   (sysfs               ) out hi
  gpio-10  (sysfs               ) out lo
  gpio-12  (sysfs               ) out lo
  gpio-14  (sysfs               ) in  hi
  gpio-16  (sysfs               ) in  hi
  gpio-24  (green               ) out hi
  gpio-26  (red                 ) out lo
  gpio-30  (yellow              ) out lo
  gpio-31  (10024170.usbphy     ) out hi

          pinctrl_userio1: userio1-1 {
                         fsl,pins = <
                                 /* 2x GPIO in */
                                 /* MX27_PAD_LD8__GPIO1_14 (in) */
                                 /* MX27_PAD_LD10__GPIO1_16 (in) */
                                 0x0e 0x032 0x0
                                 0x10 0x032 0x0
                                 /* 3x GPIO out */
                                 /* UHF Enable */
                                 MX27_PAD_LD3__GPIO1_9 0x0
                                 MX27_PAD_LD4__GPIO1_10 0x0
                                 MX27_PAD_LD6__GPIO1_12 0x0
                                 /*
                                 LED 1,2,3
                                 */
                                 MX27_PAD_PS__GPIO1_26 0x0
                                 MX27_PAD_CONTRAST__GPIO1_30 0x0
                                 MX27_PAD_REV__GPIO1_24 0x0
...

I review the pinctrl code but cannot find the problem.

Help needed.

Thanks
Chris
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
