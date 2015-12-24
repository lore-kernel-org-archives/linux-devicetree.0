From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5] rtc: support DS1302 RTC on ICP DAS LP-8x4x
Date: Thu, 24 Dec 2015 12:04:53 +0100
Message-ID: <20151224110453.GJ8623@piout.net>
References: <397668667-27328-3-git-send-email-ynvich@gmail.com>
 <1450201525-9137-1-git-send-email-ynvich@gmail.com>
 <20151220033815.GD9883@rob-hp-laptop>
 <1450613656.15911.62.camel@gmail.com>
 <CAL_JsqKxEkuvQ=7=zmb0pkNNyUe9aKzKics43QasUBDM2rmrwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKxEkuvQ=7=zmb0pkNNyUe9aKzKics43QasUBDM2rmrwA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sergei Ianovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 22/12/2015 at 12:16:41 -0600, Rob Herring wrote :
> Well, the binding should reflect that, whether the driver needs to be
> re-written is somewhat a separate question. That should probably have
> been done for the DS1302 driver originally and it is not too fair for
> the 2nd person to fix it. You could just have a single driver bound to
> the controller node which is aware of the DS1302 being the slave
> device (ignoring that part of the DT for now).
> 

I agree with Rob here. I won't require that you fix the driver but it
would be better to have a proper DT binding from the beginning so that
when the driver is fixed it will still work with the previous device
trees.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
