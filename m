From: Zhi Li <lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 1/7] ARM: dts: imx: imx7d-sbd remove fixed can2-3v3 regulator
Date: Wed, 30 Sep 2015 09:57:09 -0500
Message-ID: <CAHrpEqSSnLPeM06+6wqnFOjWooGF7OS_JvfTRH2OLAg64+xcWw@mail.gmail.com>
References: <1443477401-17238-1-git-send-email-aalonso@freescale.com>
	<20150930015622.GC15771@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150930015622.GC15771@tiger>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Adrian Alonso <aalonso-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Huang Anson <Anson.Huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Yibin Gong <yibin.gong-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Nitin Garg <nitin.garg-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Dong Aisheng <b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 29, 2015 at 8:56 PM, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Sep 28, 2015 at 04:56:35PM -0500, Adrian Alonso wrote:
>> Remove incorrect can2-3v3 fixed regulator, imx7d-sdb doesn't
>> have a dedicated can2 fixed regulator instead it shares PERI_3V3
>> fixed regulator (RT8070ZS) which is enabled by default (hardwired)
>> from pmic pfuze3000 NVCC_3V3 power rail.
>
> @Frank, can you please confirm it?

@Aisheng,
            Can you confirm it?

best regards
Frank Li

>
>>
>> Signed-off-by: Adrian Alonso <aalonso-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>
> Please stop sending patch to shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, and
> shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org is good enough.
>
>> ---
>> Changes for V7: New patch in series
>
> I do not understand why the patch has to be included in this series.
>
> Shawn
>
>>
>>  arch/arm/boot/dts/imx7d-sdb.dts | 11 +----------
>>  1 file changed, 1 insertion(+), 10 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.dts
>> index 8059458..83f0053 100644
>> --- a/arch/arm/boot/dts/imx7d-sdb.dts
>> +++ b/arch/arm/boot/dts/imx7d-sdb.dts
>> @@ -78,16 +78,7 @@
>>                       enable-active-high;
>>               };
>>
>> -             reg_can2_3v3: regulator@2 {
>> -                     compatible = "regulator-fixed";
>> -                     reg = <2>;
>> -                     regulator-name = "can2-3v3";
>> -                     regulator-min-microvolt = <3300000>;
>> -                     regulator-max-microvolt = <3300000>;
>> -                     gpio = <&gpio1 7 GPIO_ACTIVE_LOW>;
>> -             };
>> -
>> -             reg_vref_1v8: regulator@3 {
>> +             reg_vref_1v8: regulator@2 {
>>                       compatible = "regulator-fixed";
>>                       reg = <3>;
>>                       regulator-name = "vref-1v8";
>> --
>> 2.1.4
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
