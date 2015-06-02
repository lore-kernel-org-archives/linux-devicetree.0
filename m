From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/2] clk: at91: add Flexcom clock
Date: Tue, 2 Jun 2015 19:15:36 +0200
Message-ID: <20150602171536.GG1715@piout.net>
References: <cover.1433264017.git.cyrille.pitchen@atmel.com>
 <62cb26952d0688c6f37ad84d253d5302818a20ae.1433264017.git.cyrille.pitchen@atmel.com>
 <20150602190435.4698a4db@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150602190435.4698a4db@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/06/2015 at 19:04:35 +0200, Boris Brezillon wrote :
> Hi Cyrille,
> 
> On Tue, 2 Jun 2015 18:57:19 +0200
> Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> wrote:
> 
> > This driver supports the new Atmel Flexcom. The Flexcom is a wrapper which
> > integrates one SPI controller, one I2C controller and one USART. Only one
> > function can be enabled at a time. This driver selects the function once for
> > all, when the Flexcom is probed, according to the value of the new
> > "atmel,flexcom-mode" device tree property.
> > 
> > This driver has chosen to present the Flexcom to the system as a clock so the
> > implementation is seamless for the existing Atmel SPI, I2C and USART drivers.
> 
> Could detail a bit more why you chose to represent this flexcom IP as
> a clock device ?
> 
> I don't like to use this 'DT should represent real hardware' argument,
> but to me, it looks like you're trying to use a false hardware
> representation to avoid changing the peripheral drivers code, which is
> wrong since the DT is supposed to represent the hardware blocks.
> 
> How about representing the flexcom as an MFD instead ?
> 

It should probably be represented as an MFD. The MFD driver will parse
the chosen configuration and the probe the correct driver. You can have
a look at the recent ST LPC driver from Lee.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
