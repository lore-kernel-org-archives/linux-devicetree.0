From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: add bindings doc for HiSilicon INNO
 USB2 PHY
Date: Thu, 8 Mar 2018 09:32:11 +0800
Message-ID: <20180308013208.GJ28619@dragon>
References: <1520217605-9312-1-git-send-email-shawn.guo@linaro.org>
 <1520217605-9312-2-git-send-email-shawn.guo@linaro.org>
 <20180307211118.su2vyfa4zyfh4w2t@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180307211118.su2vyfa4zyfh4w2t@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Jianguo Sun <sunjianguo1@huawei.com>, Jiancheng Xue <xuejiancheng@hisilicon.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pengcheng Li <lpc.li@hisilicon.com>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 07, 2018 at 03:11:18PM -0600, Rob Herring wrote:
> > +Example:
> > +
> > +perictrl: peripheral-controller@8a20000 {
> > +	compatible = "hisilicon,hi3798cv200-perictrl", "syscon",
> > +		     "simple-mfd";
> 
> Is syscon needed here? Doesn't look like the phys need it.

For phys, "syscon" is not needed, but there are other devices to be
added which will need to access perictrl as syscon.  Anyway, I can drop
"syscon" from the example in this bindings doc to avoid the confusion.

> Is there no dependency on the peri ctrl probing first for the phys to 
> probe successfully? If there is some dependency, simple-mfd should not 
> be used.

No, there is no such dependency.  Right now the perictrl is there only
for populating the phy devcies.

> As for the phy binding,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks.

Shawn
