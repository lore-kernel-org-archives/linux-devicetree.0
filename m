From: "Andrew Jeffery" <andrew@aj.id.au>
Subject: Re: [linux,dev-5.1 v1] dt-bindings: gpio: aspeed: Add SGPIO support
Date: Wed, 10 Jul 2019 11:30:14 +0930
Message-ID: <90c0c965-00ae-4f7a-a6f5-258572398bb0@www.fastmail.com>
References: <1562184069-22332-1-git-send-email-hongweiz@ami.com>
 <CAL_Jsq+0z4OZ7qbaiUva1v5xCKXpsaPBZ9tj_M4HbEihsU_MfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+0z4OZ7qbaiUva1v5xCKXpsaPBZ9tj_M4HbEihsU_MfA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Hongwei Zhang <hongweiz@ami.com>
Cc: devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-aspeed@lists.ozlabs.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On Wed, 10 Jul 2019, at 04:23, Rob Herring wrote:
> On Wed, Jul 3, 2019 at 2:01 PM Hongwei Zhang <hongweiz@ami.com> wrote:
> >
> > Add bindings to support SGPIO on AST2400 or AST2500.
> >
> > Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> > ---
> >  .../devicetree/bindings/gpio/sgpio-aspeed.txt      | 36 ++++++++++++++++++++++
> 
> Is this SGPIO as in the blinky lights for HDDs in servers? If so, that
> has nothing to do with Linux GPIO subsystem.
> 

No, this is just literal serialised GPIO, which can be used with e.g. nexperia
74LV595 / 74LV165 parts.

There is a separate chunk of IP in the SoC that acts as an SFF-8485 (blinky
lights) slave monitor.

Andrew
