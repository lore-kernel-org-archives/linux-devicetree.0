From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: Re: [PATCH] spi/s3c64xx: Update DT binding documentation to
	match code
Date: Fri, 7 Mar 2014 11:12:02 +0000
Message-ID: <20140307111202.GK8570@opensource.wolfsonmicro.com>
References: <4F.EF.24278.5C999135@epcpsbgx4.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F.EF.24278.5C999135-hl5l+cwj/UQ8ySZrqMDKH/pXobYPEAuW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: GIRISH K S <ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 07, 2014 at 10:04:53AM +0000, GIRISH K S wrote:
> Hello Charles, instead of the binding modification I shall
> handle it in the driver probe function by getting child
> node using the api of_get_child_by_name(child-node,
> "controller-data) and then use of_find_property to parse
> the cs-gpio.
>
> This looks like a better fix. Is that ok?

Sounds like a good solution to me.

Thanks,
Charles

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
