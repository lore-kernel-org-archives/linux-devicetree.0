From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/5] media: rc: update sunxi-ir driver to
 get base clock frequency from devicetree
Date: Mon, 18 Dec 2017 13:43:40 +0100
Message-ID: <887632f1-6e43-c9d0-c298-0d02b99d2781@gmail.com>
References: <20171217224547.21481-1-embed3d@gmail.com>
 <CGME20171217224555epcas5p3eb77a28e9f3ba4b189c5f275e2d2a679@epcas5p3.samsung.com>
 <20171217224547.21481-2-embed3d@gmail.com>
 <20171218024444.GA9140@gangnam.samsung>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Return-path: <linux-sunxi+bncBD257DPK24NRB77P33IQKGQEZLMX5QA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171218024444.GA9140-8vUhnHFVuGn35fTxX1Dczw@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hey Andi,

thanks for the feedback. I will fix that in the next version of this 
patch series!

On 18.12.2017 03:44, Andi Shyti wrote:
> Hi Philipp,
> 
> just a couple of small nitpicks.
> 
>> +	u32 b_clk_freq;
> 
> [...]
> 
>> +	/* Base clock frequency (optional) */
>> +	if (of_property_read_u32(dn, "clock-frequency", &b_clk_freq)) {
>> +		b_clk_freq = SUNXI_IR_BASE_CLK;
>> +	}
>> +
> 
> how about you intialize 'b_clk_freq' to 'SUNXI_IR_BASE_CLK' and
> just call 'of_property_read_u32' without if statement.
> 'b_clk_freq' value should not be changed if "clock-frequency"
> is not present in the DTS.
> 
> This might avoid misinterpretation from static analyzers that
> might think that 'b_clk_freq' is used uninitialized.
> 
>> +	dev_info(dev, "set base clock frequency to %d Hz.\n", b_clk_freq);
> 
> Please use dev_dbg().
> 
> Andi
> 
--
Philipp
