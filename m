From: Thor Thayer <tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv6 2/3] devicetree: Addition of the Altera SDRAM EDAC
Date: Sun, 22 Jun 2014 13:31:51 -0500
Message-ID: <CAF03EBfK4kjKZxdcUGKNF91AYnad8ReoAY8oqAHUChQ4kN4dyg@mail.gmail.com>
References: <1403306523-4174-2-git-send-email-tthayer@altera.com>
	<1403306523-4174-3-git-send-email-tthayer@altera.com>
	<20140621090618.GB8053@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140621090618.GB8053-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Thor Thayer <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Jun 21, 2014 at 4:06 AM, Steffen Trumtrar
<s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> On Fri, Jun 20, 2014 at 06:22:02PM -0500, tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org wrote:
>> From: Thor Thayer <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
>>
>> Addition of the Altera SDRAM EDAC bindings and device tree changes
>>
>> v2: Changes to SoC EDAC source code.
>>
>> v3: Fix typo in device tree documentation.
>>
>> v4,v5: No changes - bump version for consistency.
>>
>> v6: Assign ECC registers in SDRAM controller to EDAC
>>
>> Signed-off-by: Thor Thayer <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
>> ---
>>  .../bindings/arm/altera/socfpga-sdram-edac.txt     |   15 +++++++++++++++
>>  arch/arm/boot/dts/socfpga.dtsi                     |    6 ++++++
>>  2 files changed, 21 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-sdram-edac.txt
>>
>> diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-sdram-edac.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-sdram-edac.txt
>> new file mode 100644
>> index 0000000..540c9cf
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/altera/socfpga-sdram-edac.txt
>> @@ -0,0 +1,15 @@
>> +Altera SOCFPGA SDRAM Error Detection & Correction [EDAC]
>> +
>> +Required properties:
>> +- compatible : should contain "altr,sdram-edac";
>> +- reg : should contain the ECC register range in sdram
>> +        controller (address and length).
>> +- interrupts : Should contain the SDRAM ECC IRQ in the
>> +     appropriate format for the IRQ controller.
>> +
>> +Example:
>> +     sdramedac@0 {
>> +             compatible = "altr,sdram-edac";
>> +             reg = <0xffc2502C 0x28>;
>> +             interrupts = <0 39 4>;
>> +     };
>> diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
>> index 310292e..fe9832e 100644
>> --- a/arch/arm/boot/dts/socfpga.dtsi
>> +++ b/arch/arm/boot/dts/socfpga.dtsi
>> @@ -687,6 +687,12 @@
>>                       reg = <0xffc25000 0x4>;
>>               };
>>
>> +             sdramedac@0 {
>                          ^^^
>
> Please fix the baseaddress (also in the binding doc).
>

Thanks. Good catch. I will fix this.

>> +                     compatible = "altr,sdram-edac";
>> +                     reg = <0xffc2502C 0x28>;
>> +                     interrupts = <0 39 4>;
>> +             };
>> +
>>               rst: rstmgr@ffd05000 {
>>                       compatible = "altr,rst-mgr";
>>                       reg = <0xffd05000 0x1000>;
>
> --
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
