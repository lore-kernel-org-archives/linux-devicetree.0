From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 8/8] of: changesets: Introduce changeset helper methods
Date: Tue, 17 Nov 2015 14:13:10 +0100
Message-ID: <CAMuHMdW6XOYLQ6x3wU1tR3wFtRkUR2d0U5Q2AU=t6cCQa4PcEQ@mail.gmail.com>
References: <1434138905-15886-1-git-send-email-pantelis.antoniou@konsulko.com>
	<1434138905-15886-9-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434138905-15886-9-git-send-email-pantelis.antoniou@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Rob Herring <robherring2@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Matt Porter <mporter@konsulko.com>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

Hi Pantelis,

On Fri, Jun 12, 2015 at 9:55 PM, Pantelis Antoniou
<pantelis.antoniou@konsulko.com> wrote:
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -1028,6 +1028,27 @@ static inline int of_changeset_update_property(struct of_changeset *ocs,
>  {
>         return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
>  }
> +
> +struct device_node *of_changeset_create_device_nodev(
> +       struct of_changeset *ocs, struct device_node *parent,
> +       const char *fmt, va_list vargs);
> +__printf(3, 4) struct device_node *of_changeset_create_device_node(
> +       struct of_changeset *ocs, struct device_node *parent,
> +       const char *fmt, ...);
> +int of_changeset_add_property_copy(struct of_changeset *ocs,
> +       struct device_node *np, const char *name,
> +       const void *value, int length);
> +int of_changeset_add_property_string(struct of_changeset *ocs,
> +       struct device_node *np, const char *name, const char *str);
> +__printf(4, 5) int of_changeset_add_property_stringf(struct of_changeset *ocs,
> +               struct device_node *np, const char *name, const char *fmt, ...);
> +int of_changeset_add_property_string_list(struct of_changeset *ocs,
> +       struct device_node *np, const char *name, const char **strs, int count);
> +int of_changeset_add_property_u32(struct of_changeset *ocs,
> +       struct device_node *np, const char *name, u32 val);
> +int of_changeset_add_property_bool(struct of_changeset *ocs,
> +       struct device_node *np, const char *name);
> +
>  #else /* CONFIG_OF_DYNAMIC */
>  static inline int of_reconfig_notifier_register(struct notifier_block *nb)
>  {
> @@ -1047,6 +1068,58 @@ static inline int of_reconfig_get_state_change(unsigned long action,
>  {
>         return -EINVAL;
>  }
> +
> +static inline int of_changeset_create_device_node(struct of_changeset *ocs,
> +       struct device_node *parent, const char *fmt, ...)
> +{
> +       return -EINVAL;
> +}
> +
> +int of_changeset_add_property_copy(struct of_changeset *ocs,

Missing "static inline".

If CONFIG_OF_DYNAMIC=n, you get zillions of:

    multiple definition of `of_changeset_add_property_copy'
    multiple definition of `of_changeset_add_property_string'

> +       struct device_node *np, const char *name,
> +       const void *value, int length)
> +{
> +       return -EINVAL;
> +}
> +
> +int of_changeset_add_property_string(struct of_changeset *ocs,

Likewise.

> +       struct device_node *np, const char *name, const char *str)
> +{
> +       return -EINVAL;
> +}


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
