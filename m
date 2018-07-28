From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 6/7] net: phy: Add support to configure clock in
 Broadcom iProc mdio mux
Date: Sat, 28 Jul 2018 23:22:24 +0200
Message-ID: <20180728212224.GF4792@lunn.ch>
References: <1532726613-6483-1-git-send-email-arun.parameswaran@broadcom.com>
 <1532726613-6483-7-git-send-email-arun.parameswaran@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1532726613-6483-7-git-send-email-arun.parameswaran@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arun Parameswaran <arun.parameswaran@broadcom.com>
Cc: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

> @@ -198,10 +219,22 @@ static int mdio_mux_iproc_probe(struct platform_device *pdev)
>  		return PTR_ERR(md->base);
>  	}
>  
> +	md->core_clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(md->core_clk)) {
> +		md->core_clk = NULL;
> +	} else {
> +		rc = clk_prepare_enable(md->core_clk);
> +		if (rc) {
> +			dev_err(&pdev->dev, "failed to enable core clk\n");
> +			return rc;
> +		}
> +	}
> +
>  	md->mii_bus = mdiobus_alloc();
>  	if (!md->mii_bus) {
>  		dev_err(&pdev->dev, "mdiomux bus alloc failed\n");
> -		return -ENOMEM;
> +		rc = -ENOMEM;
> +		goto out;

Hi Arun

There is a devm_mdiobus_alloc() which could make the cleanup on error
simple.

>  	}
>  
>  	bus = md->mii_bus;
> @@ -217,7 +250,7 @@ static int mdio_mux_iproc_probe(struct platform_device *pdev)
>  	rc = mdiobus_register(bus);
>  	if (rc) {
>  		dev_err(&pdev->dev, "mdiomux registration failed\n");
> -		goto out;
> +		goto out_alloc;
>  	}
>  
>  	platform_set_drvdata(pdev, md);
> @@ -236,8 +269,11 @@ static int mdio_mux_iproc_probe(struct platform_device *pdev)
>  
>  out_register:
>  	mdiobus_unregister(bus);
> -out:
> +out_alloc:
>  	mdiobus_free(bus);
> +out:
> +	if (md->core_clk)
> +		clk_disable_unprepare(md->core_clk);
>  	return rc;
>  }

   Andrew
