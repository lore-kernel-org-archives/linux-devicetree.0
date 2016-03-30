From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/7] ARM: dts: skeleton: add unit name to memory node
Date: Wed, 30 Mar 2016 14:36:14 +0200
Message-ID: <CAGhQ9VxoWQG3g-9o63yUCaTRuivN=gikA61MeAWmvGa5vka3Vw@mail.gmail.com>
References: <1459290646-3592-1-git-send-email-manabian@gmail.com>
	<1459290646-3592-3-git-send-email-manabian@gmail.com>
	<20160330110611.GB25354@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160330110611.GB25354@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

On 30 March 2016 at 13:06, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> On Wed, Mar 30, 2016 at 12:30:41AM +0200, Joachim Eastwood wrote:
>> Add unit name to memory to remove the following warning:
>>  Warning (unit_address_vs_reg): Node /memory has a reg or ranges
>>                               property, but no unit name
>
> If anything, it would be better to get rid of the memory node from the
> skeleton DTs.

Yes, I agree and as Vladimir notes just by adding a unit name we
create duplicate memory nodes.

I'll send an updated patch set once Rob has a change to look at it also.


> For DTs which have a memory node there's no problem, and DTs which
> expect a bootlaoder to fill things in have a logical place to document
> that fact.

I'll take a look at which DTs that currently doesn't have a memory and add it.


Thanks for looking.


regards,
Joachim Eastwood
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
