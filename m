Return-Path: <vkoul@kernel.org>
Date: Tue, 31 Jul 2018 11:57:19 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH v6 2/3] input: pm8941-pwrkey: Abstract register offsets
 and event code
Message-ID: <20180731062719.GA2421@vkoul-mobl>
References: <20180731044807.16878-1-vkoul@kernel.org>
 <20180731044807.16878-3-vkoul@kernel.org>
 <20180731061420.GB114542@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180731061420.GB114542@dtor-ws>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 30-07-18, 23:14, Dmitry Torokhov wrote:
> > +	error = of_property_read_u32(pdev->dev.of_node, "linux,code",
> > +				     &pwrkey->code);
> > +	if (error) {
> > +		dev_info(&pdev->dev, "no linux,code assuming power%d\n", error);
> 
> I changed this to dev_dbg() and applied, thank you.

Okay sound fine to me, thanks

-- 
~Vinod
