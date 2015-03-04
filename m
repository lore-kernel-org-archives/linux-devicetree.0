From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [Patch v6 0/2] gpio: add GPIO hogging mechanism
Date: Wed, 4 Mar 2015 10:53:06 +0100
Message-ID: <CACRpkdb+vo9BvFaG1ZBLLm9HqpQ89ckTwkXKmR5vwXNKWWrtrQ@mail.gmail.com>
References: <AAE35E953C746D4784A1A0C604EFEA714DFBD819@DLEE10.ent.ti.com>
	<20150218172341.GA3851@ti.com>
	<20150219214639.GB8656@deathray>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150219214639.GB8656@deathray>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Welling <mwelling@ieee.org>
Cc: Benoit Parrot <bparrot@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Jiri Prchal <jiri.prchal@aksignal.cz>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 19, 2015 at 10:46 PM, Michael Welling <mwelling@ieee.org> wrote:
> On Wed, Feb 18, 2015 at 11:23:42AM -0600, Benoit Parrot wrote:
>> Gentle ping.
>>
>> Is there any chance this will make it in 3.21?
>>
>> Benoit
>>
>
> Is there a reason that the pin has to be "hogged"?
>
> Couldn't the pin be released after configuration for eventual use in the userspace?

That can be added on later when/if we add support for
mapping pins to userspace.

If you know you want to give it to userspace and how to set
it up properly you certainly know what to name it too, so for
pins explicitly exported to userspace we need a mechanism
to name them and export them explicitly (without having userspace
exporting them to itself with that brain-damaged sysfs interface).

Yours,
Linus Walleij
