From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH v2 1/3] power: Add simple poweroff-gpio driver
Date: Sat, 17 Nov 2012 09:34:34 +0100
Message-ID: <20121117083434.GI24569@lunn.ch>
References: <1352821485-10032-1-git-send-email-andrew@lunn.ch>
 <1352821485-10032-2-git-send-email-andrew@lunn.ch>
 <20121116192525.GA25838@schnuecks.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121116192525.GA25838-2BA9cf72eNkOIzVOb1FTxg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Simon Baatz <gmbnomis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > + * Hold configuration here, cannot be more than one instance of the driver
> > + * since pm_power_off itself is global.
> > + */
> > +static int gpio_num = -1;
> > +static int gpio_active_low;
> > +
> > +static void gpio_poweroff_do_poweroff(void)
> > +{
> > +	BUG_ON(gpio_num == -1);
> > +
> > +	/* drive it active */
> > +	gpio_direction_output(gpio_num, !gpio_active_low);
> > +	mdelay(100);
> > +	/* rising edge or drive inactive */
> > +	gpio_set_value(gpio_num, gpio_active_low);
> > +	mdelay(100);
> > +	/* falling edge */
> > +	gpio_set_value(gpio_num, !gpio_active_low);
> > +
> > +	/* give it some time */
> > +	mdelay(100);
> 
> On the IB-NAS 6210 I need to increase this delay to a whopping 3000
> milliseconds to suppress the warning (2000 is not enough).  Is it
> acceptable to increase this to such a high value or do we need
> another solution?

Hi Simon

It is interesting how slow these things are at turning off. I already
had to increase it once from 10ms for the DNSKW.

So i will increase it to 3000 in the next spin of the patches.

Thanks

	Andrew
