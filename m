From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 25/30] arm: dts: mt7623: rename mt7623-evb.dts to
 arch/arm/boot/dts/mt7623n-rfb.dtsi
Date: Fri, 28 Apr 2017 15:30:25 -0500
Message-ID: <20170428203025.gdrtbudfzwy5z4h5@rob-hp-laptop>
References: <1493198774-4478-1-git-send-email-sean.wang@mediatek.com>
 <1493198774-4478-26-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1493198774-4478-26-git-send-email-sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 26, 2017 at 05:26:09PM +0800, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> There are 2 versions of the SoC. MT7623N is almost identical to MT7623A
> but has some additional multimedia features. The reference boards are
> available as NAND or MMC and might have a different ethernet setup. In
> order to reduce the duplication of devicetree code we add an intermediate
> dtsi file for these reference boards. Additionally Mediatek pointed out,
> that the EVB is yet another board and the board in question is infact the
> RFB. Take this into account while renaming the files.

You are breaking compatibility with existing DTs. Just document which 
flavor you want "mediatek,mt7623" to refer to and add the new one. Or 
just add 2 new strings but keep the old one.

> 
> Signed-off-by: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
> Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> ---
>  Documentation/devicetree/bindings/arm/mediatek.txt |  6 ++--
>  arch/arm/boot/dts/Makefile                         |  2 +-
>  arch/arm/boot/dts/mt7623-evb.dts                   | 33 ----------------------
>  arch/arm/boot/dts/mt7623n-rfb-nand.dts             | 21 ++++++++++++++
>  arch/arm/boot/dts/mt7623n-rfb.dtsi                 | 29 +++++++++++++++++++
>  arch/arm/mach-mediatek/mediatek.c                  |  4 +--
>  arch/arm/mach-mediatek/platsmp.c                   |  2 +-
>  7 files changed, 57 insertions(+), 40 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/mt7623-evb.dts
>  create mode 100644 arch/arm/boot/dts/mt7623n-rfb-nand.dts
>  create mode 100644 arch/arm/boot/dts/mt7623n-rfb.dtsi
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.txt b/Documentation/devicetree/bindings/arm/mediatek.txt
> index c860b24..7f7c804 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek.txt
> @@ -12,7 +12,7 @@ compatible: Must contain one of
>     "mediatek,mt6592"
>     "mediatek,mt6755"
>     "mediatek,mt6795"
> -   "mediatek,mt7623"
> +   "mediatek,mt7623n"
>     "mediatek,mt8127"
>     "mediatek,mt8135"
>     "mediatek,mt8173"
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
