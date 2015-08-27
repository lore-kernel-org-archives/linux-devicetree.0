From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH v10 1/5] mtd: nand: vf610_nfc: Freescale NFC for VF610,
 MPC5125 and others
Date: Thu, 27 Aug 2015 10:25:15 -0700
Message-ID: <9ccab0ac37e59f58b16718708653d7ea@agner.ch>
References: <1438594050-4595-1-git-send-email-stefan@agner.ch>
 <1438594050-4595-2-git-send-email-stefan@agner.ch>
 <20150825201631.GK81844@google.com>
 <bf1ed158fe08b51c4668faffde44083f@agner.ch>
 <20150827163421.GX81844@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150827163421.GX81844-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marb-Z4QKGCRq86k@public.gmane.org, aaron-yuhzfaV+M/Wz3Dx2OeFgIA@public.gmane.org, bpringlemeir-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, albert.aribaud-iEu9NFBzPZE@public.gmane.org, klimov.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Bill Pringlemeir <bpringlemeir-ygJ1pmMJ17cAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2015-08-27 09:34, Brian Norris wrote:
> On Wed, Aug 26, 2015 at 06:02:31PM -0700, Stefan Agner wrote:
>> On 2015-08-25 13:16, Brian Norris wrote:
>> > On Mon, Aug 03, 2015 at 11:27:26AM +0200, Stefan Agner wrote:
>> >> diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
>> >> new file mode 100644
>> >> index 0000000..5c8dfe8
>> >> --- /dev/null
>> >> +++ b/drivers/mtd/nand/vf610_nfc.c
>> >> @@ -0,0 +1,645 @@
>> >
>> > ...
>> >
>> >> +/*
>> >> + * This function supports Vybrid only (MPC5125 would have full RB and four CS)
>> >> + */
>> >> +static void vf610_nfc_select_chip(struct mtd_info *mtd, int chip)
>> >> +{
>> >> +#ifdef CONFIG_SOC_VF610
>> >
>> > Why the #ifdef? I don't see anything compile-time specific to SOC_VF610.
>> >
>> > If this is trying to handle the comment above ("This function supports
>> > Vybrid only (MPC5125 would have full RB and four CS)") then that's the
>> > wrong way of doing it, as you need to support multiplatform kernels.
>> > You'll need to have a way to differentiate the different platform
>> > support at runtime, not compile time.
>>
>> Yes it is trying to handle the comment above. Well, the other two
>> platforms I am aware of are also different architectures... (PowerPC and
>> ColdFire). I think we won't have a multi-architecture kernel anytime
>> soon,
> 
> Ha, right. Sorry, I don't really know this particular IP.
> 
>> hence I think removing the code at compile time is the right thing
>> todo.
> 
> I don't believe that conclusion follows though.
> 
>> However, probably CONFIG_SOC_VF610 is the wrong symbol then, I could
>> just use CONFIG_ARM and add a comment that this might be different on
>> another other ARM SoC than VF610.
>>
>> Just checked CodingStyle, and I see that IS_ENABLED is the preferred way
>> for conditional compiling.
>>
>> So my suggestion:
>>
>> static void vf610_nfc_select_chip(struct mtd_info *mtd, int chip)
>> {
>> 	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
>> 	u32 tmp = vf610_nfc_read(nfc, NFC_ROW_ADDR);
>>
>> 	if (!IS_ENABLED(CONFIG_ARM))
>> 		return;
>>
>> 	/*
>> 	 * This code is only tested on the ARM platform VF610
>> 	 * PowerPC based MPC5125 would have full RB and four CS
>> 	 */
>> ....
>>
>> With that the compiler should be able to remove this (currently) ARM
>> VF610 specific code on the other supported architectures...
>>
>> What do you think?
> 
> The code structure isn't bad, and yes, IS_ENABLED() would be preferable,
> as it removes some of the problems with #ifdef, but I still don't think
> the processor architecture has much to do with the version of the IP.

Well yes, the processor architecture has probably not much to do with
the IP version.

However, that particular problem, the wiring up of the CS/RB signals, is
probably more SoC (as a whole) specific, and how that is done might have
some relation which architecture is in use...

I do not have a strong opinion on this, so we might as well go with the
run-time distinction using compatible. If there are different IP
variants within one architecture, we anyway would need to do that.

> The canonical way of distiguishing per-IP revisions is to key on the
> compatible property. So you'd have some kind of enum, which would
> currently only have an entry for VF610. i.e.:
> 
> 	/* MPC5125 not yet supported */
> 	if (nfc->revision != NAND_VFC610)
> 		return;
> 

Ok, just checked, I can use the data field of the of table to assign
specific data to a compatible string, similar to how pxa3xx_nand.c does
it.

--
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
