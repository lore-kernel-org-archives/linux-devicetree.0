From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [RFCv1 2/3] ARM: dts: meson8b: odroidc1: fix USB power supplies
 for phy
Date: Thu, 7 Feb 2019 12:02:50 +0530
Message-ID: <CANAwSgRtBWzKiFLUV6twxv+TnvjLdHXv=U8+ppQ7=9uBBLEH+Q@mail.gmail.com>
References: <20190123151209.2080-1-linux.amoon@gmail.com>
 <20190123151209.2080-3-linux.amoon@gmail.com>
 <CAFBinCAdf0rtt-7tON_LRNH_cpvGJXX3LX8g-i4xsC3wahZSVA@mail.gmail.com>
 <CANAwSgQ4=Vn6RM4Kpd20UWkQNW81=mfg-qB0G73dsRem3qwjcA@mail.gmail.com>
 <CAFBinCB=3kmuFb_xXzhW+m8dTasVrCHQp2wti+=5UjrAHk5TTg@mail.gmail.com>
 <CANAwSgQnMkXECkCVjFKwNKB+2JoiPtVPQbateppmtgfPYCutZg@mail.gmail.com>
 <CAFBinCCFoBkbf-HvEoMk7mTYTBV27nJ9TF1X-DrLuHR9qDVDSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="000000000000bb3a4b05814803ef"
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAFBinCCFoBkbf-HvEoMk7mTYTBV27nJ9TF1X-DrLuHR9qDVDSA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree <devicetree@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

--000000000000bb3a4b05814803ef
Content-Type: text/plain; charset="UTF-8"

Hi Martin,

On Wed, 6 Feb 2019 at 16:58, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Tue, Feb 5, 2019 at 8:53 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
> > > my interpretationfor the Amlogic SoCs is:
> > > - vusb_a and vusb_d are generated internally, not sure if there's an
> > > external fixed regulator
> > > - there is no phy-supply (the PHY itself is powered by clock-gating
> > > using the CLKID_USB clock)
> > > - usb0 VBUS is controlled by GPIOAO_5
> > >
> >
> > But as per the device tree binding
> >
> > [0] https://elixir.bootlin.com/linux/v5.0-rc5/source/Documentation/devicetree/bindings/phy/meson8b-usb2-phy.txt
> > [1] https://elixir.bootlin.com/linux/v5.0-rc5/source/Documentation/devicetree/bindings/phy/phy-bindings.txt
> >
> > its uses phy-supply to enable power to usb phy which seem to be correct option.
> phy-bindings.txt states that "phy-supply" is a "Phandle to a regulator
> that provides power to the PHY".
> I have written the example in meson8b-usb2-phy.txt and I think it's
> wrong (back when I wrote it I didn't know about the "vbus-supply"
> property on the controller and I didn't know about the VBUS
> constraints).
>
> I believe that the phy-supply property is intended for PHYs which need
> an external power supply (for example because they are not embedded
> into a SoC or if the SoC has separate voltage inputs for the PHY).
> I'm not aware of any PHY supply voltage on the Amlogic SoCs (I believe
> this is done internally within the SoC). instead they use clock gating
> to power down the PHY.
>
> as far as I understand the VBUS signal it depends on the USB mode:
> - host provides VBUS
> - peripheral devices are powered using this voltage
> - with OTG VBUS needs to be turned on or off depending on the current
> mode (host or peripheral)
> with the "phy-supply" property there's no way to manage the regulator
> depending on the USB mode (host or peripheral), it will always be
> "on".
>
>
> Regards
> Martin

Thanks for the clarification.
But this dose not work setting the usb1_phy to use vbus-supply.

 &usb1_phy {
        status = "okay";
+       vbus-supply = <&usb_vbus>;
 };

I am attaching a small patch for testing.
[0] usbvbus.patch

Here is the summary of the above patch.

1. hot-plugins of usb device is not working.
2. only cold/warm boot let the device come up.
3. not power is supplied to the usb ports.
4. no power module is registered with the regulator summary.

# cat /sys/kernel/debug/regulator/regulator_summary
 regulator                      use open bypass  opmode voltage
current     min     max
---------------------------------------------------------------------------------------
 regulator-dummy                  4    3      0 unknown     0mV
0mA     0mV     0mV
    c90c0000.usb                  1
0mA     0mV     0mV
    c90c0000.usb                  1
0mA     0mV     0mV
    VCCK                          1    1      0 unknown   860mV
0mA   860mV  1140mV
       cpu0                       0
0mA   860mV   860mV
 P5V0                             2    4      0 unknown  5000mV
0mA  5000mV  5000mV
    VCC1V8                        1    1      0 unknown  1800mV
0mA  1800mV  1800mV
       c1108680.adc               1
0mA     0mV     0mV
    VCC3V3                        1    2      0 unknown  3300mV
0mA  3300mV  3300mV
       VDD_RTC                    0    0      0 unknown   900mV
0mA   900mV   900mV
       TFLASH_VDD                 1    1      0 unknown  3300mV
0mA  3300mV  3300mV
          c1108c20.mmc:slot@1     1
0mA  3300mV  3400mV
    DDR_VDDC                      0    0      0 unknown  1500mV
0mA  1500mV  1500mV
    USB_VBUS                      0    0      0 unknown  5000mV
0mA  5000mV  5000mV
 TF_IO                            0    1      0 unknown  3300mV
0mA  1800mV  3300mV
    c1108c20.mmc:slot@1           0
0mA     0mV     0mV

*So from my side phy-supply is the correct option.*

Best Regards
-Anand

--000000000000bb3a4b05814803ef
Content-Type: application/octet-stream; name="usbvbus.patch"
Content-Disposition: attachment; filename="usbvbus.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jru8vqpf0>
X-Attachment-Id: f_jru8vqpf0

ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL21lc29uOGItb2Ryb2lkYzEuZHRzIGIvYXJj
aC9hcm0vYm9vdC9kdHMvbWVzb244Yi1vZHJvaWRjMS5kdHMKaW5kZXggNTg2NjlhYmRhMjU5Li5h
MDRmNTYzM2FkY2YgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL21lc29uOGItb2Ryb2lk
YzEuZHRzCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL21lc29uOGItb2Ryb2lkYzEuZHRzCkBAIC04
Myw2ICs4MywyMCBAQAogCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDw1MDAwMDAwPjsKIAl9
OwogCisJdXNiX3ZidXM6IHJlZ3VsYXRvci11c2ItdmJ1cyB7CisJCWNvbXBhdGlibGUgPSAicmVn
dWxhdG9yLWZpeGVkIjsKKworCQlyZWd1bGF0b3ItbmFtZSA9ICJVU0JfVkJVUyI7CisJCXJlZ3Vs
YXRvci1taW4tbWljcm92b2x0ID0gPDUwMDAwMDA+OworCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9s
dCA9IDw1MDAwMDAwPjsKKwkJLyoKKwkJICogc2lnbmFsIG5hbWUgZnJvbSBzY2hlbWF0aWNzOiBQ
V1JFTgorCQkgKi8KKwkJZ3BpbyA9IDwmZ3Bpb19hbyBHUElPQU9fNSBHUElPX0FDVElWRV9ISUdI
PjsKKwkJZW5hYmxlLWFjdGl2ZS1oaWdoOworCQl2aW4tc3VwcGx5ID0gPCZwNXYwPjsKKwl9Owor
CiAJdGZsYXNoX3ZkZDogcmVndWxhdG9yLXRmbGFzaF92ZGQgewogCQkvKgogCQkgKiBzaWduYWwg
bmFtZSBmcm9tIHNjaGVtYXRpY3M6IFRGTEFTSF9WRERfRU4KQEAgLTI5Nyw2ICszMTEsNyBAQAog
CiAmdXNiMV9waHkgewogCXN0YXR1cyA9ICJva2F5IjsKKwl2YnVzLXN1cHBseSA9IDwmdXNiX3Zi
dXM+OwogfTsKIAogJnVzYjEgewo=
--000000000000bb3a4b05814803ef
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--000000000000bb3a4b05814803ef--
