From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] usb: phy: msm: Use extcon framework for VBUS and ID
 detection
Date: Thu, 30 Apr 2015 14:30:02 +0300
Message-ID: <1430393402.2400.14.camel@mm-sol.com>
References: <1428568462-20193-1-git-send-email-ivan.ivanov@linaro.org>
	 <1429601312.15866.11.camel@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429601312.15866.11.camel-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Ping.

On Tue, 2015-04-21 at 10:28 +0300, Ivan T. Ivanov wrote:
> On Thu, 2015-04-09 at 11:34 +0300, Ivan T. Ivanov wrote:
> > On recent Qualcomm platforms VBUS and ID lines are not routed to
> > USB PHY LINK controller. Use extcon framework to receive connect
> > and disconnect ID and VBUS notification.
> > 
> > Signed-off-by: Ivan T. Ivanov ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> Hi Felipe,
> 
> Did you have any comments on this and/or following patches?
> 
> Regards,
> Ivan
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
