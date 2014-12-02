From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [Patch v2 1/2] gpio: add GPIO hogging mechanism
Date: Tue, 2 Dec 2014 15:29:46 +0100
Message-ID: <CACRpkdZcNcPBYQM438CZJx1gYst9BFBSTj-3Qv2aPGF9pdWa5g@mail.gmail.com>
References: <1416527684-19017-1-git-send-email-bparrot@ti.com>
	<1416527684-19017-2-git-send-email-bparrot@ti.com>
	<CAAVeFu+VZiuzobB7McSAUehKUHJjBv1o8ZpYjSHJAKjr3o5wTA@mail.gmail.com>
	<20141201163639.GI25249@lukather>
	<CAAVeFuLTupDenZdSi8KO+dYsf-ekcqjsDaQ2GEzYpBG34oF7Zw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAVeFuLTupDenZdSi8KO+dYsf-ekcqjsDaQ2GEzYpBG34oF7Zw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Benoit Parrot <bparrot@ti.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, Jiri Prchal <jiri.prchal@aksignal.cz>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 2, 2014 at 3:13 PM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Tue, Dec 2, 2014 at 1:36 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:

>> The only thing I'd like to have would be that the request here would
>> be non-exclusive, so that a later driver would still be allowed later
>> on to request that GPIO later on and manage it itself (ideally using
>> the usual gpiod_request function).
>
> Actually we have a plan (and I have some code too) to allow multiple
> consumers per GPIO. Although like Benoit I wonder why you would want
> to hog a GPIO and then request it properly later. Also, that probably
> means we should abandon the hog since it actively drives the line and
> would interfere with the late requested. How to do that correctly is
> not really clear to me.

I don't get the usecase. A hogged GPIO is per definition hogged.
This sounds more like "initial settings" or something, which is another
usecase altogether.

Yours,
Linus Walleij
