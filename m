From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/6] usb: host: usb-st-common: Add common code
 required by ohci-st and ehci-st
Date: Thu, 7 Aug 2014 15:16:31 +0100
Message-ID: <20140807141631.GC12137@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1407344589-24863-1-git-send-email-peter.griffin@linaro.org>
 <1407344589-24863-2-git-send-email-peter.griffin@linaro.org>
 <201408062259.10697.arnd@arndb.de>
 <20140807141457.GB12137@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140807141457.GB12137@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

> > > (priv->rst);
> > > +		if (ret)
> > > +			goto err_assert_power;
> > > +	}
> > 
> > I wouldn't make these optional, just call the functions
> > unconditionally and fail the probe function if they are
> > not available.

Also I've also done as you suggest and made
these non optional in V4.

regards,

Peter.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
