From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH v2 5/5] misc: eeprom_93xx46: Add support for a GPIO
 'select' line.
Date: Thu, 19 Nov 2015 18:15:45 +0100
Message-ID: <20151119171545.GF25345@lunn.ch>
References: <1447903781-3910-1-git-send-email-cory.tusar@pid1solutions.com>
 <1447903781-3910-6-git-send-email-cory.tusar@pid1solutions.com>
 <564D66BF.5010601@mleia.com>
 <20151119141810.GA30828@lunn.ch>
 <564DFE69.6000203@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <564DFE69.6000203-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Cc: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, agust-ynQEQJNshbs@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, afd-l0cyMroinI0@public.gmane.org, Chris.Healy-c8ZVq/bFV1I@public.gmane.org, Keith.Vennel-c8ZVq/bFV1I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 19, 2015 at 06:52:57PM +0200, Vladimir Zapolskiy wrote:
> On 19.11.2015 16:18, Andrew Lunn wrote:
> >>>  #ifdef CONFIG_OF
> >>> +static void select_assert(void *context)
> >>> +{
> >>> +	struct eeprom_93xx46_dev *edev = context;
> >>> +
> >>> +	gpiod_set_value_cansleep(gpio_to_desc(edev->pdata->select_gpio), 1);
> >>
> >> I would suggest to use gpio_set_value()
> > 
> > Could you explain why?
> > 
> > Maybe this gpio is on an SPI GPIO expander?
> 
> My point is that gpio_*() interface, gpio_set_value() or
> gpio_set_value_cansleep(), might be preferred is this particular case.

Ah, O.K, yes, avoid the gpio_to_desc() call.

Agreed.

	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
