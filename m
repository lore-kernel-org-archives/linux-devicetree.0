From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3]  Add picoPHY usb phy driver found on stih407 family
 SoC's
Date: Mon, 8 Sep 2014 16:53:31 +0100
Message-ID: <20140908155331.GA7620@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1409740079-16554-1-git-send-email-peter.griffin@linaro.org>
 <540DC9F6.8090306@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <540DC9F6.8090306-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Kishon,

> On Wednesday 03 September 2014 03:57 PM, Peter Griffin wrote:
> > This series adds support for the picoPHY usb phy which is used by the usb2
> > and usb3 host controllers when controlling usb2/1.1 devices. It is found on
> > stih407 family SoC's from the consumer electronics devision of STMicroelectronics.
> 
> So miphy28lp is the PHY controller for USB3 device controller and picoPHY is
> the PHY controller for USB3 host controller?

No, miphy28lp is the usb3 phy and picoPHY is the usb2 phy.

With a usb2 host controller only picoPHY is used. With the usb3 host controller both usb2 and usb3 phys
are used depending on what type of device is plugged in.

Hope that clarifies things,

regards,

Peter.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
