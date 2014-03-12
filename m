From: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v2 04/14] mtd: nand: define struct nand_timings
Date: Wed, 12 Mar 2014 17:46:53 +0100
Message-ID: <53208F7D.8090104@gmail.com>
References: <1391006064-28890-1-git-send-email-b.brezillon.dev@gmail.com> <1391006064-28890-5-git-send-email-b.brezillon.dev@gmail.com> <531DC1A4.7010208@gmail.com> <20140311185554.GD31835@obsidianresearch.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDE6NB73YAMBBCE7QKMQKGQEFEGBVVY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140311185554.GD31835-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 11/03/2014 19:55, Jason Gunthorpe a =E9crit :
> On Mon, Mar 10, 2014 at 02:44:04PM +0100, Boris BREZILLON wrote:
>
>> Some timings are missing here (see Table 55 in the ONFI spec):
> Right..
>
> The 'mode' covers only the raw electrical parameters needed to
> exchange commands, other timings cover the commands
> themselves. Notably the timing mode does not alter those parameters.
>
> To me it seems tidy to keep the 'mode' timings contained in their own
> struct and find other homes for the other parameters.
>
>> -tR
>> -tBERS
>> -tCCS
>> -tPLEBSY
>> -...
>>
>> I see at least 3 of those timings that could be useful (for the moment) =
:
>> - tR: this one should be used to fill the chip_delay field
>> - tPROG and tBERS: could be used within nand_wait to choose the timeo
>>    value appropriately.
> IIRC these timing values are really only necessary if the controller
> does not support the READY/BUSY input, in that case drivers typically
> seem to use 'chip_delay' which is the maximum possible command
> execution time (a sleep long enough to guarentee that READY/BUSY is
> de-asserted).
You're right about tR (or chip_delay): it's only used when there are no=20
R/B pin.
I experienced it when I tried the RB_NONE case in the sunxi driver: the=20
default
chip_delay set by the NAND core code was too small to fit the NAND chip=20
requirements.

Anyway, I really think the chip_delay field should be set according to=20
NAND chip
characteristics not harcoded in NAND controller driver code (as=20
currently done).

tPROG and tBERS, would be used in nand_wait function and do not depend=20
on the R/B pin.
These are just used as timeouts.

>
>> Or should I create a new struct for these timings ?
>> In the latter case how should I name it ?
> struct onfi_command_timings ?

I'm not a big fan of this name. I think timing structs should not=20
contain onfi in their
names, because these timings are also available on non ONFI chips.

Moreover, these timings are also part of the SDR NAND timings, they are=20
just retrieved
using another method when interfacing with an ONFI chip.

Maybe we should change the nand_sdr_timings struct name too.

What do you think ?

Best Regards,

Boris

>
> Regards,
> Jason

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
