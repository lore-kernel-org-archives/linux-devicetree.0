From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] dt: Add empty of_match_node() macro
Date: Mon, 24 Oct 2011 16:25:20 +0200
Message-ID: <20111024142520.GY8708@ponder.secretlab.ca>
References: <1319450012-13033-1-git-send-email-nicolas.ferre@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1319450012-13033-1-git-send-email-nicolas.ferre@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: robherring2@gmail.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 24, 2011 at 11:53:32AM +0200, Nicolas Ferre wrote:
> Add an empty macro for of_match_node() that will save
> some '#ifdef CONFIG_OF' for non-dt builds.
> 
> I have chosen to use a macro instead of a function to
> be able to avoid defining the first parameter.
> In fact, this "struct of_device_id *" first parameter
> is usualy not defined as well on non-dt builds.
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>

After private discussion, yes this is okay.  I've picked it up.

g.

> ---
>  include/linux/of.h |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 736b747..92c40a1 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -303,6 +303,7 @@ static inline struct device_node *of_parse_phandle(struct device_node *np,
>  }
>  
>  #define of_match_ptr(_ptr)	NULL
> +#define of_match_node(_matches, _node)	NULL
>  #endif /* CONFIG_OF */
>  
>  static inline int of_property_read_u32(const struct device_node *np,
> -- 
> 1.7.5.4
> 
