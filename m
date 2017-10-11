From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v5 2/4] phy: rcar-gen3-usb2: use enum phy_mode in the
 role_store()
Date: Wed, 11 Oct 2017 13:57:40 +0530
Message-ID: <743b1a5b-7c5b-1974-b5d3-a75a17d6b27a@ti.com>
References: <1507628490-7944-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1507628490-7944-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1507628490-7944-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tuesday 10 October 2017 03:11 PM, Yoshihiro Shimoda wrote:
> This patch modifies the role_store() to use "enum phy_mode" instead
> of the local "bool" for host/device mode selection.

looks good except for one minor comment..
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index e00e99a..7314b49 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -219,33 +219,40 @@ static bool rcar_gen3_is_host(struct rcar_gen3_chan *ch)
>  	return !(readl(ch->base + USB2_COMMCTRL) & USB2_COMMCTRL_OTG_PERI);
>  }
>  
> +static enum phy_mode rcar_gen3_get_phy_mode(struct rcar_gen3_chan *ch)
> +{
> +	if (rcar_gen3_is_host(ch))
> +		return PHY_MODE_USB_HOST;
> +	else

the else here is not required.

Thanks
Kishon
