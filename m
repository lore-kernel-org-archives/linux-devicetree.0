From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: twl6040: Optional clk32k clock handling
Date: Mon, 28 Apr 2014 13:51:16 +0100
Message-ID: <20140428125116.GL21279@lee--X1>
References: <1396522482-32036-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1396522482-32036-1-git-send-email-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: sameo@linux.intel.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> In certain boards the source for the clk32k clock can be gated. In th=
ese
> boards the clk32k clock can be provided to the driver and it is going=
 to be
> enabled/disabled when it is needed.
> If the clk32k clock is not provided the driver will assume that it is=
 always
> running.
>=20
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  Documentation/devicetree/bindings/mfd/twl6040.txt |  2 ++
>  drivers/mfd/twl6040.c                             | 10 ++++++++++
>  include/linux/mfd/twl6040.h                       |  2 ++
>  3 files changed, 14 insertions(+)

Applied, thanks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
