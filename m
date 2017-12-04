From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH V5 4/7] OF: properties: Implement get_match_data() callback
Date: Mon, 4 Dec 2017 10:23:14 -0600
Message-ID: <CAL_JsqJ+fMqrt6Tk8h6v1fSkrBg+GcMxSXK9XCcz3nmYgyguuQ@mail.gmail.com>
References: <1512188864-773-1-git-send-email-okaya@codeaurora.org> <1512188864-773-5-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1512188864-773-5-git-send-email-okaya@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>
Cc: "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>, Timur Tabi <timur@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Frank Rowand <frowand.list@gmail.com>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 1, 2017 at 10:27 PM, Sinan Kaya <okaya@codeaurora.org> wrote:
> Now that we have a get_match_data() callback as part of the firmware node,
> implement the OF specific piece for it.
>
> Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
> ---
>  drivers/of/property.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 264c355..adcde1a 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -981,6 +981,22 @@ static int of_fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
>         return 0;
>  }
>
> +void *of_fwnode_get_match_data(const struct fwnode_handle *fwnode,
> +                              const struct device_driver *drv)
> +{
> +       const struct device_node *node = to_of_node(fwnode);
> +       const struct of_device_id *match;
> +
> +       if (!node)
> +               return NULL;

of_match_node checks this.

> +
> +       match = of_match_node(drv->of_match_table, node);
> +       if (!match)
> +               return NULL;
> +
> +       return (void *)match->data;

Don't need a cast here.

of_device_get_match_data() already does most of this, but getting a
device ptr from fwnode_handle may not be possible?

Rob
