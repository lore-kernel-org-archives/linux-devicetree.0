From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2 0/4] dw_apb_timer: osc as sched_clock, clocks and
 clocksource_of support
Date: Wed, 12 Jun 2013 10:53:06 -0700
Message-ID: <CAOesGMjogjjFcvKbQtyY+DpW5WOcoo7mSxfqeyre22vP5-OUjA@mail.gmail.com>
References: <201306041136.09566.heiko@sntech.de>
	<201306121055.53685.heiko@sntech.de>
	<CACRpkdZmDWTy=U_rhU9uVXy9N5jEOk6qQingiO5kb+Kc2WkL3w@mail.gmail.com>
	<20130612175142.GB2760@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130612175142.GB2760@quad.lixom.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Jamie Iles <jamie@jamieiles.com>, Dinh Nguyen <dinguyen@altera.com>, Grant Likely <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rob Herring <rob.herring@calxeda.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Baruch Siach <baruch@tkos.co.il>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 12, 2013 at 10:51 AM, Olof Johansson <olof@lixom.net> wrote=
:
> On Wed, Jun 12, 2013 at 11:46:37AM +0200, Linus Walleij wrote:
>> On Wed, Jun 12, 2013 at 10:55 AM, Heiko St=FCbner <heiko@sntech.de> =
wrote:
>>
>> > with clocksource_of conversion of picoxcell and socfpga, this seri=
es stands on
>> > its own. Is anybody going to pick it up?
>>
>> I would suggest you send a pull request to the ARM SoC maintainers.
>> This is where most clocksource code and refactorings related to
>> ARM things come in.
>
> Yeah, or we can pick them up and apply from the list too. Have you co=
llected
> all Acked-bys and reposted a final version? If not, cc arm@kenrel.org=
 on the
> final posting.

Nevermind, I just came across the pull request. :-)


-Olof
