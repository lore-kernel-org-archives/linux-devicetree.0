From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: add document of mediatek efuse driver
Date: Mon, 26 Oct 2015 11:23:44 +0100
Message-ID: <20151026102344.GD25308@pengutronix.de>
References: <1444984751-4572-1-git-send-email-andrew-ct.chen@mediatek.com>
 <1444984751-4572-2-git-send-email-andrew-ct.chen@mediatek.com>
 <562DF8BE.4060205@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <562DF8BE.4060205-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 26, 2015 at 09:56:14AM +0000, Srinivas Kandagatla wrote:
> 
> 
> On 16/10/15 09:39, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> >From: Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >
> >Add Mediatek MT8173 EFUSE Devicetree binding file
> >
> >Signed-off-by: Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> Looks good to me, minor comment below.
> 
> Will queue this for v4.5 once v4.4-rc1 is released.
> 
> 
> >---
> >  .../devicetree/bindings/nvmem/mtk-efuse.txt        | 36 ++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> >
> >diff --git a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> >new file mode 100644
> >index 0000000..92edc3d
> >--- /dev/null
> >+++ b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> >@@ -0,0 +1,36 @@
> >+= Mediatek MTK-EFUSE device tree bindings =
> >+
> >+This binding is intended to represent MTK-EFUSE which is found in most Mediatek SOCs.
> >+
> >+Required properties:
> >+- compatible: should be "mediatek,mt8173-efuse" or "mediatek,mt8135-efuse"
> 
> Can we make the compatible more generic for mediatek socs? Like
> "mediatek,efuse"  Or are they different in each SOC?

While we can add an additional "mediatek,efuse" compatible we should
always add the most specific compatible first. Otherwise we cannot
differentiate between SoCs later without changing the device tree.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
