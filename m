MIME-Version: 1.0
In-Reply-To: <1487755758-6066-1-git-send-email-sakari.ailus@linux.intel.com>
References: <1487755758-6066-1-git-send-email-sakari.ailus@linux.intel.com>
Date: Thu, 23 Feb 2017 10:02:30 -0600
Message-ID: <CAL_JsqKL+=6xEchZLMOxLPVggKPYh6wW9zN4TOLr+UPPbgzeBg@mail.gmail.com>
Subject: Re: [PATCH 1/1] devicetree: of_node_put() does not require holding devtree_lock
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Feb 22, 2017 at 3:29 AM, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> While holding a reference to a device_node it is allowed to put that node
> without holding devtree_lock spinlock. Move of_node_put() after releasing
> the spinlock.

True, but why do you really care? It is not a heavyweight operation.

Rob

>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/of/base.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index d4bea3c..a8d7fed 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -286,8 +286,8 @@ struct device_node *of_find_all_nodes(struct device_node *prev)
>         raw_spin_lock_irqsave(&devtree_lock, flags);
>         np = __of_find_all_nodes(prev);
>         of_node_get(np);
> -       of_node_put(prev);
>         raw_spin_unlock_irqrestore(&devtree_lock, flags);
> +       of_node_put(prev);
>         return np;
>  }
>  EXPORT_SYMBOL(of_find_all_nodes);
> @@ -660,8 +660,8 @@ struct device_node *of_get_next_parent(struct device_node *node)
>
>         raw_spin_lock_irqsave(&devtree_lock, flags);
>         parent = of_node_get(node->parent);
> -       of_node_put(node);
>         raw_spin_unlock_irqrestore(&devtree_lock, flags);
> +       of_node_put(node);
>         return parent;
>  }
>  EXPORT_SYMBOL(of_get_next_parent);
> @@ -732,8 +732,8 @@ struct device_node *of_get_next_available_child(const struct device_node *node,
>                 if (of_node_get(next))
>                         break;
>         }
> -       of_node_put(prev);
>         raw_spin_unlock_irqrestore(&devtree_lock, flags);
> +       of_node_put(prev);
>         return next;
>  }
>  EXPORT_SYMBOL(of_get_next_available_child);
> @@ -875,8 +875,8 @@ struct device_node *of_find_node_by_name(struct device_node *from,
>                 if (np->name && (of_node_cmp(np->name, name) == 0)
>                     && of_node_get(np))
>                         break;
> -       of_node_put(from);
>         raw_spin_unlock_irqrestore(&devtree_lock, flags);
> +       of_node_put(from);
>         return np;
>  }
>  EXPORT_SYMBOL(of_find_node_by_name);
> @@ -904,8 +904,8 @@ struct device_node *of_find_node_by_type(struct device_node *from,
>                 if (np->type && (of_node_cmp(np->type, type) == 0)
>                     && of_node_get(np))
>                         break;
> -       of_node_put(from);
>         raw_spin_unlock_irqrestore(&devtree_lock, flags);
> +       of_node_put(from);
>         return np;
>  }
>  EXPORT_SYMBOL(of_find_node_by_type);
> @@ -935,8 +935,8 @@ struct device_node *of_find_compatible_node(struct device_node *from,
>                 if (__of_device_is_compatible(np, compatible, type, NULL) &&
>                     of_node_get(np))
>                         break;
> -       of_node_put(from);
>         raw_spin_unlock_irqrestore(&devtree_lock, flags);
> +       of_node_put(from);
>         return np;
>  }
>  EXPORT_SYMBOL(of_find_compatible_node);
> @@ -970,8 +970,8 @@ struct device_node *of_find_node_with_property(struct device_node *from,
>                 }
>         }
>  out:
> -       of_node_put(from);
>         raw_spin_unlock_irqrestore(&devtree_lock, flags);
> +       of_node_put(from);
>         return np;
>  }
>  EXPORT_SYMBOL(of_find_node_with_property);
> @@ -1051,8 +1051,8 @@ struct device_node *of_find_matching_node_and_match(struct device_node *from,
>                         break;
>                 }
>         }
> -       of_node_put(from);
>         raw_spin_unlock_irqrestore(&devtree_lock, flags);
> +       of_node_put(from);
>         return np;
>  }
>  EXPORT_SYMBOL(of_find_matching_node_and_match);
> --
> 2.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
