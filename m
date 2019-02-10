From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFCv1 2/3] ARM: dts: meson8b: odroidc1: fix USB power supplies
 for phy
Date: Sun, 10 Feb 2019 23:21:36 +0100
Message-ID: <CAFBinCBwDg21t+HT6w7CcUgH_aDuwh-UgoPs7GuZo9rABvPDig@mail.gmail.com>
References: <20190123151209.2080-1-linux.amoon@gmail.com>
 <20190123151209.2080-3-linux.amoon@gmail.com>
 <CAFBinCAdf0rtt-7tON_LRNH_cpvGJXX3LX8g-i4xsC3wahZSVA@mail.gmail.com>
 <CANAwSgQ4=Vn6RM4Kpd20UWkQNW81=mfg-qB0G73dsRem3qwjcA@mail.gmail.com>
 <CAFBinCB=3kmuFb_xXzhW+m8dTasVrCHQp2wti+=5UjrAHk5TTg@mail.gmail.com>
 <CANAwSgQnMkXECkCVjFKwNKB+2JoiPtVPQbateppmtgfPYCutZg@mail.gmail.com>
 <CAFBinCCFoBkbf-HvEoMk7mTYTBV27nJ9TF1X-DrLuHR9qDVDSA@mail.gmail.com>
 <CANAwSgRtBWzKiFLUV6twxv+TnvjLdHXv=U8+ppQ7=9uBBLEH+Q@mail.gmail.com>
 <CAFBinCD_Pddu+pBEKwMS6467J5nxKF4T5-LxVo06nFvyUSLpew@mail.gmail.com>
 <CANAwSgSQRwF+_VR1jJFg=Q9wSdanEH0GmnFaeegt=hRMXiHX3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="0000000000002656590581919e73"
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CANAwSgSQRwF+_VR1jJFg=Q9wSdanEH0GmnFaeegt=hRMXiHX3Q@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: devicetree <devicetree@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

--0000000000002656590581919e73
Content-Type: text/plain; charset="UTF-8"

Hi Anand,

On Sat, Feb 9, 2019 at 6:55 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> > > But this dose not work setting the usb1_phy to use vbus-supply.
> > >
> > >  &usb1_phy {
> > >         status = "okay";
> > > +       vbus-supply = <&usb_vbus>;
> > >  };
> > >
> > > I am attaching a small patch for testing.
> > > [0] usbvbus.patch
> > indeed, this is not working for me either.
> > I checked my old notes at [0] -> it works for me when setting
> > "vbus-supply" at the usb controller (not the PHY).
> >
> > with the following snippet:
> >   &usb1 {
> >     status = "okay";
> >     vbus-supply = <&usb_vbus>;
> >   };
> > I get:
> > # cat /sys/kernel/debug/regulator/regulator_summary | grep -i usb
> >    c90c0000.usb                  1                                 0mA
> >     0mV     0mV
> >    c90c0000.usb                  1                                 0mA
> >     0mV     0mV
> >    USB_VBUS                      1    1      0 unknown  5000mV     0mA
> >  5000mV  5000mV
> >       c90c0000.usb               1                                 0mA
> >     0mV     0mV
> >
> > can you please try this on your board as well?
> >
> > > Here is the summary of the above patch.
> > >
> > > 1. hot-plugins of usb device is not working.
> > > 2. only cold/warm boot let the device come up.
> > > 3. not power is supplied to the usb ports.
> > > 4. no power module is registered with the regulator summary.
> > with "vbus-supply" moved to the usb1 node I get the following result:
> > 1. same: hot-plugins of usb device is not working
> > 2. different: a reboot doesn't make devices come up
> > 3. same: no power is supplied to the USB ports (in my case this causes
> > #2, but it's not clear why there's no power...)
> > 4. different: the regulator is registered with the USB controller in debugfs
> >
> Here the the logs after I applied the above changes
>
> [1] https://pastebin.com/rVa8gxNG
can you please provide the .dts patch for this log?
I can see the following message in your log:
[    1.977367] USB_VBUS: disabling

I have tried it with the attached patch, then I get:
# dmesg | grep VBUS
#
# cat /sys/kernel/debug/regulator/regulator_summary
regulator                      use open bypass  opmode voltage current
    min     max
---------------------------------------------------------------------------------------
regulator-dummy                  4    3      0 unknown     0mV     0mA
    0mV     0mV
   c90c0000.usb                  1                                 0mA
    0mV     0mV
   c90c0000.usb                  1                                 0mA
    0mV     0mV
   VCCK                          1    1      0 unknown   860mV     0mA
  860mV  1140mV
      cpu0                       0                                 0mA
  860mV   860mV
P5V0                             3    4      0 unknown  5000mV     0mA
 5000mV  5000mV
   VCC1V8                        2    2      0 unknown  1800mV     0mA
 1800mV  1800mV
      c1108680.adc               1                                 0mA
    0mV     0mV
      c1108e00.mmc               1                                 0mA
 1800mV  1950mV
   VCC3V3                        2    3      0 unknown  3300mV     0mA
 3300mV  3300mV
      c1108e00.mmc               1                                 0mA
 3300mV  3400mV
      VDD_RTC                    0    0      0 unknown   900mV     0mA
  900mV   900mV
      TFLASH_VDD                 1    1      0 unknown  3300mV     0mA
 3300mV  3300mV
         c1108c20.mmc:slot@1     1                                 0mA
 3300mV  3400mV
   DDR_VDDC                      0    0      0 unknown  1500mV     0mA
 1500mV  1500mV
   USB_VBUS                      1    1      0 unknown  5000mV     0mA
 5000mV  5000mV
      c90c0000.usb               1                                 0mA
    0mV     0mV
TF_IO                            0    1      0 unknown  3300mV     0mA
 1800mV  3300mV
   c1108c20.mmc:slot@1           0                                 0mA
    0mV     0mV

(my kernel build includes two more changes on top of Kevin's v5.1/dt
branch which add two new regulators: it enables the RTC and the SDHC
MMC controller, but these are not related to USB at all)

USB ist still not working for me, but I believe my problem is
different to yours.


Regards

Martin

--0000000000002656590581919e73
Content-Type: application/x-patch; name="vbus-supply.patch"
Content-Disposition: attachment; filename="vbus-supply.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jrzgyt8b0>
X-Attachment-Id: f_jrzgyt8b0

ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL21lc29uOGItb2Ryb2lkYzEuZHRzIGIvYXJj
aC9hcm0vYm9vdC9kdHMvbWVzb244Yi1vZHJvaWRjMS5kdHMKaW5kZXggMGYwYTQ2ZGRmM2ZmLi40
NGI5ZTZjYmUyZWQgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL21lc29uOGItb2Ryb2lk
YzEuZHRzCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL21lc29uOGItb2Ryb2lkYzEuZHRzCkBAIC0x
MTgsNiArMTE4LDIyIEBACiAJCQkgIDE4MDAwMDAgMT47CiAJfTsKIAorCXVzYl92YnVzOiByZWd1
bGF0b3ItdXNiLXZidXMgeworCQljb21wYXRpYmxlID0gInJlZ3VsYXRvci1maXhlZCI7CisKKwkJ
cmVndWxhdG9yLW5hbWUgPSAiVVNCX1ZCVVMiOworCQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9
IDw1MDAwMDAwPjsKKwkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8NTAwMDAwMD47CisKKwkJ
dmluLXN1cHBseSA9IDwmcDV2MD47CisKKwkJLyoKKwkJICogc2lnbmFsIG5hbWUgZnJvbSBzY2hl
bWF0aWNzOiBQV1JFTgorCQkgKi8KKwkJZ3BpbyA9IDwmZ3Bpb19hbyBHUElPQU9fNSBHUElPX0FD
VElWRV9ISUdIPjsKKwkJZW5hYmxlLWFjdGl2ZS1oaWdoOworCX07CisKIAl2Y2NfMXY4OiByZWd1
bGF0b3ItdmNjLTF2OCB7CiAJCS8qCiAJCSAqIFJJQ0hURUsgUlQ5MTc5IGNvbmZpZ3VyZWQgZm9y
IGEgZml4ZWQgb3V0cHV0IHZvbHRhZ2Ugb2YKQEAgLTI5OSw0ICszMTUsNSBAQAogCiAmdXNiMSB7
CiAJc3RhdHVzID0gIm9rYXkiOworCXZidXMtc3VwcGx5ID0gPCZ1c2JfdmJ1cz47CiB9Owo=
--0000000000002656590581919e73
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--0000000000002656590581919e73--
