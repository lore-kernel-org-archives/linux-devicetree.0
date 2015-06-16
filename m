From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: symlink cros-ec-keyboard from arm to arm64
Date: Tue, 16 Jun 2015 15:55:53 +0100
Message-ID: <20150616145552.GH30522@arm.com>
References: <1434465343-29124-1-git-send-email-djkurtz@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1434465343-29124-1-git-send-email-djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 16, 2015 at 03:35:41PM +0100, Daniel Kurtz wrote:
> The cros-ec-keyboard.dtsi snippet is useful for both arm and arm64 boards.
> Create a link between the two.
> 
> This may not be the most scalable solution, so consider it temporary until
> we find a more central repository for such shared .dtsi snippets.

I don't have strong opinions either way, but we should be consistent as
to whether we use relative paths:

  http://lists.infradead.org/pipermail/linux-arm-kernel/2015-June/350267.html

or symlinks, like below.

Does anybody have some technical arguments one way or the other?

Will

> Signed-off-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  arch/arm64/boot/dts/cros-ec-keyboard.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 120000 arch/arm64/boot/dts/cros-ec-keyboard.dtsi
> 
> diff --git a/arch/arm64/boot/dts/cros-ec-keyboard.dtsi b/arch/arm64/boot/dts/cros-ec-keyboard.dtsi
> new file mode 120000
> index 0000000..42220ac
> --- /dev/null
> +++ b/arch/arm64/boot/dts/cros-ec-keyboard.dtsi
> @@ -0,0 +1 @@
> +../../../arm/boot/dts/cros-ec-keyboard.dtsi
> \ No newline at end of file
> -- 
> 2.2.0.rc0.207.ga3a616c
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
