Return-Path: <SRS0=L0QX=PP=atomide.com=tony@kernel.org>
Date: Mon, 7 Jan 2019 10:45:43 -0800
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] ARM: dts: omap4-droid4: Fix typo in cpcap IRQ flags
Message-ID: <20190107184543.GH5544@atomide.com>
References: <20190107175907.45268-1-tony@atomide.com>
 <CAL_Jsq+kzUv=U3fAY=r1jh9nMsi+m8KFg50aeh-Ap9gdK3rstA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+kzUv=U3fAY=r1jh9nMsi+m8KFg50aeh-Ap9gdK3rstA@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-omap <linux-omap@vger.kernel.org>, =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>, devicetree@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
List-ID: <devicetree@vger.kernel.org>

* Rob Herring <robh@kernel.org> [190107 18:37]:
> On Mon, Jan 7, 2019 at 11:59 AM Tony Lindgren <tony@atomide.com> wrote:
> >
> > We're now getting the following error:
> >
> > genirq: Setting trigger mode 1 for irq 230 failed
> > (regmap_irq_set_type+0x0/0x15c)
> > cpcap-usb-phy cpcap-usb-phy.0: could not get irq dp: -524
> >
> > This is because of a typo in the irq flags. Really these interrupts
> > are LEVEL, but before we change them we need to test them. So let's
> > do a minimal fix first.
> 
> Hopefully, you mean a driver fix later and not changing the DT again?
> A 0 flag is correct if the type is not programmable which I'd guess is
> the case here.

Oh OK thanks for letting me know. In that case with 0 being correct
for non-programmable interrupts,  I'll just drop that paragraph and
no need for further changes. The driver should be already doing the
right thing.

Regards,

Tony
