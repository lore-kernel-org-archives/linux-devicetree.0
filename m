From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V2 5/6] usb: ehci: Add new EHCI driver for Broadcom STB SoC's
Date: Wed, 24 Oct 2018 08:14:40 +0100
Message-ID: <CAK8P3a2v_6T5pkAUR0erFgCN6C4S2zUqq4EEa5nNo+gYdJ+0qw@mail.gmail.com>
References: <1539815349-24126-1-git-send-email-alcooperx@gmail.com> <1539815349-24126-6-git-send-email-alcooperx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1539815349-24126-6-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Cooper <alcooperx@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, David Miller <davem@davemloft.net>, DTML <devicetree@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>, gregkh <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, sunjianguo1@huawei.com, Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>, USB list <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 17, 2018 at 11:30 PM Al Cooper <alcooperx@gmail.com> wrote:

> +
> +static int ehci_brcm_probe(struct platform_device *pdev)
> +{
> +       struct usb_hcd *hcd;
> +       struct resource *res_mem;
> +       struct brcm_priv *priv;
> +       int irq;
> +       int err;
> +
> +       if (usb_disabled())
> +               return -ENODEV;
> +
> +       err = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +       if (err)
> +               return err;

You should never use "dma_coerce_mask_and_coherent" in new code. Make sure that
the DT is correct and call dma_set_mask_and_coherent() instead.

> +#ifdef CONFIG_OF
> +static const struct of_device_id brcm_ehci_of_match[] = {
> +       { .compatible = "brcm,bcm7445-ehci", },
> +       {}
> +};
> +
> +MODULE_DEVICE_TABLE(of, brcm_ehci_of_match);
> +#endif /* CONFIG_OF */
> +
> +static struct platform_driver ehci_brcm_driver = {
> +       .probe          = ehci_brcm_probe,
> +       .remove         = ehci_brcm_remove,
> +       .shutdown       = usb_hcd_platform_shutdown,
> +       .driver         = {
> +               .owner  = THIS_MODULE,
> +               .name   = "ehci-brcm",
> +               .pm     = &ehci_brcm_pm_ops,
> +               .of_match_table = of_match_ptr(brcm_ehci_of_match),
> +       }
> +};

You won't ever use this driver without CONFIG_OF, so just remove the #ifdef and
of_match_ptr() wrapper here. It will still build fine without CONFIG_OF.

      Arnd
