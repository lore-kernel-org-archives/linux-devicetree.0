From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 18/41] Documentation: dt: net: fix spelling mistakes
Date: Mon, 25 Apr 2016 08:50:39 -0500
Message-ID: <20160425135039.GA8956@rob-hp-laptop>
References: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
 <1461543878-3639-19-git-send-email-eric@engestrom.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461543878-3639-19-git-send-email-eric@engestrom.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Engestrom <eric@engestrom.ch>
Cc: linux-kernel@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Yisen Zhuang <yisen.zhuang@huawei.com>, "David S. Miller" <davem@davemloft.net>, Kenneth Lee <liguozhu@huawei.com>, huangdaode <huangdaode@hisilicon.com>, yankejian <yankejian@huawei.com>, Phil Reid <preid@electromag.com.au>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Dan Murphy <dmurphy@ti.com>, Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 25, 2016 at 01:24:15AM +0100, Eric Engestrom wrote:
> Signed-off-by: Eric Engestrom <eric@engestrom.ch>

Applied, thanks.

Rob

> ---
>  Documentation/devicetree/bindings/net/hisilicon-hns-nic.txt | 2 +-
>  Documentation/devicetree/bindings/net/stmmac.txt            | 4 ++--
>  Documentation/devicetree/bindings/net/ti,dp83867.txt        | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/hisilicon-hns-nic.txt b/Documentation/devicetree/bindings/net/hisilicon-hns-nic.txt
> index e6a9d1c..e911a63 100644
> --- a/Documentation/devicetree/bindings/net/hisilicon-hns-nic.txt
> +++ b/Documentation/devicetree/bindings/net/hisilicon-hns-nic.txt
> @@ -8,7 +8,7 @@ Required properties:
>    specifies a reference to the associating hardware driver node.
>    see Documentation/devicetree/bindings/net/hisilicon-hns-dsaf.txt
>  - port-id: is the index of port provided by DSAF (the accelerator). DSAF can
> -  connect to 8 PHYs. Port 0 to 1 are both used for adminstration purpose. They
> +  connect to 8 PHYs. Port 0 to 1 are both used for administration purpose. They
>    are called debug ports.
>  
>    The remaining 6 PHYs are taken according to the mode of DSAF.
> diff --git a/Documentation/devicetree/bindings/net/stmmac.txt b/Documentation/devicetree/bindings/net/stmmac.txt
> index 6605d19..9651dfd 100644
> --- a/Documentation/devicetree/bindings/net/stmmac.txt
> +++ b/Documentation/devicetree/bindings/net/stmmac.txt
> @@ -51,8 +51,8 @@ Optional properties:
>  			   AXI register inside the DMA module:
>  	- snps,lpi_en: enable Low Power Interface
>  	- snps,xit_frm: unlock on WoL
> -	- snps,wr_osr_lmt: max write oustanding req. limit
> -	- snps,rd_osr_lmt: max read oustanding req. limit
> +	- snps,wr_osr_lmt: max write outstanding req. limit
> +	- snps,rd_osr_lmt: max read outstanding req. limit
>  	- snps,kbbe: do not cross 1KiB boundary.
>  	- snps,axi_all: align address
>  	- snps,blen: this is a vector of supported burst length.
> diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.txt b/Documentation/devicetree/bindings/net/ti,dp83867.txt
> index 58d935b..5d21141 100644
> --- a/Documentation/devicetree/bindings/net/ti,dp83867.txt
> +++ b/Documentation/devicetree/bindings/net/ti,dp83867.txt
> @@ -2,7 +2,7 @@
>  
>  Required properties:
>  	- reg - The ID number for the phy, usually a small integer
> -	- ti,rx-internal-delay - RGMII Recieve Clock Delay - see dt-bindings/net/ti-dp83867.h
> +	- ti,rx-internal-delay - RGMII Receive Clock Delay - see dt-bindings/net/ti-dp83867.h
>  		for applicable values
>  	- ti,tx-internal-delay - RGMII Transmit Clock Delay - see dt-bindings/net/ti-dp83867.h
>  		for applicable values
> -- 
> 2.8.0
> 
