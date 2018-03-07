Return-Path: <robherring2@gmail.com>
Date: Wed, 7 Mar 2018 14:38:47 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: get of_root directly in place of
 of_find_node_by_path("/")
Message-ID: <20180307203847.l6jfxgizrzzwfrbr@rob-hp-laptop>
References: <1520041604-24482-1-git-send-email-tyreld@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1520041604-24482-1-git-send-email-tyreld@linux.vnet.ibm.com>
To: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Cc: frowand.list@gmail.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Mar 02, 2018 at 08:46:44PM -0500, Tyrel Datwyler wrote:
> There are a couple places in drivers/of where the root node is found
> with a of_find_node_by_path("/") call. This call just returns
> of_node_get(of_root) when the the path "/" is passed as a parameter.
> So, lets fixup these instances to just do that instead.
> 
> Signed-off-by: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
> ---
>  drivers/of/base.c     | 2 +-
>  drivers/of/platform.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index ad28de9..94c1b4d 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -455,7 +455,7 @@ int of_machine_is_compatible(const char *compat)
>  	struct device_node *root;
>  	int rc = 0;
>  
> -	root = of_find_node_by_path("/");
> +	root = of_node_get(of_root);

The former seems more readable to me. I'll wait and see if Frank has any 
comments on this change.

Rob
