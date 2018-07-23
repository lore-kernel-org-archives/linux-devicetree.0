From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] of: irq: Add a helper function for irq_of_parse_and_map
Date: Mon, 23 Jul 2018 09:28:52 -0600
Message-ID: <CAL_JsqLozSJ-0YeajN=qHuR69KCjeR_xO21MyZxr-n6tR5G0cw@mail.gmail.com>
References: <1532187494-2704-1-git-send-email-liu.xiang6@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1532187494-2704-1-git-send-email-liu.xiang6@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: liu.xiang6@zte.com.cn
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, liuxiang_1999@126.com
List-Id: devicetree@vger.kernel.org

On Sat, Jul 21, 2018 at 9:38 AM Liu Xiang <liu.xiang6@zte.com.cn> wrote:
>
> Implement a resource managed irq_of_parse_and_map function.

That is obvious from the diff. Why do you need this?

Anything that is a platform device should use platform_get_irq. The
mapping is created by the core Also, of_irq_get() is preferred over
irq_of_parse_and_map() for new users as it has better error return
handling.

>
> Signed-off-by: Liu Xiang <liu.xiang6@zte.com.cn>
> ---
>  drivers/of/irq.c       | 38 ++++++++++++++++++++++++++++++++++++++
>  include/linux/of_irq.h |  7 +++++++
>  2 files changed, 45 insertions(+)
>
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 02ad93a..947fe41 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -45,6 +45,44 @@ unsigned int irq_of_parse_and_map(struct device_node *dev, int index)
>  }
>  EXPORT_SYMBOL_GPL(irq_of_parse_and_map);
>
> +static void devm_irq_dispose_mapping(struct device *dev, void *res)
> +{
> +       irq_dispose_mapping(*(unsigned int *)res);

We don't ref count creating mappings, so this would break for any shared irq.

Rob
