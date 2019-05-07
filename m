Return-Path: <SRS0=53jk=TH=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH 03/10] phy: renesas: rcar-gen3-usb2: Check dr_mode when
 not using OTG
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-4-chris.brandt@renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <5af1345d-a7ed-c1d6-0c72-e6506427319a@cogentembedded.com>
Date: Tue, 7 May 2019 11:40:45 +0300
MIME-Version: 1.0
In-Reply-To: <20190506234631.113226-4-chris.brandt@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 07.05.2019 2:46, Chris Brandt wrote:

> When not using OTG, the PHY will need to know if it should function as
> host or peripheral by checking dr_mode in the PHY node (not the parent
> controller node).
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>   drivers/phy/renesas/phy-rcar-gen3-usb2.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index 218b32e458cb..4eaa228ebd30 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -408,7 +408,12 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
>   		if (rcar_gen3_needs_init_otg(channel))
>   			rcar_gen3_init_otg(channel);
>   		rphy->otg_initialized = true;
> -	}
> +	} else
> +		/* Not OTG, so dr_mode should be set in PHY node */
> +		if (usb_get_dr_mode(channel->dev) == USB_DR_MODE_PERIPHERAL)
> +			writel(0x80000000, usb2_base + USB2_COMMCTRL);
> +		else
> +			writel(0x00000000, usb2_base + USB2_COMMCTRL);
>   
>   	rphy->initialized = true;
>   
> @@ -638,6 +643,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>   	if (of_property_read_bool(dev->of_node, "renesas,uses_usb_x1"))
>   		channel->uses_usb_x1 = true;
>   
> +

    Unrelated whitespace tweaking? :-)

>   	/*
>   	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
>   	 * And then, phy-core will manage runtime pm for this device.

MBR, Sergei
