From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2] of: Change logic to overwrite cmd_line with
	CONFIG_CMDLINE
Date: Mon, 19 Sep 2011 22:55:10 -0600
Message-ID: <20110920045510.GA31886@ponder.secretlab.ca>
References: <1316494215.7975.29.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1316494215.7975.29.camel@pasglop>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 20, 2011 at 02:50:15PM +1000, Benjamin Herrenschmidt wrote:
> We used to overwrite with CONFIG_CMDLINE if we found a chosen
> node but failed to get bootargs out of it or they were empty,
> unless CONFIG_CMDLINE_FORCE is set.
> 
> Instead change that to overwrite if "data" is non empty after
> the bootargs check. It allows arch code to have other mechanisms
> to retrieve the command line prior to parsing the device-tree.
> 
> Note: CONFIG_CMDLINE_FORCE case should ideally be handled elsewhere
> as it won't work as it-is if the device-tree has no /chosen node
> 
> Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> CC: devicetree-discuss-w3QoH2/gNlk/bJ5BZ2RsiQ@public.gmane.org
> CC: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

Looks okay to me.

Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

> ---
>  drivers/of/fdt.c |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)
> 
> v2. Use "data" instead of "cmd_line" so it works on archs like
> mips who don't pass cmd_line to that function to start with, also
> add a comment explaining the mechanism.
> 
> (resent with right list address as well while at it)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 65200af..323b722 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -681,9 +681,14 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>  	if (p != NULL && l > 0)
>  		strlcpy(data, p, min((int)l, COMMAND_LINE_SIZE));
>  
> +	/*
> +	 * CONFIG_CMDLINE is meant to be a default in case nothing else
> +	 * managed to set the command line, unless CONFIG_CMDLINE_FORCE
> +	 * is set in which case we override whatever was found earlier.
> +	 */
>  #ifdef CONFIG_CMDLINE
>  #ifndef CONFIG_CMDLINE_FORCE
> -	if (p == NULL || l == 0 || (l == 1 && (*p) == 0))
> +	if (!data[0])
>  #endif
>  		strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
>  #endif /* CONFIG_CMDLINE */
> -- 
> 1.7.4.1
> 
> 
> 
> 
