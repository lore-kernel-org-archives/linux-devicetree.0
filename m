From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 1/3] ARM: dts: NSP: Enable SFP on bcm958625hr
Date: Mon, 27 Aug 2018 22:35:00 +0200
Message-ID: <20180827203500.GN27483@lunn.ch>
References: <20180827200344.16158-1-f.fainelli@gmail.com>
 <20180827200344.16158-2-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180827200344.16158-2-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, "maintainer:BROADCOM IPROC ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, rmk+kernel@armlinux.org.uk
List-Id: devicetree@vger.kernel.org

> @@ -210,6 +228,17 @@
>  			reg = <4>;
>  		};
>  
> +		port@5 {
> +			label = "sfp";
> +			phy-mode = "sgmii";
> +			reg = <5>;
> +			sfp = <&sfp>;
> +			fixed-link {
> +				speed = <1000>;
> +				full-duplex;
> +			};

Hi Florian

You might want to add a comment about why you are using fixed-link and
sgmii, which seems very odd. Is it even correct?

       Andrew
