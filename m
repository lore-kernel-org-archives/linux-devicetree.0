From: Andy Gross <agross@codeaurora.org>
Subject: Re: [PATCH v2 01/11] soc: qcom: Add device tree binding for SMEM
Date: Wed, 8 Jul 2015 22:50:00 -0500
Message-ID: <20150709035000.GA10151@qualcomm.com>
References: <1435355419-23602-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1435355419-23602-2-git-send-email-bjorn.andersson@sonymobile.com>
 <559DB8B2.2090202@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <559DB8B2.2090202@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: bjorn@kryo.se, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jeffrey Hugo <jhugo@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 08, 2015 at 04:56:34PM -0700, Stephen Boyd wrote:
> On 06/26/2015 02:50 PM, bjorn@kryo.se wrote:
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

The memory-region is just used to describe 'real' memory.  The RPM message is IO
memory and part of the SOC.  Thats my take at least.

> 
> > +		compatible = "qcom,smem";
> > +
> > +		memory-region = <&smem_region>;
> > +		reg = <0xfc428000 0x4000>;
> > +
> > +		hwlocks = <&tcsr_mutex 3>;
> > +	};

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
