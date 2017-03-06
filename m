From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/3] Khadas VIM support (Amlogic Meson GXL S905X)
Date: Mon, 6 Mar 2017 17:12:52 +0100
Message-ID: <ffcba782-4200-4a7e-af67-2e23432de1e9@baylibre.com>
References: <20170304215126.7020-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170304215126.7020-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, gouwa-GEqbEQZgqepWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/04/2017 10:51 PM, Martin Blumenstingl wrote:
> This series adds support for the Khadas VIM and Khadas VIM Pro boards
> (both are provided through a single .dts as the only two differences are
> the eMMC size and different SDIO WIFI chips - both are Broadcom brcmfmac
> based though).
> More details can be found on the official website: [0]
> 
> I have tested this on a Khadas VIM Pro board. It would be nice if someone
> with a non-Pro board could give it a try as well.
> 
> 
> This patchset depends on:
> - "ARM64: defconfig: enable the leds-pwm driver and default-on trigger"
>   see [1] - already merged in v4.12/defconfig of Kevin's Amlogic tree
> - "meson-gxl pinctrl - add the missing PWM pins" see [2]
> - "brcmfmac: add support for BCM43455 with modalias sdio:c00v02D0dA9BF"
>   see [3], this is NOT a direct dependency (it's only required to get
>   WIFI working on the Khadas VIM Pro) and it's already merged for v4.11
>   (commit a62a77881b1b6708ffeddd9bf0529494f7b199e3)
> 
>   
> [0] http://khadas.com/vim/
> [1] http://lists.infradead.org/pipermail/linux-amlogic/2017-February/002474.html
> [2] http://lists.infradead.org/pipermail/linux-amlogic/2017-March/002658.html
> [3] https://www.spinics.net/lists/linux-mmc/msg41627.html
> 
> Martin Blumenstingl (3):
>   devicetree: add vendor prefix for Khadas
>   dt-bindings: amlogic: add the Khadas VIM
>   ARM64: dts: meson-gxl: add support for the Khadas VIM board
> 
>  Documentation/devicetree/bindings/arm/amlogic.txt  |   2 +
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>  arch/arm64/boot/dts/amlogic/Makefile               |   1 +
>  .../dts/amlogic/meson-gxl-s905x-khadas-vim.dts     | 114 +++++++++++++++++++++
>  4 files changed, 118 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> 

Thanks for the work,
I just tested and it works on a non-pro version,

Tested-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

BTW, you should list the other dependencies like the p212 patch.

Neil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
