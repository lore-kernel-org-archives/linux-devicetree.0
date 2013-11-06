From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V2 1/5] mfd: as3722: add clock driver as mfd-sub device
Date: Wed, 6 Nov 2013 12:43:11 +0000
Message-ID: <20131106124311.GJ30901@lee--X1>
References: <1383740303-10956-1-git-send-email-ldewangan@nvidia.com>
 <1383740303-10956-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1383740303-10956-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: sameo@linux.intel.com, mturquette@linaro.org, dwmw2@infradead.org, anton@enomsg.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, rob.herring@calxeda.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 06 Nov 2013, Laxman Dewangan wrote:

> Device ams AS3722 supports the one 32KHz clock output. The clock
> control support is provided through clock driver.
>=20
> Add clock driver as mfd sub device to probe the clock driver.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> ---
> Changes from V1:
> - Move the DT doc change to separate change.
>=20
>  drivers/mfd/as3722.c |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/mfd/as3722.c b/drivers/mfd/as3722.c
> index f161f2e..1d3415c 100644
> --- a/drivers/mfd/as3722.c
> +++ b/drivers/mfd/as3722.c
> @@ -72,6 +72,9 @@ static struct mfd_cell as3722_devs[] =3D {
>  		.resources =3D as3722_adc_resource,
>  	},
>  	{
> +		.name =3D "as3722-clk",
> +	},
> +	{
>  		.name =3D "as3722-power-off",
>  	},
>  };

Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
