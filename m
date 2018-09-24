Return-Path: <robherring2@gmail.com>
Message-ID: <5baa1ae7.1c69fb81.5f2da.32e4@mx.google.com>
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: net/ibm: fix spelling issue
References: <1536557703-19637-1-git-send-email-dongsheng.wang@hxt-semitech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1536557703-19637-1-git-send-email-dongsheng.wang@hxt-semitech.com>
Date: Mon, 24 Sep 2018 13:42:52 -0700
To: Wang Dongsheng <dongsheng.wang@hxt-semitech.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Sep 10, 2018 at 01:35:03PM +0800, Wang Dongsheng wrote:
> Fix a word spelling issue.
> 
> Signed-off-by: Wang Dongsheng <dongsheng.wang@hxt-semitech.com>
> ---
>  Documentation/devicetree/bindings/net/ibm,emac.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/ibm,emac.txt b/Documentation/devicetree/bindings/net/ibm,emac.txt
> index c0c14aa3f97c..fd76d9bf4a3a 100644
> --- a/Documentation/devicetree/bindings/net/ibm,emac.txt
> +++ b/Documentation/devicetree/bindings/net/ibm,emac.txt
> @@ -45,7 +45,7 @@
>  			  Supported values are: "mii", "rmii", "smii", "rgmii",
>  			  "tbi", "gmii", rtbi", "sgmii".
>  			  For Axon on CAB, it is "rgmii"
> -    - mdio-device       : 1 cell, required iff using shared MDIO registers
> +    - mdio-device       : 1 cell, required if using shared MDIO registers

I think 'iff' is short for 'if and only if'

>  			  (440EP).  phandle of the EMAC to use to drive the
>  			  MDIO lines for the PHY used by this EMAC.
>      - zmii-device       : 1 cell, required iff connected to a ZMII.  phandle of

But if not, there's one here too.
