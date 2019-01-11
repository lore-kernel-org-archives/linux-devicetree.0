From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 3/6] gpio: add irq domain activate/deactivate functions
Date: Fri, 11 Jan 2019 14:05:49 -0800
Message-ID: <154724434941.169631.6671178005596601495@swboyd.mtv.corp.google.com>
References: <20190110011258.17227-1-masneyb@onstation.org> <20190110011258.17227-4-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190110011258.17227-4-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>, andy.gross@linaro.org, bjorn.andersson@linaro.org, linus.walleij@linaro.org
Cc: marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Brian Masney (2019-01-09 17:12:55)
> This adds the two new functions gpiochip_irq_domain_activate and
> gpiochip_irq_domain_deactivate that can be used as the activate and
> deactivate functions in the struct irq_domain_ops. This is for
> situations where only gpiochip_{lock,unlock}_as_irq needs to be called.
> SPMI and SSBI GPIO are two users that will initially use these
> functions.
>=20
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
> Stephen: Reply if you want a Suggested-by tag for this.

Sure. Add it please.

Suggested-by: Stephen Boyd <sboyd@kernel.org>

Minor question but otherwise

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

> +/**
> + * gpiochip_irq_domain_deactivate() - Unlock a GPIO used as an IRQ
> + * @domain: The IRQ domain used by this IRQ chip
> + * @data: Outermost irq_data associated with the IRQ
> + *
> + * This function is a wrapper that will call &gpiochip_unlock_as_irq and=
 is to

Is this kernel-doc notation to refer to functions and structures with
ampersand only? According to the docs[1] we should put () after
functions and '&struct' before structures.

> + * be used as the deactivate function for the struct &irq_domain_ops. The
> + * host_data for the IRQ domain must be the struct &gpiochip.
> + */
> +void gpiochip_irq_domain_deactivate(struct irq_domain *domain,
> +                                   struct irq_data *data)
> +{
> +       struct gpio_chip *chip =3D domain->host_data;
> +

[1] https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html?highli=
ght=3Dcross%20references#highlights-and-cross-references
