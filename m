From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] serial/imx: add of_alias_get_id() reference back
Date: Thu, 22 Sep 2011 11:20:33 -0600
Message-ID: <20110922172033.GJ17168@ponder.secretlab.ca>
References: <20110921204545.19871.99088.stgit@ponder>
	<1316674093-14802-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1316674093-14802-1-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 22, 2011 at 02:48:13PM +0800, Shawn Guo wrote:
> As of_alias_get_id() gets fixed and ready for use, the patch adds the
> of_alias_get_id() reference back to imx serial driver.
> 
> Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/tty/serial/imx.c |   13 +++++++++----
>  1 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
> index 4a36470..b550cff 100644
> --- a/drivers/tty/serial/imx.c
> +++ b/drivers/tty/serial/imx.c
> @@ -1318,17 +1318,22 @@ static int serial_imx_resume(struct platform_device *dev)
>  static int serial_imx_probe_dt(struct imx_port *sport,
>  		struct platform_device *pdev)
>  {
> -	static int portnum = 0;
>  	struct device_node *np = pdev->dev.of_node;
>  	const struct of_device_id *of_id =
>  			of_match_device(imx_uart_dt_ids, &pdev->dev);
> +	int ret;
>  
>  	if (!np)
>  		return -ENODEV;
>  
> -	sport->port.line = portnum++;
> -	if (sport->port.line >= UART_NR)
> -		return -EINVAL;
> +	ret = of_alias_get_id(np, "serial");
> +	if (ret < 0) {
> +		pr_err("%s: failed to get alias id, errno %d\n",
> +			__func__, ret);

Should really be using dev_err();

> +		return -ENODEV;
> +	} else {
> +		sport->port.line = ret;
> +	}

The 'else' is unnecessary.  I've removed it.

Merged, thanks.

g.

>  
>  	if (of_get_property(np, "fsl,uart-has-rtscts", NULL))
>  		sport->have_rtscts = 1;
> -- 
> 1.7.4.1
> 
> 
