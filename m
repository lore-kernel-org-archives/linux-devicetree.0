From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM64: dts: Add support for Meson GXM
Date: Wed, 23 Nov 2016 13:23:24 +0100
Message-ID: <CAFBinCAbUK-6uLc_ceJ5d-oD4N_HGz9rbtCvivTp1N8OOVBNBg@mail.gmail.com>
References: <20161122100046.25899-1-narmstrong@baylibre.com> <20161122100046.25899-2-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161122100046.25899-2-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 22, 2016 at 11:00 AM, Neil Armstrong
<narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
> Following the Amlogic Linux kernel, it seem the only differences
> between the GXL and GXM SoCs are the CPU Clusters.
>
> This commit renames the gxl-s905d-p23x DTSI in a common file for
> S905D p23x and S912 q20x boards.
>
> Then adds a meson-gxm dtsi and reproduce the P23x to Q20x boards
> dts files since the S905D and S912 SoCs shares the same pinout
> and the P23x and Q20x boards are identical.
>
> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Tested-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>

I have tested this successfully on a Mecool BB2 (similar to the Q200
reference board).
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
