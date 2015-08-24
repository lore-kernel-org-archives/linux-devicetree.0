From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] of/address: Don't loop forever in of_find_matching_node_by_address().
Date: Mon, 24 Aug 2015 10:17:37 -0500
Message-ID: <CAL_JsqLfLoFNz3ZJnRfgxOsi-xCMwas_a0J2i51cv6rwKK+tNg@mail.gmail.com>
References: <1440015467-21364-1-git-send-email-ddaney.cavm@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440015467-21364-1-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Daney <ddaney.cavm@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Robert Richter <rrichter@cavium.com>, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 19, 2015 at 3:17 PM, David Daney <ddaney.cavm@gmail.com> wrote:
> From: David Daney <david.daney@cavium.com>
>
> If the internal call to of_address_to_resource() fails, we end up
> looping forever in of_find_matching_node_by_address().  This can be
> caused by a defective device tree, or calling with an incorrect
> matches argument.
>
> Fix by calling of_find_matching_node() unconditionally at the end of
> the loop.
>
> Signed-off-by: David Daney <david.daney@cavium.com>

Applied and tagged for stable. Thanks.

Rob

> ---
>  drivers/of/address.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 8bfda6a..384574c 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -845,10 +845,10 @@ struct device_node *of_find_matching_node_by_address(struct device_node *from,
>         struct resource res;
>
>         while (dn) {
> -               if (of_address_to_resource(dn, 0, &res))
> -                       continue;
> -               if (res.start == base_address)
> +               if (!of_address_to_resource(dn, 0, &res) &&
> +                   res.start == base_address)
>                         return dn;
> +
>                 dn = of_find_matching_node(dn, matches);
>         }
>
> --
> 1.9.1
>
