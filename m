From: boris brezillon <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC PATCH 3/9] of: mtd: add NAND timings retrieval support
Date: Wed, 15 Jan 2014 16:09:01 +0100
Message-ID: <52D6A48D.4080302@overkiz.com>
References: <1389190924-26226-1-git-send-email-b.brezillon@overkiz.com> <1389190924-26226-4-git-send-email-b.brezillon@overkiz.com> <20140108183418.GA12358@obsidianresearch.com> <52CDA032.3010804@overkiz.com> <20140108191339.GB12358@obsidianresearch.com> <52CE5F82.6070802@overkiz.com> <20140109173505.GB8899@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140109173505.GB8899-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Jason,

On 09/01/2014 18:35, Jason Gunthorpe wrote:
> On Thu, Jan 09, 2014 at 09:36:18AM +0100, boris brezillon wrote:
>
>>> You might want to check if you can boil down the DT timings from th=
e
>>> huge list to just an ONFI mode number..
>> Sure, but the sunxi driver needs at least 19 of them...
> So does mvebu's NAND driver..
>
> What I ment was you could have a
>
>    onfi,nand-timing-mode =3D 0
>
> in the DT. Each of the modes defines all ~19 parameters, higher modes
> are faster.
>
> Pick a mode value that fits all the parameters of the connected
> non-ONFI flash.
>
> This would be instead of defining each parameter
> individually.. Provide some helpers to convert from a onfi mode numbe=
r
> to all the onfi defined timing parameters so that drivers can
> configure the HW..

Are you suggesting we should provide a function that converts these
modes into a nand_timings struct, or just use the timing modes and
let the NAND controller drivers configure its IP accordingly ?

I found the ONFI timing tables in this document:

www.*onfi*.org/~/media/*ONFI*/specs/*onfi*_3_1_spec.pdf=E2=80=8E (chapt=
er 4.16).

I suppose my nand_timings struct should use the names described
page 110-111 (at least if we decide to use nand_timings and not
nand_timing_modes), right ?

Best Regards,

Boris

>
> Jason

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
