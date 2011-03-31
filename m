From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2 3/6] dt: add new member 'clk' into device_node
Date: Thu, 31 Mar 2011 13:59:51 -0600
Message-ID: <20110331195951.GA31846@ponder.secretlab.ca>
References: <1300472672-13392-1-git-send-email-shawn.guo@linaro.org>
	<1300472672-13392-4-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1300472672-13392-4-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Mar 19, 2011 at 02:24:29AM +0800, Shawn Guo wrote:
> This pointer to 'struct clk' is added to save the reference to 'clk'
> which is dynamically created per dt clock node, so that clkdev API
> like clk_get can work with dt based device driver.
> 
> Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  include/linux/of.h |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index d9dd664..e621295 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -54,6 +54,7 @@ struct device_node {
>  	struct	device_node *allnext;	/* next in list of all nodes */
>  	struct	proc_dir_entry *pde;	/* this node's proc directory */
>  	struct	kref kref;
> +	struct	clk *clk;

The dt clock support code can already translate from dt node to a
clock provider, and each clock provider should provide a .get() hook
to return the correct struct clk.  of_clk_add_provider() inserts a
mapping into the of_clk_providers() list, and clk_get() calls
of_clk_get() which will process a devicenode->clk provider mapping.

Adding a struct clk pointer to the device node isn't sufficient since
a single clock provider node can provide multiple clock outputs.

g.
