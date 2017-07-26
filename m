From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] dmaengine: Add STM32 MDMA driver
Date: Wed, 26 Jul 2017 10:30:07 +0530
Message-ID: <20170726050007.GE3053@localhost>
References: <1499343941-6375-1-git-send-email-pierre-yves.mordret@st.com>
 <1499343941-6375-3-git-send-email-pierre-yves.mordret@st.com>
 <20170721075547.GO3053@localhost>
 <ee278ecf-02a3-7799-888a-9590d1105bb3@st.com>
 <20170721095411.GR3053@localhost>
 <3c04c9bf-572d-98a6-ff62-83498bbc7fdf@st.com>
 <20170721171735.GS3053@localhost>
 <320f8def-19a4-0491-e879-b41815889e15@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <320f8def-19a4-0491-e879-b41815889e15-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pierre Yves MORDRET <pierre-yves.mordret-qxv4g6HH51o@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabrice GASNIER <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, Fabien DESSENNE <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Amelie DELAUNAY <amelie.delaunay-qxv4g6HH51o@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 24, 2017 at 09:34:18AM +0000, Pierre Yves MORDRET wrote:
> 
> On 07/21/2017 12:32 PM, Pierre Yves MORDRET wrote:
>  >
>  >
>  > On 07/21/2017 11:54 AM, Vinod Koul wrote:
>  >> On Fri, Jul 21, 2017 at 09:30:00AM +0000, Pierre Yves MORDRET wrote:
>  >>>>> +static enum dma_slave_buswidth stm32_mdma_get_max_width(u32 buf_len, u32 
> tlen)
>  >>>>> +{
>  >>>>> +	enum dma_slave_buswidth max_width = DMA_SLAVE_BUSWIDTH_8_BYTES;
>  >>>>> +
>  >>>>> +	while (((buf_len % max_width) || (tlen < max_width)) &&
>  >>>>> +	       (max_width > DMA_SLAVE_BUSWIDTH_1_BYTE))
>  >>>>> +		max_width = max_width >> 1;
>  >>>>
>  >>>> ok, this is a bit hard to read...
>  >>>
>  >>> This code snippet has already been reworked and optimized. Would you mind to
>  >>> provide me a example with your expectation ? Thanks
>  >>
>  >> Code is optimized yes, but readable no
>  >>
>  >> I would like readability to be improved upon...
>  >>
>  >
>  > gotcha
>  >
> 
> Doest he code snippet below has a better looking for you ?
> 
> 	for (max_width = DMA_SLAVE_BUSWIDTH_8_BYTES;
> 	     max_width > DMA_SLAVE_BUSWIDTH_1_BYTE; max_width >>= 1)
> 		if (((buf_len % max_width) == 0) && (tlen >= max_width))
> 			break;

Am actually not sure :(

Indentation wise it is still a bit messy to follow..

How about:

	for (max_width = DMA_SLAVE_BUSWIDTH_8_BYTES;
			max_width > DMA_SLAVE_BUSWIDTH_1_BYTE;
			max_width >>=1) {
		if (((buf_len % max_width) == 0) && (tlen >= max_width))
			break;
	}

Thanks
-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
