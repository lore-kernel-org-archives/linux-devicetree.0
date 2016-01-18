From: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] usb: chipidea: add CI_HDRC_TURN_VBUS_EARLY_ON for
 imx23
Date: Mon, 18 Jan 2016 10:07:14 +0800
Message-ID: <20160118020713.GA8150@shlinux2>
References: <1451407269-14905-1-git-send-email-stefan.wahren@i2se.com>
 <245634301.105525.a366f7cd-6533-4e6a-9506-5cc94a8288bd.open-xchange@email.1und1.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <245634301.105525.a366f7cd-6533-4e6a-9506-5cc94a8288bd.open-xchange-7tX72C7vayboQLBSYMtkGA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jan 17, 2016 at 07:56:31PM +0100, Stefan Wahren wrote:
> Hi Peter,
> 
> > Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> hat am 29. Dezember 2015 um 17:41
> > geschrieben:
> >
> >
> > Until now the imx23 uses the imx27 platform flag. But the
> > imx23 needs the flag CI_HDRC_TURN_VBUS_EARLY_ON, too. So
> > fix this by adding a separate platform flag.
> >
> > Suggested-by: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
> > Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> > ---
> > drivers/usb/chipidea/ci_hdrc_imx.c | 6 ++++++
> > 1 file changed, 6 insertions(+)
> >
> 
> is the series okay?

Yes, it is ok, already at my patch queue

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
