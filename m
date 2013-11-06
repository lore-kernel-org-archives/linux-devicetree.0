From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH v3 2/3] usb: ehci-s5p: Change to use phy provided by the
 generic phy framework
Date: Wed, 06 Nov 2013 10:09:47 +0900
Message-ID: <000d01ceda8c$e31a6ec0$a94f4c40$%han@samsung.com>
References: <1383668001-19141-1-git-send-email-k.debski@samsung.com>
 <1383668001-19141-3-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1383668001-19141-3-git-send-email-k.debski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
To: 'Kamil Debski' <k.debski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm@vger.kernel.org, kyungmin.park@samsung.com, kishon@ti.com, t.figa@samsung.com, s.nawrocki@samsung.com, m.szyprowski@samsung.com, gautam.vivek@samsung.com, mat.krawczuk@gmail.com, yulgon.kim@samsung.com, p.paneri@samsung.com, av.tikhomirov@samsung.com, galak@codeaurora.org, 'Jingoo Han' <jg1.han@samsung.com>
List-Id: devicetree@vger.kernel.org

On Wednesday, November 06, 2013 1:13 AM, Kamil Debski wrote:
> 
> Change the phy provider used from the old usb phy specific to a new one
> using the generic phy framework.
> 
> Signed-off-by: Kamil Debski <k.debski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/usb/host/ehci-exynos.c |   34 +++++++++++-----------------------
>  1 file changed, 11 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
> index 8898c01..974001b 100644
> --- a/drivers/usb/host/ehci-exynos.c
> +++ b/drivers/usb/host/ehci-exynos.c

[.....]

> @@ -98,12 +98,12 @@ static int exynos_ehci_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	}
>  	exynos_ehci = to_exynos_ehci(hcd);
> -
>  	if (of_device_is_compatible(pdev->dev.of_node,
>  					"samsung,exynos5440-ehci"))
>  		goto skip_phy;
> 
> -	phy = devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
> +	phy_name = of_get_property(pdev->dev.of_node, "phy-names", NULL);
> +	phy =  devm_phy_get(&pdev->dev, phy_name);
>  	if (IS_ERR(phy)) {
>  		usb_put_hcd(hcd);
>  		dev_warn(&pdev->dev, "no platform data or transceiver defined\n");

Hi Kamil,

The following build error happens.

drivers/usb/host/ehci-exynos.c: In function 'exynos_ehci_probe'
drivers/usb/host/ehci-exynos.c:113:14: error: 'struct exynos_ehci_hcd' has no member named 'otg'
drivers/usb/host/ehci-exynos.c:113:25: error: 'struct phy' has no member named 'otg'

Would you add the following to this patch?

--- a/drivers/usb/host/ehci-exynos.c
+++ b/drivers/usb/host/ehci-exynos.c
@@ -110,7 +110,6 @@ static int exynos_ehci_probe(struct platform_device *pdev)
                return -EPROBE_DEFER;
        } else {
                exynos_ehci->phy = phy;
-               exynos_ehci->otg = phy->otg;
        }

Best regards,
Jingoo Han
