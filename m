From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: of: Allow -gpio suffix for property names
Date: Thu, 24 Apr 2014 14:47:12 +0200
Message-ID: <CACRpkdadAUXgC-K6be6SFFn2ZTvCqkTK7VRJEzpFdUbybKc3YA@mail.gmail.com>
References: <1398266889-17489-1-git-send-email-thierry.reding@gmail.com>
	<1398266889-17489-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1398266889-17489-2-git-send-email-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 23, 2014 at 5:28 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Many bindings use the -gpio suffix in property names. Support this in
> addition to the -gpios suffix when requesting GPIOs using the new
> descriptor-based API.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Are the DT bindings really full of such ambiguity between
singular and plural? Examples?

What happens in affected drivers today? It just doesn't work?

Does that mean these bindings are not actively used by any
drivers yet so we could augment the bindings instead, or are
they already deployed so we must implement this?

Would like a word from the DT people here...

>  drivers/gpio/gpiolib.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 7a0b97076374..b991462c22fb 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2594,17 +2594,23 @@ static struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
>                                       unsigned int idx,
>                                       enum gpio_lookup_flags *flags)
>  {
> +       static const char *suffixes[] = { "gpios", "gpio" };
>         char prop_name[32]; /* 32 is max size of property name */
>         enum of_gpio_flags of_flags;
>         struct gpio_desc *desc;
> +       unsigned int i;
>
> -       if (con_id)
> -               snprintf(prop_name, 32, "%s-gpios", con_id);
> -       else
> -               snprintf(prop_name, 32, "gpios");
> +       for (i = 0; i < ARRAY_SIZE(suffixes); i++) {
> +               if (con_id)
> +                       snprintf(prop_name, 32, "%s-%s", con_id, suffixes[i]);
> +               else
> +                       snprintf(prop_name, 32, "%s", suffixes[i]);
>
> -       desc = of_get_named_gpiod_flags(dev->of_node, prop_name, idx,
> -                                       &of_flags);
> +               desc = of_get_named_gpiod_flags(dev->of_node, prop_name, idx,
> +                                               &of_flags);
> +               if (!IS_ERR(desc))
> +                       break;
> +       }

Code snippet left for reference on devicetree ML.

Yours,
Linus Walleij
