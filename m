From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH v2] usb: host: tegra: remove pointless NULL check in
 tegra_ehci_remove()
Date: Thu, 8 Nov 2012 11:05:35 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1211081105190.1280-100000@iolanthe.rowland.org>
References: <CAPgLHd9cJmoJWUAXr-Hpjfar=WH3FKcyDMK_ar3EXeUgi9aTEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPgLHd9cJmoJWUAXr-Hpjfar=WH3FKcyDMK_ar3EXeUgi9aTEA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 8 Nov 2012, Wei Yongjun wrote:

> From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
> 
> Test for tegra and hcd in tegra_ehci_remove() look like potential
> NULL pointer dereference, but in fact those tests are not needed,
> so remove these pointless tests entirely.
> 
> Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
> ---
> v1 -> v2: remove those tests entirely
> ---
>  drivers/usb/host/ehci-tegra.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
> index 6223d175..40daeaa 100644
> --- a/drivers/usb/host/ehci-tegra.c
> +++ b/drivers/usb/host/ehci-tegra.c
> @@ -778,9 +778,6 @@ static int tegra_ehci_remove(struct platform_device *pdev)
>  	struct tegra_ehci_hcd *tegra = platform_get_drvdata(pdev);
>  	struct usb_hcd *hcd = ehci_to_hcd(tegra->ehci);
>  
> -	if (tegra == NULL || hcd == NULL)
> -		return -EINVAL;
> -
>  	pm_runtime_get_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  	pm_runtime_put_noidle(&pdev->dev);

Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
