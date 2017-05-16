From: Marcin Wojtas <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: marvell: mcbin: add sdhci
Date: Tue, 16 May 2017 17:42:19 +0200
Message-ID: <CAPv3WKeK9Z_1dGvBnc=NJrD7+nZOgf60iCNvvTkFGcP7GSyt=Q@mail.gmail.com>
References: <E1dAcn4-0004z2-Fl@rmk-PC.armlinux.org.uk> <CAPv3WKf4GcOc7g-2yMCjGN4HrftDL0Ro6jHErQL8-zSH-tC10w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPv3WKf4GcOc7g-2yMCjGN4HrftDL0Ro6jHErQL8-zSH-tC10w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Re-send in plain text.

2017-05-16 17:40 GMT+02:00 Marcin Wojtas <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>:
> Russel,
>
> 2017-05-16 15:45 GMT+02:00 Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>:
>>
>> Add sdhci support for MACCHIATOBin boards.  This uses the AP806 SDHCI
>> for eMMC and CP110 master for the SD card slot.
>>
>> Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
>> ---
>>
>> This version labels up the uSD connector, adds the vqmmc regulator for
>> the uSD (the regulator itself already present in the DT), and supports
>> the card detect signal.
>>
>> For eMMC, this version adds the vqmmc regulator, which again is already
>> present in the DT, marks it as not supporting SD or SDIO, and also
>> includes "slow mode" since testing with previous versions of the driver
>> have shown that selecting faster speeds results in errors.
>>
>>  arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts |   23
>> ++++++++++++++++++++++
>>  1 file changed, 23 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
>> b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
>> index cc167e05941a..60111ed3234a 100644
>> --- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
>> +++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
>> @@ -95,6 +95,21 @@
>>         status = "okay";
>>  };
>>
>> +&ap_sdhci0 {
>> +       bus-width = <8>;
>> +       /*
>> +        * Not stable in HS modes - phy needs "more calibration", so add
>> +        * the "slow-mode" and disable SDR104, SDR50 and DDR50 modes.
>> +        */
>> +       marvell,xenon-phy-slow-mode;
>
>
> FYI, this property is by default present in armada-ap806.dtsi.
>
> Marcin
>
>>
>> +       no-1-8-v;
>> +       no-sd;
>> +       no-sdio;
>> +       non-removable;
>> +       status = "okay";
>> +       vqmmc-supply = <&v_vddo_h>;
>> +};
>> +
>>  &cpm_i2c0 {
>>         clock-frequency = <100000>;
>>         status = "okay";
>> @@ -105,6 +120,14 @@
>>         status = "okay";
>>  };
>>
>> +&cpm_sdhci0 {
>> +       /* U6 */
>> +       broken-cd;
>> +       bus-width = <4>;
>> +       status = "okay";
>> +       vqmmc-supply = <&v_3_3>;
>> +};
>> +
>>  &cpm_usb3_0 {
>>         /* J38? - USB2.0 only */
>>         status = "okay";
>> --
>> 2.7.4
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
