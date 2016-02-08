From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 1/1 v2] imx6q-wandboard-revb1.dts: use unique machine name
Date: Mon, 8 Feb 2016 01:25:15 +0100
Message-ID: <56B7E06B.2060701@gmx.de>
References: <1454758226-4561-1-git-send-email-xypron.glpk@gmx.de>
 <1454760419-4822-1-git-send-email-xypron.glpk@gmx.de>
 <CAOCHtYiHUgcw6Vzdp8EmD_5+d52fhpuj-oSCFwt_3J5xAncCGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOCHtYiHUgcw6Vzdp8EmD_5+d52fhpuj-oSCFwt_3J5xAncCGw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Nelson <robertcnelson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, George Joseph <george.joseph-H+B1fhQ+CpcEVd8bySq3Wg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <fabio.estevam-vgrsnd+bvIE@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 08.02.2016 00:52, Robert Nelson wrote:
> On Sat, Feb 6, 2016 at 6:06 AM, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org> wrote:
>> Downstream packages like Debian flash-kernel use
>> /proc/device-tree/model
>> to determine which dtb file to install.
>>
>> Hence each dts in the Linux kernel should provide a unique model identifier.
>>
>> https://lkml.org/lkml/2014/7/8/579 created the new file
>> imx6q-wandboard-revb1.dts but used the same model identifier
>> as in imx6q-wandboard.dts.
>>
>> This patch provides a unique model identifier for revision B1 of
>> the Wandboard Quad.
>>
>> v2:
>>         correct name of referenced Debian package
>>
>> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/imx6q-wandboard-revb1.dts | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/imx6q-wandboard-revb1.dts b/arch/arm/boot/dts/imx6q-wandboard-revb1.dts
>> index 20bf3c2..9207d80 100644
>> --- a/arch/arm/boot/dts/imx6q-wandboard-revb1.dts
>> +++ b/arch/arm/boot/dts/imx6q-wandboard-revb1.dts
>> @@ -13,7 +13,7 @@
>>  #include "imx6qdl-wandboard-revb1.dtsi"
>>
>>  / {
>> -       model = "Wandboard i.MX6 Quad Board";
>> +       model = "Wandboard i.MX6 Quad Board rev B1";
> 
> Okay, this seems a little silly....
> 
> The wandboard has 5 versions:
> 
> solo: imx6dl-wandboard-revb1.dts
> 
> model = "Wandboard i.MX6 Dual Lite Board";
> 
> dual rev b: imx6dl-wandboard-revb1.dts
> 
> model = "Wandboard i.MX6 Dual Lite Board";
> 
> dual rev c: imx6dl-wandboard.dts
> 
> model = "Wandboard i.MX6 Dual Lite Board";
> 
> quad rev b: imx6q-wandboard-revb1.dts
> model = "Wandboard i.MX6 Quad Board"; - > model = "Wandboard i.MX6
> Quad Board rev B1";
> 
> quad rev c: imx6q-wandboard.dts
> model = "Wandboard i.MX6 Quad Board";
> 
> 
> Do you guys see the issue?  Either we change them "ALL", rev b or rev c...
> 
> Or "flash-kernel" needs to learn to copy more then one dtb (in this
> case 5 *.dtb's)
> 
> PS, u-boot already can boot on all these with the same SPL/u-boot
> image and detect which board and load the correct device tree binary..
> 
> Regards,
> 
Hello Robert,

I only see four dts files mentioned in your mail (solo using the same as
dual rev B1).

We do not know if imx6dl-wandboard.dts and imx6q-wandboard.dts
will support future revisions of the boards. So it doesn't make
much sense to mark them as restricted to revision C1.

You are right in that we should add a change to
imx6dl-wandboard-revb1.dts to the same patch.

Best regards

Heinrich Schuchardt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
