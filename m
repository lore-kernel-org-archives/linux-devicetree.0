From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 3/5] mtd: ofpart: update devicetree binding
 specification
Date: Tue, 27 Oct 2015 15:50:00 -0700
Message-ID: <20151027225000.GA64073@google.com>
References: <cover.1439911625.git.hramrach@gmail.com>
 <e47db0c8eeaeb11353bcb2f4dcd138e813c3ecd7.1439911625.git.hramrach@gmail.com>
 <20151011200402.GE3696@localhost>
 <CAL_JsqJ4Ha7R92=6xkwYXZjpEprjWoVxyXM6cG=yykVoTMH-vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ4Ha7R92=6xkwYXZjpEprjWoVxyXM6cG=yykVoTMH-vw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thanks for the review.

On Mon, Oct 26, 2015 at 11:35:24PM -0500, Rob Herring wrote:
> On Sun, Oct 11, 2015 at 3:04 PM, Brian Norris
> <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Hi DT maintainers,
> >
> > It's a bit hypocritical of me, since I've been a slow reviewer as well,
> > but... can we get some review on this one? Usually, I'm comfortable
> > taking driver DT bindings without your review, but this one is a bit
> > more generic and is more far-reaching than the average driver.
> 
> Sorry, missed this one. This would be a good one to send to
> devicetree-spec to BTW.

I'm not very familiar with that list. With the intention of getting into
an ePAPR (or similar) spec? Or just for additional review? If the
former, would you suggest codifying both the old and the new, or just
the new?

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
