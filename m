From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 03/10] usb: ehci-orion: avoid double PHY initialization
Date: Fri, 11 Jan 2019 21:03:01 +0300
Message-ID: <ffb3d79a-a506-5bda-402e-98e67d52933f@cogentembedded.com>
References: <20190111133133.24803-1-miquel.raynal@bootlin.com>
 <20190111133133.24803-4-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190111133133.24803-4-miquel.raynal@bootlin.com>
Content-Language: en-MW
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>, Kishon Vijay Abraham I <kishon@ti.com>, Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, linux-usb@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello!

On 01/11/2019 04:31 PM, Miquel Raynal wrote:

> No need to initialize the PHY from the driver's probe. It is done by
> the core automatically and doing it twice would increment the
> phy->powercount counter to 2 instead of 1. During later suspend
> operation, the counter will be decremented to one, no phy->power_off()
> will occur and worst than that, the following phy->power_on() at

   Worse.

> resume time will be also skipped, failing the whole S2RAM operation.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/usb/host/ehci-orion.c | 26 +++-----------------------
>  1 file changed, 3 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-orion.c b/drivers/usb/host/ehci-orion.c
> index 1ad72647a069..3109f082949e 100644
> --- a/drivers/usb/host/ehci-orion.c
> +++ b/drivers/usb/host/ehci-orion.c
> @@ -257,15 +257,7 @@ static int ehci_orion_drv_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->phy)) {
>  		err = PTR_ERR(priv->phy);
>  		if (err != -ENOSYS)
> -			goto err_phy_get;
> -	} else {
> -		err = phy_init(priv->phy);
> -		if (err)
> -			goto err_phy_init;
> -
> -		err = phy_power_on(priv->phy);
> -		if (err)
> -			goto err_phy_power_on;
> +			goto err_dis_clk;

   Familiar code in unfamiliar place. Somebody must have blindly copied it... :-)

[...]

MBR, Sergei
