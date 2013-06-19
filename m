From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/4] gpio: davinci: DT changes for driver
Date: Wed, 19 Jun 2013 21:10:40 +0200
Message-ID: <CACRpkdbJJVKC539CAPNxxEbofVfw3Pr0gyCSZyY9YbkXneE-qQ@mail.gmail.com>
References: <1371203020-15092-1-git-send-email-avinashphilip@ti.com>
	<1371205241-17205-3-git-send-email-avinashphilipk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1371205241-17205-3-git-send-email-avinashphilipk@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Philip Avinash <avinashphilipk@gmail.com>
Cc: "Nori, Sekhar" <nsekhar@ti.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Philip Avinash <avinashphilip@ti.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 14, 2013 at 12:20 PM, Philip Avinash
<avinashphilipk@gmail.com> wrote:

> From: KV Sujith <sujithkv@ti.com>
>
> - Add of_device_id for Davinci GPIO driver.
> - Add function to populate data from DT.
> - Modify the probe to read from DT if DT match is found.
> - Add DT binding documentation for Davinci GPIO properties in a new file
>   gpio-davinci.txt located at Documentation/devicetree/bindings/gpio/.
>
> Signed-off-by: KV Sujith <sujithkv@ti.com>
> Signed-off-by: Philip Avinash <avinashphilip@ti.com>
> ---
> Changes since v1:
>         - description for interrupts changed to reflecti
>            interrupt array usage.
(...)

> +static struct davinci_gpio_platform_data *davinci_gpio_set_pdata_of(
> +                                               struct platform_device *pdev)
> +{
> +       struct device_node *dn = pdev->dev.of_node;
> +       struct davinci_gpio_platform_data *pdata;
> +       u32 val, ret;
> +
> +       pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
> +       if (pdata) {

Instead of this arrow pattern:

if (!pdata) {
  dev_err( ... "out of memory allocating platform data");
  return NULL;
}

And de-indent the rest.

With that change:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

I guess this may go through the DaVinci tree with the rest of the DaVinci
patches?

Yours,
Linus Walleij
