From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 08/13] clk: add ARM syscon ICST device tree bindings
Date: Fri, 23 Oct 2015 11:48:09 +0200
Message-ID: <CACRpkdbXLs7hP=8WH6uK_3mQQEy4Y6TJsjpt4=LpeT=jmF-9Kw@mail.gmail.com>
References: <1444916813-31024-1-git-send-email-linus.walleij@linaro.org>
	<1444916813-31024-9-git-send-email-linus.walleij@linaro.org>
	<20151015192325.GN4558@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151015192325.GN4558-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 15, 2015 at 9:23 PM, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> On 10/15, Linus Walleij wrote:

>> +Required properties:
>> +- lock-offset: the offset address into the system controller where the
>> +  unlocking register is located
>> +- vco-offset: the offset address into the system controller where the
>> +  ICST control register is located (even 32 bit address)
>
> Is there any reason why we don't use a reg property for this?

Usually reg = <> is used with two (or more) tokens:

reg = <phys_addr size>;

The exception being things like I2C addresses which
are just one token.

Since in this case, there is a "mother" reg property in the
syscon-compatible node, which we are indexing into,
it is confusing to use the same name for subnodes.

Also there is a bunch of precedents doing it like this
for sybdevices to system controllers, just
git grep offset Documentation/devicetree/bindings
will give you a bunch of them.

(Fixing the spelling comments.)

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
