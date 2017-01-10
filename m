From: Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 2/2] media: rc: add driver for IR remote receiver on
 MT7623 SoC
Date: Wed, 11 Jan 2017 07:45:43 +0900
Message-ID: <20170110224543.uuoa7ofkvolz6inp@gangnam.samsung>
References: <CGME20170110120828epcas4p42482b7920c7a7dabd4c7794959f6d264@epcas4p4.samsung.com>
 <201701102015.fSM15CvI%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-disposition: inline
In-reply-to: <201701102015.fSM15CvI%fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, kbuild-all-JC7UmRfGjtg@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, keyhaede-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sean,

>    include/linux/compiler.h:253:8: sparse: attribute 'no_sanitize_address': unknown attribute
> >> drivers/media/rc/mtk-cir.c:215:41: sparse: too many arguments for function devm_rc_allocate_device
>    drivers/media/rc/mtk-cir.c: In function 'mtk_ir_probe':
>    drivers/media/rc/mtk-cir.c:215:11: error: too many arguments to function 'devm_rc_allocate_device'
>      ir->rc = devm_rc_allocate_device(dev, RC_DRIVER_IR_RAW);
>               ^~~~~~~~~~~~~~~~~~~~~~~
>    In file included from drivers/media/rc/mtk-cir.c:22:0:
>    include/media/rc-core.h:213:16: note: declared here
>     struct rc_dev *devm_rc_allocate_device(struct device *dev);
>                    ^~~~~~~~~~~~~~~~~~~~~~~
> 
> vim +/devm_rc_allocate_device +215 drivers/media/rc/mtk-cir.c
> 
>    209		ir->base = devm_ioremap_resource(dev, res);
>    210		if (IS_ERR(ir->base)) {
>    211			dev_err(dev, "failed to map registers\n");
>    212			return PTR_ERR(ir->base);
>    213		}
>    214	
>  > 215		ir->rc = devm_rc_allocate_device(dev, RC_DRIVER_IR_RAW);

this error comes because the patches I pointed out have not been
applied yet. I guess you can ignore them as long as you tested
yours on top those patches.

Andi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
