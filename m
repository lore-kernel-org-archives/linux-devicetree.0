From: Grant Likely <glikely@secretlab.ca>
Subject: Re: [PATCH 2/6] of: remove struct property.unique_id for FDT
Date: Fri, 6 Oct 2017 14:30:01 +0100
Message-ID: <CACxGe6tw6F4AEU0FdR2Y_V-Ka0mXsm_i6K8nU18jjKQRwUB+Sg@mail.gmail.com>
References: <20171005194422.26224-1-robh@kernel.org> <20171005194422.26224-3-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171005194422.26224-3-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Nicolas Pitre <nico@linaro.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 5, 2017 at 8:44 PM, Rob Herring <robh@kernel.org> wrote:
> Only Sparc uses unique_id, so remove it for FDT builds and shrink struct
> property a bit making the unflattened DT less of a memory hog.

It can be even more constrained than that. I think the only user is
openpromfs so you could make it depend on CONFIG_SUN_OPENPROMFS, and
adjust the needed code in pdt.c.

Ideally, I'd like to be rid of unique_id entirely, but that's a much
more invasive patch set. Regardless:

Acked-by: Grant Likely <grant.likely@secretlab.ca>

(That goes for the entire series)

>
> Cc: Nicolas Pitre <nico@linaro.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  include/linux/of.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/linux/of.h b/include/linux/of.h
> index cfc34117fc92..8f9e96752837 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -38,7 +38,9 @@ struct property {
>         void    *value;
>         struct property *next;
>         unsigned long _flags;
> +#if defined(CONFIG_OF_PROMTREE)
>         unsigned int unique_id;
> +#endif
>         struct bin_attribute attr;
>  };
>
> --
> 2.11.0
>
