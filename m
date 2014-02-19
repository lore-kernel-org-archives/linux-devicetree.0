From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 1/4] DT: Vendor prefixes: Add ricoh, qnap, sii and synology
Date: Wed, 19 Feb 2014 15:17:48 -0600
Message-ID: <CAL_JsqLR4efVwHL4KCHqqLfj64Uf+TefwDrpKjTpQE5uS6HPTA@mail.gmail.com>
References: <1392840157-31072-1-git-send-email-klightspeed@killerwolves.net>
	<1392840157-31072-2-git-send-email-klightspeed@killerwolves.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392840157-31072-2-git-send-email-klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 19, 2014 at 2:02 PM,  <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org> wrote:
> From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
>
> The following patches make use of vendor names:
> * ricoh (Ricoh Co. Ltd.);
> * qnap (QNAP Systems, Inc.);
> * sii (Seiko Instruments, Inc.); and
> * synology (Synology, Inc.)
>
> Add them to the vendor prefix list.
>
> Signed-off-by: Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
> Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> Acked-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
> v2:
> Use stock ticker for Ricoh as vendor name
> s/Richoh/Ricoh/
>
> v5:
> Add vendor prefix for QNAP
>
> v6:
> Revert qnap vendor prefix change from v5
> Now properly based on -rc1
>
> v7:
> Revert ricoh vendor prefix change from v2
>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 3f900cd..4a52fa9 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -65,10 +65,12 @@ picochip    Picochip Ltd
>  powervr        PowerVR (deprecated, use img)
>  qca    Qualcomm Atheros, Inc.
>  qcom   Qualcomm, Inc.
> +qnap   QNAP Systems, Inc.
>  ralink Mediatek/Ralink Technology Corp.
>  ramtron        Ramtron International
>  realtek Realtek Semiconductor Corp.
>  renesas        Renesas Electronics Corporation
> +ricoh  Ricoh Co. Ltd.
>  rockchip       Fuzhou Rockchip Electronics Co., Ltd
>  samsung        Samsung Semiconductor
>  sbs    Smart Battery System
> @@ -76,11 +78,13 @@ schindler   Schindler
>  sil    Silicon Image
>  silabs Silicon Laboratories
>  simtek
> +sii    Seiko Instruments, Inc.
>  sirf   SiRF Technology, Inc.
>  snps   Synopsys, Inc.
>  st     STMicroelectronics
>  ste    ST-Ericsson
>  stericsson     ST-Ericsson
> +synology       Synology, Inc.
>  ti     Texas Instruments
>  tlm    Trusted Logic Mobility
>  toshiba        Toshiba Corporation
> --
> 1.8.3.2
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
