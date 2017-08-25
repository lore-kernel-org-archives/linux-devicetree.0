From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] OF: move extern declarations of entry pointers inside ifdef
Date: Fri, 25 Aug 2017 10:43:40 -0500
Message-ID: <CABGGisxzNfCKM8JVa08n=Yn2MGZ_j9t98ZK4yEj2S0PxqqxdRQ@mail.gmail.com>
References: <20170825150027.25341-1-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170825150027.25341-1-Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 25, 2017 at 10:00 AM, Eugeniy Paltsev
<Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> wrote:
> Move extern declarations of "of_root", "of_chosen", "of_aliases",
> "of_stdout" pointers inside "CONFIG_OF" ifdef to be able to get rid
> of "CONFIG_OF" ifdef in their usage places.
>
> Suggested-by: Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>
>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> ---
> For example see: https://lkml.org/lkml/2017/8/25/337
>
>  include/linux/of.h | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/of.h b/include/linux/of.h
> index cfc3411..d117bf1 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -131,11 +131,6 @@ static inline struct device_node *of_node_get(struct device_node *node)
>  static inline void of_node_put(struct device_node *node) { }
>  #endif /* !CONFIG_OF_DYNAMIC */
>
> -/* Pointer for first entry in chain of all nodes. */
> -extern struct device_node *of_root;
> -extern struct device_node *of_chosen;
> -extern struct device_node *of_aliases;
> -extern struct device_node *of_stdout;

Just move what you need. Some of these I'd like to see be internal to
the DT code.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
