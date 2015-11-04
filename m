From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH 2/2] drivers/gpio: Port gpio driver to layerscape
 platform
Date: Wed, 4 Nov 2015 03:17:38 -0600
Message-ID: <1446628658.12676.14.camel@freescale.com>
References: <1446619704-27669-1-git-send-email-Gang.Liu@freescale.com>
	 <1446619704-27669-2-git-send-email-Gang.Liu@freescale.com>
	 <4040829.fHtCUjX87j@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <4040829.fHtCUjX87j@wuerfel>
Sender: linux-gpio-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Liu Gang <Gang.Liu@freescale.com>, robh+dt@kernel.org, linus.walleij@linaro.org, shawnguo@kernel.org, devicetree@vger.kernel.org, R58472@freescale.com, Shaveta Leekha <shaveta@freescale.com>, b07421@freescale.com, bhupesh.sharma@freescale.com, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 2015-11-04 at 09:53 +0100, Arnd Bergmann wrote:
> On Wednesday 04 November 2015 14:48:24 Liu Gang wrote:
> > 
> > +static bool gpio_little_endian;
> > +static inline u32 gpio_in32(void __iomem *addr)
> > +{
> > +   u32 val;
> > +
> > +   if (gpio_little_endian)
> > +           val = ioread32(addr);
> > +   else
> > +           val = ioread32be(addr);
> > +
> > +   return val;
> > +}
> > +
> > +static inline void gpio_out32(u32 val, void __iomem *addr)
> > +{
> > +   if (gpio_little_endian)
> > +           iowrite32(val, addr);
> > +   else
> > +           iowrite32be(val, addr);
> > +}
> 
> I guess this is fixed per architecture, so you could also do this as
> 
> static inline void gpio_out32(u32 val, void __iomem *addr)
> {
>       if (IS_ENABLED(CONFIG_ARM))
>               iowrite32(val, addr);
>       else if (IS_ENABLED(CONFIG_PPC)
>               iowrite32be(val, addr);
>       else
>               BUG();
> }

Unfortunately that guess is wrong.  Some of our ARM chips have big-endian I/O 
and some have little-endian I/O.

-Scott

