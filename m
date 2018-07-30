From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 7/7] net: phy: Add pm support to Broadcom iProc mdio
 mux driver
Date: Mon, 30 Jul 2018 15:53:06 -0700
Message-ID: <8d732031-c5e8-d6ea-5b61-3b9baf79796f@gmail.com>
References: <1532726613-6483-1-git-send-email-arun.parameswaran@broadcom.com>
 <1532726613-6483-8-git-send-email-arun.parameswaran@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1532726613-6483-8-git-send-email-arun.parameswaran@broadcom.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arun Parameswaran <arun.parameswaran@broadcom.com>, "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On 07/27/2018 02:23 PM, Arun Parameswaran wrote:
> Add support for suspend and resume to the Broadcom iProc mdio
> mux driver.
> 
> Signed-off-by: Arun Parameswaran <arun.parameswaran@broadcom.com>
> ---
>  drivers/net/phy/mdio-mux-bcm-iproc.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/net/phy/mdio-mux-bcm-iproc.c b/drivers/net/phy/mdio-mux-bcm-iproc.c
> index 51d1003..d89dce0 100644
> --- a/drivers/net/phy/mdio-mux-bcm-iproc.c
> +++ b/drivers/net/phy/mdio-mux-bcm-iproc.c
> @@ -290,6 +290,33 @@ static int mdio_mux_iproc_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_PM_SLEEP
> +static int mdio_mux_iproc_suspend(struct device *dev)
> +{
> +	struct iproc_mdiomux_desc *md = dev_get_drvdata(dev);
> +
> +	if (md->core_clk)
> +		clk_disable_unprepare(md->core_clk);

Since you are assigning md->core_clk to NULL in case clk_get() returned
an error, checking for md->core_clk is not necessary since the Linux
common clock framework perform that NULL check already.
-- 
-- 
Florian
