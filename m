From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/2] media: rc: add driver for IR remote receiver on
 MT7623 SoC
Date: Fri, 6 Jan 2017 15:41:30 +0800
Message-ID: <1483688490.16976.26.camel@mtkswgap22>
References: <1483632384-8107-1-git-send-email-sean.wang@mediatek.com>
         <CGME20170105160810epcas3p1b7a85197c15fbbe87e08c736259935d6@epcas3p1.samsung.com>
         <1483632384-8107-3-git-send-email-sean.wang@mediatek.com>
         <20170106034346.7njhyhtsc4yado5c@gangnam.samsung>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170106034346.7njhyhtsc4yado5c-8vUhnHFVuGn35fTxX1Dczw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, keyhaede-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andi,

Thank for your reminder. I will refine the code based on your work.
to have elegant code and easy error handling.

Sean

On Fri, 2017-01-06 at 12:43 +0900, Andi Shyti wrote:
> Hi Sean,
> 
> > +	ir->rc = rc_allocate_device();
> 
> Yes, you should use devm_rc_allocate_device(...)
> 
> Besides, standing to this patch which is not in yet:
> 
> https://lkml.org/lkml/2016/12/18/39
> 
> rc_allocate_device should provide the driver type during
> allocation, so it should be:
> 
> 	ir->rc = rc_allocate_device(RC_DRIVER_IR_RAW);
> 
> and this line can be removed:
> 
> > +	ir->rc->driver_type = RC_DRIVER_IR_RAW;
> 
> I don't know when Mauro will take the patch above.
> 
> Andi


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
