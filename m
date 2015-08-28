From: Bill Pringlemeir <bpringle-rieW9WUcm8FFJ04o6PK0Fg@public.gmane.org>
Subject: Re: [PATCH v10 2/5] mtd: nand: vf610_nfc: add hardware BCH-ECC support
Date: Fri, 28 Aug 2015 17:14:08 -0400
Message-ID: <BLU436-SMTP79A4D637801F08C772536AB86E0@phx.gbl>
References: <1438594050-4595-1-git-send-email-stefan@agner.ch>
	<1438594050-4595-3-git-send-email-stefan@agner.ch>
	<ff2e2716578a1ae5f0c4b0e0ca8bbdc3@agner.ch>
	<20150825195411.GJ81844@google.com>
	<07a479863eef4c53ab2ef6ef85321680@agner.ch>
	<20150826213448.GU81844@google.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150826213448.GU81844-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> (Brian Norris's message of
	"Wed, 26 Aug 2015 14:34:48 -0700")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, bpringlemeir-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marb-Z4QKGCRq86k@public.gmane.org, aaron-yuhzfaV+M/Wz3Dx2OeFgIA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, albert.aribaud-iEu9NFBzPZE@public.gmane.org, klimov.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Bill Pringlemeir <bpringlemeir-ygJ1pmMJ17cAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On 26 Aug 2015, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:

> On Wed, Aug 26, 2015 at 10:57:38AM -0700, Stefan Agner wrote:
>> When printing the ECC error count on ECC fail when reading an erased
>> NAND flash, the numbers of bit flips (stuck at zero) seem to widely
>> correlate with the number returned by the controller. While it seems
>> to correlate widely, there are exceptions, as discussed in the
>> thread: http://thread.gmane.org/gmane.linux.ports.arm.kernel/295424

>> Maybe this is an artifact of the ECC algorithm we just
>> can't/shouldn't rely on? I am not sure where this originated, I did
>> not found any indication in the reference manual about what that
>> value contains in the error case.

> Doesn't sound too reliable to me. And I'm not sure even if it was
> reliable, that it would provide much value. We have to a lot of
> re-counting anyway, so we might as well just be using our own
> threshold.  Or maybe I'm missing the point.

>> Bill, do you have an idea why we used that value as threshold in
>> early implementations?

>> Otherwise I also think we should just drop the use of this value.

Yes, using this value is not especially useful if we re-read with ECC
disabled to count the bit flips for erased pages.   I think this is what
Stefan has done in the 11th patch set.

-- 
Married men live  longer than single men, but married  men are much more
willing to die - Dilworth
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
