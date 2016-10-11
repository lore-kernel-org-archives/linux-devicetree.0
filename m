From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 2/3] of/pci: Add helper function to parse
 max-link-speed from dt
Date: Tue, 11 Oct 2016 09:02:51 -0500
Message-ID: <CAL_JsqLkQ_q9rKmZ8pX4btWD8V5qTeYmgDncVuoXi_sAO9kGTA@mail.gmail.com>
References: <1476159987-31372-1-git-send-email-shawn.lin@rock-chips.com>
 <1476159987-31372-2-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1476159987-31372-2-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rajat Jain <rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 10, 2016 at 11:26 PM, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> This new helper function could be used by host drivers to
> get the limitaion of max link speed provided by dt. If the
> property isn't assigned or is invalid, it will return -EINVAL
> to the caller.
>
> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
>
>  drivers/of/of_pci.c    | 27 +++++++++++++++++++++++++++
>  include/linux/of_pci.h |  7 +++++++
>  2 files changed, 34 insertions(+)
>
> diff --git a/drivers/of/of_pci.c b/drivers/of/of_pci.c
> index 589b30c..91fd465 100644
> --- a/drivers/of/of_pci.c
> +++ b/drivers/of/of_pci.c
> @@ -120,6 +120,33 @@ int of_get_pci_domain_nr(struct device_node *node)
>  EXPORT_SYMBOL_GPL(of_get_pci_domain_nr);
>
>  /**
> + * This function will try to find the limitation of link speed by finding
> + * a property called "max-link-speed" of the given device node.
> + *
> + * @node: device tree node with the max link speed information
> + *
> + * Returns the associated max link speed from DT, or a negative value if the
> + * required property is not found or is invalid.
> + */
> +int of_get_pci_max_link_speed(struct device_node *node)

of_pci_get_max_link_speed

> +{
> +       const __be32 *value;
> +       int len;
> +       u16 max_link_speed;
> +
> +       value = of_get_property(node, "max-link-speed", &len);

Use of_property_read_u32 instead.

> +       if (!value || len < sizeof(*value))
> +               return -EINVAL;
> +
> +       max_link_speed = (u16)be32_to_cpup(value);

There's no point in making this a u16.

> +       if (max_link_speed > 4)
> +               return -EINVAL;
> +
> +       return max_link_speed;
> +}
> +EXPORT_SYMBOL_GPL(of_get_pci_max_link_speed);
> +
> +/**
>   * of_pci_check_probe_only - Setup probe only mode if linux,pci-probe-only
>   *                           is present and valid
>   */
> diff --git a/include/linux/of_pci.h b/include/linux/of_pci.h
> index b969e94..a8946d7 100644
> --- a/include/linux/of_pci.h
> +++ b/include/linux/of_pci.h
> @@ -16,6 +16,7 @@ int of_pci_get_devfn(struct device_node *np);
>  int of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin);
>  int of_pci_parse_bus_range(struct device_node *node, struct resource *res);
>  int of_get_pci_domain_nr(struct device_node *node);
> +int of_get_pci_max_link_speed(struct device_node *node);
>  void of_pci_check_probe_only(void);
>  #else
>  static inline int of_irq_parse_pci(const struct pci_dev *pdev, struct of_phandle_args *out_irq)
> @@ -52,6 +53,12 @@ of_get_pci_domain_nr(struct device_node *node)
>         return -1;
>  }
>
> +static inline int
> +of_get_pci_max_link_speed(struct device_node *node)
> +{
> +       return -EINVAL;
> +}
> +
>  static inline void of_pci_check_probe_only(void) { }
>  #endif
>
> --
> 2.3.7
>
>
