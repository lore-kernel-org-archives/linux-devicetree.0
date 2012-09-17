From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] devicetree: clock: mxs: Fix USB PHY clock name
Date: Mon, 17 Sep 2012 15:05:55 +0800
Message-ID: <20120917070553.GE6413@S2101-09.ap.freescale.net>
References: <1347559956-18417-1-git-send-email-fabio.estevam@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1347559956-18417-1-git-send-email-fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 13, 2012 at 03:12:36PM -0300, Fabio Estevam wrote:
> Use a better naming for the USB PHY clock.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  .../devicetree/bindings/clock/imx23-clock.txt      |    2 +-
>  .../devicetree/bindings/clock/imx28-clock.txt      |    4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
We want to keep the clock name consistent between clock driver and
binding doc.  Can you also update clock driver?

Regards,
Shawn

> diff --git a/Documentation/devicetree/bindings/clock/imx23-clock.txt b/Documentation/devicetree/bindings/clock/imx23-clock.txt
> index a0b867e..baadbb1 100644
> --- a/Documentation/devicetree/bindings/clock/imx23-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/imx23-clock.txt
> @@ -52,7 +52,7 @@ clocks and IDs.
>  	lcdif		38
>  	etm		39
>  	usb		40
> -	usb_pwr		41
> +	usb_phy		41
>  
>  Examples:
>  
> diff --git a/Documentation/devicetree/bindings/clock/imx28-clock.txt b/Documentation/devicetree/bindings/clock/imx28-clock.txt
> index aa2af28..52a49a4 100644
> --- a/Documentation/devicetree/bindings/clock/imx28-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/imx28-clock.txt
> @@ -73,8 +73,8 @@ clocks and IDs.
>  	can1		59
>  	usb0		60
>  	usb1		61
> -	usb0_pwr	62
> -	usb1_pwr	63
> +	usb0_phy	62
> +	usb1_phy	63
>  	enet_out	64
>  
>  Examples:
> -- 
> 1.7.9.5
> 
> 
