From: Mark yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v8 0/2] Add Rockchip Inno-HDMI driver
Date: Tue, 16 Feb 2016 08:44:41 +0800
Message-ID: <56C270F9.9030707@rock-chips.com>
References: <1454049768-30872-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454049768-30872-1-git-send-email-ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ken Mixte <kmixter-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ben Chan <benchan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Zheng Yang <zhengyang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi

Ping, it seems inno hdmi driver is ready, So I'd like to merge it into=20
drm/rockchip if there is no doubt these days.

Thanks.
Mark
On 2016=E5=B9=B401=E6=9C=8829=E6=97=A5 14:42, Yakir Yang wrote:
> Here are a brief introduction to Innosilicon HDMI IP:
>    - Support HDMI 1.4a, HDCP 1.2 and DVI 1.0 standard compliant trans=
mitter
>    - Support HDMI1.4 a/b 3D function defined in HDMI 1.4 a/b spec
>    - Digital video interface supports a pixel size of 24, 30, 36, 48b=
its color depth in RGB
>    - S/PDIF output supports PCM, Dolby Digital, DTS digital audio tra=
nsmission
>      (32-192kHz Fs) using IEC60958 and IEC 61937
>    - The EDID and CEC function are also supported by Innosilicon HDMI=
 Transmitter Controlle
>
> Changes in v8:
> - Don't check whether encoder output format is RGB colorspace, cause =
driver
>    default configure the output colorspace to RGB. (ZhengYang)
> - Correct the check condition in inno_hdmi_config_video_csc() (ZhengY=
ang)
>      - if (data->enc_out_format =3D=3D data->enc_out_format) {
>      + if (data->enc_in_format =3D=3D data->enc_out_format) {
>
> Changes in v7:
> - Correct the module licnese statement (Paul)
>       - MODULE_LICENSE("GPL");
>       + MODULE_LICENSE("GPLv2");
> - Start indentation with tabs and fix the misspell in Kconfig (Paul)
> - Carry the lost device-binding document (Heiko)
>
> Changes in v6:
> - Rebase the Makefile/Kconfig files which add by Chris's rockchip-mip=
i driver (Caeser)
>
> Changes in v5:
> - Use hdmi_infoframe helper functions to packed the infoframe (Russel=
l)
> - Remove the unused double wait_for_completion_timeout for ddc transf=
er (Russell)
> - Remove the unused local variable in "inno_hdmi_i2c_write()" functio=
n (Russell)
>
> Changes in v4:
> - Modify the commit title "drm/rockchip: hdmi: ..." (Mark)
> - Correct the "DKMS" to "DPMS" (Mark)
> - Fix over 80 characters problems (Mark)
> - Remove encoder .prepare/.commit helper functions, and move the vop =
mode
> configure function into encoder .enable helper functions. (Mark)
>
> Changes in v3:
> - Use encoder enable/disable function, and remove the encoder DPMS fu=
nction
> - Keep HDMI PLL power on in standby mode
>
> Changes in v2:
> - Using DRM atomic helper functions for connector init (Mark)
> - Remove "hdmi->connector.encoder =3D encoder;" (Mark)
> - Add the Acked-by tags from Rob
> - Correct the misspell "rk3036-dw-hdmi" (Heiko)
>
> Yakir Yang (2):
>    drm/rockchip: hdmi: add Innosilicon HDMI support
>    dt-bindings: add document for Innosilicon HDMI on Rockchip platfor=
m
>
>   .../display/rockchip/inno_hdmi-rockchip.txt        |  50 ++
>   drivers/gpu/drm/rockchip/Kconfig                   |   8 +
>   drivers/gpu/drm/rockchip/Makefile                  |   1 +
>   drivers/gpu/drm/rockchip/inno_hdmi.c               | 939 ++++++++++=
+++++++++++
>   drivers/gpu/drm/rockchip/inno_hdmi.h               | 362 ++++++++
>   5 files changed, 1360 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/rockch=
ip/inno_hdmi-rockchip.txt
>   create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.c
>   create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.h
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
