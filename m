From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: omap-usb-host: Remove some unused functions
Date: Tue, 20 Jan 2015 13:43:04 +0000
Message-ID: <20150120134304.GJ13701@x1>
References: <1420330281-5228-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1420330281-5228-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, 04 Jan 2015, Rickard Strandqvist wrote:

> Removes some functions that are not used anywhere:
> usbhs_readb() usbhs_writeb()
>=20
> This was partially found by using a static code analysis program call=
ed cppcheck.
>=20
> Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigit=
al.se>
> ---
>  drivers/mfd/omap-usb-host.c |   10 ----------
>  1 file changed, 10 deletions(-)

Applied, thanks.

> diff --git a/drivers/mfd/omap-usb-host.c b/drivers/mfd/omap-usb-host.=
c
> index 83dab2f..6b0f305 100644
> --- a/drivers/mfd/omap-usb-host.c
> +++ b/drivers/mfd/omap-usb-host.c
> @@ -129,16 +129,6 @@ static inline u32 usbhs_read(void __iomem *base,=
 u32 reg)
>  	return readl_relaxed(base + reg);
>  }
> =20
> -static inline void usbhs_writeb(void __iomem *base, u8 reg, u8 val)
> -{
> -	writeb_relaxed(val, base + reg);
> -}
> -
> -static inline u8 usbhs_readb(void __iomem *base, u8 reg)
> -{
> -	return readb_relaxed(base + reg);
> -}
> -
>  /*------------------------------------------------------------------=
-------*/
> =20
>  /**

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
