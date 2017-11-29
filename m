From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: overlay: Remove else after goto
Date: Wed, 29 Nov 2017 04:30:32 -0500
Message-ID: <6d0dc834-6df6-fa6c-3adc-5506f432fa7d@gmail.com>
References: <1511857593-18574-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1511857593-18574-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/28/17 03:26, Geert Uytterhoeven wrote:
> If an "if" branch is terminated by a "goto", there's no need to have an
> "else" statement and an indented block of code.
> 
> Remove the "else" statement to simplify the code flow for the casual
> reviewer.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> ---
>  drivers/of/overlay.c | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index 8676411bd3e6f29f..53bc9e3f0b985415 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c
> @@ -580,9 +580,9 @@ static int init_overlay_changeset(struct overlay_changeset *ovcs,
>  				of_node_put(fragment->overlay);
>  				ret = -EINVAL;
>  				goto err_free_fragments;
> -			} else {
> -				cnt++;
>  			}
> +
> +			cnt++;
>  		}
>  	}
>  
> @@ -736,14 +736,12 @@ int of_overlay_apply(struct device_node *tree, int *ovcs_id)
>  			devicetree_state_flags |= DTSF_APPLY_FAIL;
>  		}
>  		goto err_free_overlay_changeset;
> -	} else {
> -		ret = __of_changeset_apply_notify(&ovcs->cset);
> -		if (ret)
> -			pr_err("overlay changeset entry notify error %d\n",
> -			       ret);
> -		/* fall through */
>  	}
>  
> +	ret = __of_changeset_apply_notify(&ovcs->cset);
> +	if (ret)
> +		pr_err("overlay changeset entry notify error %d\n", ret);
> +

The fall through comment was removed.  It is important to document that we
are intentionally continuing despite the error.


>  	list_add_tail(&ovcs->ovcs_list, &ovcs_list);
>  	*ovcs_id = ovcs->id;
>  
> @@ -931,15 +929,12 @@ int of_overlay_remove(int *ovcs_id)
>  		if (ret_apply)
>  			devicetree_state_flags |= DTSF_REVERT_FAIL;
>  		goto out_unlock;
> -	} else {
> -		ret = __of_changeset_revert_notify(&ovcs->cset);
> -		if (ret) {
> -			pr_err("overlay changeset entry notify error %d\n",
> -			       ret);
> -			/* fall through - changeset was reverted */
> -		}
>  	}
>  
> +	ret = __of_changeset_revert_notify(&ovcs->cset);
> +	if (ret)
> +		pr_err("overlay changeset entry notify error %d\n", ret);
> +

And same here.


>  	*ovcs_id = 0;
>  
>  	ret_tmp = overlay_notify(ovcs, OF_OVERLAY_POST_REMOVE);
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
