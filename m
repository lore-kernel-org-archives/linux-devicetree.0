From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 5/5] ARM: dts: sunxi: Add missing watchdog interrupts
Date: Mon, 19 Aug 2019 19:51:43 +0200
Message-ID: <20190819175143.g5hilveoeubkbfpk@flea>
References: <20190813124744.32614-1-mripard@kernel.org>
 <20190813124744.32614-5-mripard@kernel.org>
 <CAGb2v66C-Mqdo-xWm4RAw33sFk-gLy-L_YWQ__6BjYU9gcpYug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v66C-Mqdo-xWm4RAw33sFk-gLy-L_YWQ__6BjYU9gcpYug@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-kernel <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 14, 2019 at 12:44:02PM +0800, Chen-Yu Tsai wrote:
> On Tue, Aug 13, 2019 at 8:48 PM Maxime Ripard <mripard@kernel.org> wrote:
> >
> > From: Maxime Ripard <maxime.ripard@bootlin.com>
> >
> > The watchdog has an interrupt on all our SoCs, but it wasn't always listed.
> > Add it to the devicetree where it's missing.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> Acked-by: Chen-Yu Tsai <wens@csie.org>
>
> On a separate note, the A31 has four watchdogs in the timer block, and
> one interrupt for each watchdog. Should we expand the node to encompass
> all of them, or add separate nodes for each additional one?

Yep, I guess that's the idea considering the register range.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
