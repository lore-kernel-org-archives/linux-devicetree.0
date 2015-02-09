From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: gpio-pxa: getting GPIOs by devicetree phandle broken
Date: Mon, 09 Feb 2015 09:02:51 +0100
Message-ID: <87r3tz7bro.fsf@free.fr>
References: <CAOjnSCajhwdRVZUO99KL-9PF6HitZen04MoLKoDUDr_5=iS7kw@mail.gmail.com>
	<CAAVeFu+yf6Wf6MspiDLiWwQkMwMvimNa0SpMK_yO_9X07UecEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAAVeFu+yf6Wf6MspiDLiWwQkMwMvimNa0SpMK_yO_9X07UecEw@mail.gmail.com>
	(Alexandre Courbot's message of "Mon, 9 Feb 2015 15:11:23 +0900")
Sender: linux-gpio-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Tyler Hall <tylerwhall@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Daniel Mack <zonque@gmail.com>, Hans Holmberg <hans.holmberg@intel.com>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Howard Cochran <cochran@lexmark.com>
List-Id: devicetree@vger.kernel.org

Alexandre Courbot <gnurou@gmail.com> writes:

> Adding Robert who reported the same thing.
>
> On Sat, Feb 7, 2015 at 6:28 AM, Tyler Hall <tylerwhall@gmail.com> wrote:
>> 1. Require child nodes in DT for each bank
>
> This would break DT compatibility.
Agreed.

>
>> 2. Refactor gpio-pxa to only register one gpiochip
>
> Sounds better, especially since this would reflect the hardware more
> accurately. One DT node should translate into one GPIO chip.
Could I know where "should translate into _one_ GPIO chip" comes from ? Is it a
specification, or is it a new rule we're creating ?

And if it's a new rule, I'd like to know what backs it up .

> problem is that I'm afraid several other drivers are doing the same
> thing and thus are now similarly broken.
That's also what I'm afraid of.

> The following is also likely to work as a workaround, but I would not
> go as far as saying this should be taken as a fix. Hans, since you
> wrote 7b8792b, could we have your input on this?
I was going to suggest the very same approach. If this one (or a similar one)
doesn't meet success, then my weekend of revert queries is not over ... and I
don't like reverts.

Cheers.

-- 
Robert
