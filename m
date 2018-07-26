From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 5/7] net: phy: Add support to configure clock in Broadcom
 iProc mdio mux
Date: Thu, 26 Jul 2018 21:13:40 +0200
Message-ID: <20180726191340.GH10686@lunn.ch>
References: <1532630184-29450-1-git-send-email-arun.parameswaran@broadcom.com>
 <1532630184-29450-6-git-send-email-arun.parameswaran@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1532630184-29450-6-git-send-email-arun.parameswaran@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arun Parameswaran <arun.parameswaran@broadcom.com>
Cc: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

> @@ -175,6 +198,12 @@ static int mdio_mux_iproc_probe(struct platform_device *pdev)
>  		return PTR_ERR(md->base);
>  	}
>  
> +	md->core_clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(md->core_clk)) {
> +		dev_info(&pdev->dev, "core_clk not specified\n");
> +		md->core_clk = NULL;
> +	}
> +

In the binding, you say the clock is optional. This is a rather strong
message for something which is optional. I think it would be better to
not output anything.

    Andrew
