From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] of: define of_find_node_by_phandle for !CONFIG_OF
Date: Wed, 17 Jun 2015 18:33:29 -0500
Message-ID: <CAL_JsqKHFwhsdYmhq2_DJS+mf1jPcfCuSQgwCusTriv-NPLEdg@mail.gmail.com>
References: <1434560033-26681-1-git-send-email-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434560033-26681-1-git-send-email-s-anna@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Suman Anna <s-anna@ti.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 17, 2015 at 11:53 AM, Suman Anna <s-anna@ti.com> wrote:
> Define stub implementation for of_find_node_by_phandle() API
> so that users of this API can build properly even when CONFIG_OF
> is not defined.
>
> Signed-off-by: Suman Anna <s-anna@ti.com>

Do you have a user for this? If not, apply it when you do.

Acked-by: Rob Herring <robh@kernel.org>

> ---
>  include/linux/of.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/linux/of.h b/include/linux/of.h
> index ddeaae6d2083..90dfdc47ae26 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -422,6 +422,11 @@ static inline struct device_node *of_find_node_opts_by_path(const char *path,
>         return NULL;
>  }
>
> +static inline struct device_node *of_find_node_by_phandle(phandle handle)
> +{
> +       return NULL;
> +}
> +
>  static inline struct device_node *of_get_parent(const struct device_node *node)
>  {
>         return NULL;
> --
> 2.4.1
>
