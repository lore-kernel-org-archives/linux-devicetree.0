From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/5] dts: gpio_atmel: adapt binding doc to reality
Date: Wed, 31 May 2017 11:52:47 +0200
Message-ID: <20170531095247.5g4zibmlc6qzyqwu@piout.net>
References: <20170526185214.GB20946@lunn.ch>
 <20170526190703.t5fab33peh2cmobm@taurus.defre.kleine-koenig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170526190703.t5fab33peh2cmobm-T6qyLwKrzP+Pq0V0m3QNwQq/OYV65a7L4Y2cMoPwMik@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 26/05/2017 at 21:07:03 +0200, Uwe Kleine-König wrote:
> The second cell in a gpio reference is used to pass GPIO_ACTIVE_LOW or
> GPIO_ACTIVE_HIGH. The gpio device can also be used as irq controller and
> a reference can contain the IRQ_TYPE_* values in the second cell.
> 
> Signed-off-by: Uwe Kleine-König <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
> ---
> On Fri, May 26, 2017 at 08:52:14PM +0200, Andrew Lunn wrote:
> > > +- interrupt-controller: Marks the device node as a GPIO controller.
> > 
> > Interrupt controller, not GPIO controller.
> > 
> > > +- #interrupt-cells: Should be two. The first cell is the pin number and the
> > > +  second cell is used to specify irq type flags:
> > > +      1 = low-to-high edge triggered.
> > > +      2 = high-to-low edge triggered.
> > > +      4 = active high level-sensitive.
> > > +      8 = active low level-sensitive.
> > 
> > Maybe just reference interrupts.txt?
> 
> ack for both and changed in this v2.
> 
> Thanks
> Uwe
> 
>  Documentation/devicetree/bindings/gpio/gpio_atmel.txt | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
