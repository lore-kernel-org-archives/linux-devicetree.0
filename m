From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 2/3] regulator: Add support for S2MPA01 regulator
Date: Tue, 18 Mar 2014 09:12:44 +0000
Message-ID: <20140318091244.GI25478@lee--X1>
References: <1394797919-24642-1-git-send-email-sachin.kamat@linaro.org>
 <1394797919-24642-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1394797919-24642-2-git-send-email-sachin.kamat@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-kernel@vger.kernel.org, broonie@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> Add support for S2MPA01 voltage and current regulator.
>=20
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Acked-by: Mark Brown <broonie@linaro.org>
> ---
> Changes since v3:
> Removed a redundant array and instead used a simple variable
> to check return value of devm_regulator_register.
> ---
>  drivers/regulator/Kconfig   |    7 +
>  drivers/regulator/Makefile  |    1 +
>  drivers/regulator/s2mpa01.c |  481 +++++++++++++++++++++++++++++++++=
++++++++++
>  3 files changed, 489 insertions(+)
>  create mode 100644 drivers/regulator/s2mpa01.c

Applied, thanks.

Mark,
  I will follow-up with a pull-request, necessary for conflict
  limitation in Kconfig and Makefile

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
