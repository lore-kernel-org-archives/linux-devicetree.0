From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] dt: add empty for_each_child_of_node, of_find_property
Date: Thu, 22 Sep 2011 11:29:44 -0600
Message-ID: <20110922172944.GM17168@ponder.secretlab.ca>
References: <1316632990-12876-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1316632990-12876-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 21, 2011 at 01:23:10PM -0600, Stephen Warren wrote:
> The patch adds a couple empty functions for non-dt build, so that
> drivers migrating to dt can save some '#ifdef CONFIG_OF'.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---

Applied, thanks.

g.

> Unfortunately, I screwed up and my recent sdhci-tegra.c changes rely on this
> change to compile without CONFIG_OF; I really need to stop doing my test-
> builds in a single branch will all my outstanding changes present:-(
> 
>  include/linux/of.h |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 9180dc5..1fc5875 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -242,6 +242,16 @@ static inline bool of_have_populated_dt(void)
>  	return false;
>  }
>  
> +#define for_each_child_of_node(parent, child) \
> +	while (0)
> +
> +static inline struct property *of_find_property(const struct device_node *np,
> +						const char *name,
> +						int *lenp)
> +{
> +	return NULL;
> +}
> +
>  static inline int of_property_read_u32_array(const struct device_node *np,
>  					     const char *propname,
>  					     u32 *out_values, size_t sz)
> -- 
> 1.7.0.4
> 
