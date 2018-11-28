MIME-Version: 1.0
Date: Tue, 27 Nov 2018 22:37:50 -0600
References: <87r2f60wiu.wl-kuninori.morimoto.gx@renesas.com>
	<87o9aa0whf.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o9aa0whf.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <CAL_JsqJmYcd=SVjivse93_GyYvz9MnbOzgjkf_PSxqRCZtUAqg@mail.gmail.com>
Subject: Re: [PATCH 2/2][resend] OF: add for_each_port_of_node()
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Nov 27, 2018 at 8:34 PM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> We have for_each_endpoint_of_node(), but don't have port version of it.
> It is useful if we have it. This patch adds it.

I'd like to see the user for this first.

Generally, I don't think iterating over port or endpoint nodes is the
right way to walk the graph. A given port address has a defined
function and you should be requesting the specific ports.

>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/of/property.c    | 37 +++++++++++++++++++++++++++++++++++++
>  include/linux/of_graph.h | 20 ++++++++++++++++++++
>  2 files changed, 57 insertions(+)
>
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 3db01ee..2ec4c95 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -585,6 +585,43 @@ struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
>  EXPORT_SYMBOL(of_graph_get_port_by_id);
>
>  /**
> + * of_graph_get_next_port() - get next port node
> + * @parent: pointer to the parent device node
> + * @prev: previous port node, or NULL to get first
> + *
> + * Return: An 'port' node pointer with refcount incremented. Refcount
> + * of the passed @prev node is decremented.
> + */
> +struct device_node *of_graph_get_next_port(const struct device_node *parent,
> +                                          struct device_node *prev)
> +{
> +       struct device_node *port;
> +
> +       if (!parent)
> +               return NULL;
> +
> +       if (!prev) {
> +               struct device_node *node;
> +
> +               node = of_get_child_by_name(parent, "ports");
> +               if (node)
> +                       parent = node;
> +               port = NULL;
> +       } else {
> +               port = prev;
> +       }
> +
> +       do {
> +               port = of_get_next_child(parent, port);
> +               if (!port)
> +                       return NULL;
> +       } while (of_node_cmp(port->name, "port"));

Use of_node_name_eq()

> +
> +       return port;
> +}
> +EXPORT_SYMBOL(of_graph_get_next_port);
> +
> +/**
>   * of_graph_get_next_endpoint() - get next endpoint node
>   * @parent: pointer to the parent device node
>   * @prev: previous endpoint node, or NULL to get first
> diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
> index 7fbbf80..d219cc7 100644
> --- a/include/linux/of_graph.h
> +++ b/include/linux/of_graph.h
> @@ -27,6 +27,17 @@ struct of_endpoint {
>  };
>
>  /**
> + * for_each_port_of_node - iterate over every port in a device node
> + * @parent: parent device node containing ports
> + * @child: loop variable pointing to the current port node
> + *
> + * When breaking out of the loop, of_node_put(child) has to be called manually.
> + */
> +#define for_each_port_of_node(parent, child) \
> +       for (child = of_graph_get_next_port(parent, NULL); child != NULL; \
> +            child = of_graph_get_next_port(parent, child))
> +
> +/**
>   * for_each_endpoint_of_node - iterate over every endpoint in a device node
>   * @parent: parent device node containing ports and endpoints
>   * @child: loop variable pointing to the current endpoint node
> @@ -44,6 +55,8 @@ int of_graph_parse_endpoint(const struct device_node *node,
>                                 struct of_endpoint *endpoint);
>  int of_graph_get_endpoint_count(const struct device_node *np);
>  struct device_node *of_graph_get_port_by_id(struct device_node *node, u32 id);
> +struct device_node *of_graph_get_next_port(const struct device_node *parent,
> +                                              struct device_node *previous);
>  struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
>                                         struct device_node *previous);
>  struct device_node *of_graph_get_endpoint_by_regs(
> @@ -75,6 +88,13 @@ static inline struct device_node *of_graph_get_port_by_id(
>         return NULL;
>  }
>
> +static inline struct device_node *of_graph_get_next_port(
> +                                       const struct device_node *parent,
> +                                       struct device_node *previous)
> +{
> +       return NULL;
> +}
> +
>  static inline struct device_node *of_graph_get_next_endpoint(
>                                         const struct device_node *parent,
>                                         struct device_node *previous)
> --
> 2.7.4
>
