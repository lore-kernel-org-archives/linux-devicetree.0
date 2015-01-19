From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: db8500-prcmu:  Remove unused function
Date: Mon, 19 Jan 2015 09:55:20 +0000
Message-ID: <20150119095520.GN21886@x1>
References: <1420134593-690-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1420134593-690-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Cc: Linus Walleij <linus.walleij@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 01 Jan 2015, Rickard Strandqvist wrote:

> Remove the function prcmu_get_boot_status() that is not used anywhere=
=2E
>=20
> This was partially found by using a static code analysis program call=
ed cppcheck.
>=20
> Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigit=
al.se>
> ---
>  drivers/mfd/db8500-prcmu.c |    9 ---------
>  1 file changed, 9 deletions(-)

Applied, thanks.

> diff --git a/drivers/mfd/db8500-prcmu.c b/drivers/mfd/db8500-prcmu.c
> index 193cf16..b517501 100644
> --- a/drivers/mfd/db8500-prcmu.c
> +++ b/drivers/mfd/db8500-prcmu.c
> @@ -675,15 +675,6 @@ bool prcmu_has_arm_maxopp(void)
>  }
> =20
>  /**
> - * prcmu_get_boot_status - PRCMU boot status checking
> - * Returns: the current PRCMU boot status
> - */
> -int prcmu_get_boot_status(void)
> -{
> -	return readb(tcdm_base + PRCM_BOOT_STATUS);
> -}
> -
> -/**
>   * prcmu_set_rc_a2p - This function is used to run few power state s=
equences
>   * @val: Value to be set, i.e. transition requested
>   * Returns: 0 on success, -EINVAL on invalid argument

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
