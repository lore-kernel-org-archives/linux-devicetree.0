From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: Re: [PATCH v2 01/11] soc: qcom: Add device tree binding for SMEM
Date: Mon, 13 Jul 2015 15:30:51 -0700
Message-ID: <20150713223051.GD15178@usrtlx11787.corpusers.net>
References: <1435355419-23602-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1435355419-23602-2-git-send-email-bjorn.andersson@sonymobile.com>
 <559DB8B2.2090202@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <559DB8B2.2090202-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: bjorn-UYDU3/A3LUY@public.gmane.org, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jeffrey Hugo <jhugo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed 08 Jul 16:56 PDT 2015, Stephen Boyd wrote:

> On 06/26/2015 02:50 PM, bjorn-UYDU3/A3LUY@public.gmane.org wrote:
> > += EXAMPLE
> > +The following example shows the SMEM setup for MSM8974, with a main SMEM region
> > +at 0xfa00000 and an auxiliary region at 0xfc428000:
> > +
> > +	reserved-memory {
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		ranges;
> > +
> > +		smem_region: smem@fa00000 {
> > +			reg = <0xfa00000 0x200000>;
> > +			no-map;
> > +		};
> > +	};
> > +
> > +	smem@fa00000 {
> 
> This should be smem@fc428000 matching the first reg property. It's weird
> though, because if smem is using a secondary region it will be under the
> SoC node and have a reg property. Otherwise it would be directly under
> the root node and only have a memory-region. It would be nice if we
> could somehow move the rpm message ram (0xfc428000) into the
> reserved-memory node so that we could use memory-region for both regions.
> 

I agree, the semantics here became a little bit odd.

I do not think we should list the 0xfc428000 region as a memory-region,
as it's "device memory" and I do like the fact that we don't repeat
ourselves with listing the memory-region as a reg.

Therefor I think this is the least ugly option, but the address in the
name of the node should be updated.

> > +		compatible = "qcom,smem";
> > +
> > +		memory-region = <&smem_region>;
> > +		reg = <0xfc428000 0x4000>;
> > +
> > +		hwlocks = <&tcsr_mutex 3>;
> > +	};
> 

Thanks,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
