From: nicolas saenz julienne <nicolassaenzj@gmail.com>
Subject: Re: [PATCH] gpio: 74x164: add dt support for nxp's 74x594
Date: Tue, 22 Mar 2016 11:42:08 +0100
Message-ID: <20160322104207.GA2842@marie-Aspire-5600>
References: <1457998330-8070-1-git-send-email-nicolassaenzj@gmail.com>
 <CAMuHMdW5Owzv06wnV34W3cYp=ibrONcfBVV6WST5VyvQ1ENjsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdW5Owzv06wnV34W3cYp=ibrONcfBVV6WST5VyvQ1ENjsA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi sorry for the late response but I was on vacation.
> 
> Why did you choose the "lvc" variant?
Well to be honest the HW people did and it's all I could test with.  I don't
know much about these naming schemes, apart from the intuition it has to do
with frequency and line levels.

> Ideally, you want to put the oldest "manuf,74x594" variant here.
What do you mean by oldest? What would you suggest? it's funny because the chip
is going to be used on a new product that is meant to be produced for years.

> I once read it was Motorola who invented the 7459x parts, to interface with
> SPI.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
Thanks for your comments!
	Nicolas
