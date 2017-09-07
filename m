From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND PATCH v4] mfd: max77693: Add muic of_compatible in
 mfd_cell
Date: Thu, 7 Sep 2017 08:57:07 +0100
Message-ID: <20170907075707.ykogagpdknud4xc2@dell>
References: <CGME20170905135037eucas1p16e4017fa044f17cbe2fc61c33dae4cb1@eucas1p1.samsung.com>
 <1504619427-17805-1-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1504619427-17805-1-git-send-email-m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 05 Sep 2017, Maciej Purski wrote:

> This patch adds muic of_compatible in order to use the muic device
> driver in device tree.
> 
> Signed-off-by: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Acked-for-MFD-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> ---
> v2:
> - added muic to documentation
> v3:
> - removed duplication
> v4:
> - fixed commit message
> 
>  Documentation/devicetree/bindings/mfd/max77693.txt | 6 ++++++
>  drivers/mfd/max77693.c                             | 5 ++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/max77693.txt b/Documentation/devicetree/bindings/mfd/max77693.tx

Applied for v4.15, thanks.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
