MIME-Version: 1.0
Date: Mon, 7 Jan 2019 12:37:20 -0600
References: <20190107175907.45268-1-tony@atomide.com>
In-Reply-To: <20190107175907.45268-1-tony@atomide.com>
Message-ID: <CAL_Jsq+kzUv=U3fAY=r1jh9nMsi+m8KFg50aeh-Ap9gdK3rstA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: omap4-droid4: Fix typo in cpcap IRQ flags
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Tony Lindgren <tony@atomide.com>
Cc: linux-omap <linux-omap@vger.kernel.org>, =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Jan 7, 2019 at 11:59 AM Tony Lindgren <tony@atomide.com> wrote:
>
> We're now getting the following error:
>
> genirq: Setting trigger mode 1 for irq 230 failed
> (regmap_irq_set_type+0x0/0x15c)
> cpcap-usb-phy cpcap-usb-phy.0: could not get irq dp: -524
>
> This is because of a typo in the irq flags. Really these interrupts
> are LEVEL, but before we change them we need to test them. So let's
> do a minimal fix first.

Hopefully, you mean a driver fix later and not changing the DT again?
A 0 flag is correct if the type is not programmable which I'd guess is
the case here.

Rob
