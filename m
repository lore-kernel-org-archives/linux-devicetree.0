From: Anders Berg <anders.berg-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>
Subject: Re: [PATCH v3 0/6] Add platform support for LSI AXM55xx
Date: Thu, 15 May 2014 14:37:26 +0200
Message-ID: <CAE0=X_15Yk3VhHTwG-piA_eYL1mKW9wu_Szp-yL0YyfL8m0ecA@mail.gmail.com>
References: <cover.1400072260.git.anders.berg@avagotech.com>
	<6334605.NlytHCzYVP@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6334605.NlytHCzYVP@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 14, 2014 at 8:56 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Wednesday 14 May 2014 20:37:55 Anders Berg wrote:
>>
>> This is version 3 of this series to introduces basic platform support for the LSI
>> AXM5516 SoC.
>>
>> No major changes since v2. Ready to be applied to the arm-soc tree?
>
> I think it's good, but I'm not sure if we should put them all into arm-soc.
> There are no dependencies between the drivers that I can see, so why not
> merge the clock and reset drivers through the individual subsystem maintainers?
>

After suggestions from Mike on the clk driver (and it's dts binding)
I've done an updated clock driver patch - and a dependency surfaced...
The file <dt-bindings/clock/lsi,axm5516-clks.h>. Which way should this
take, arm-soc or Mikes clk tree? Perhaps this is a reason to take it
all through arm-soc?

/Anders
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
