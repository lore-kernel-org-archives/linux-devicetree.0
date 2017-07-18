From: Oleksij Rempel <ore@pengutronix.de>
Subject: Re: [PATCH v7 0/3] nvmem: upstream snvs_lpgpr driver
Date: Tue, 18 Jul 2017 06:52:50 +0200
Message-ID: <07198c02-ac87-ec1f-accd-75ad6fd0ac30@pengutronix.de>
References: <20170620070932.10353-1-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170620070932.10353-1-o.rempel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleksij Rempel <o.rempel@pengutronix.de>, devicetree@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Guy Shapiro <guy.shapiro@mobi-wize.com>, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: devicetree@vger.kernel.org

Hallo all,

Here Gentle Ping to the Old King ;)

DT is already ACKed.

On 20.06.2017 09:09, Oleksij Rempel wrote:
> changes v7:
>  - split imx6ul patch and squash it with with main patches.
>  - spell fixes in the binding documentation
>  - return regmap_bulk_read directly.
>
> changes v6:
>  - check if device is writable by reading GPR_SL and GPR_HL bits
>  - use regmap_bulk_* functions instead of while() { regmap_read/write }
>  - add patch for imx6ul
>
> changes v5:
>  - use dcfg->offset instead of priv->offset.
>
> changes v4:
>  - change dependencies in Kconfig
>  - remove unused includes and order them alphabetically
>  - set MODULE_LICENSE = GPL v2
>  - remove unused int err variable
>
> changes v3:
>  - remove regmap and offset properties.
>
> changes v2:
>  - correct typos: Registe, parrent...
>
> Oleksij Rempel (3):
>   nvmem: dt: document SNVS LPGPR binding
>   nvmem: add snvs_lpgpr driver
>   ARM: dts: imx6qdl.dtsi/imx6ul.dtsi: add "fsl,imx6q-snvs-lpgpr" node
>
>  .../devicetree/bindings/nvmem/snvs-lpgpr.txt       |  20 +++
>  arch/arm/boot/dts/imx6qdl.dtsi                     |   4 +
>  arch/arm/boot/dts/imx6ul.dtsi                      |   4 +
>  drivers/nvmem/Kconfig                              |  10 ++
>  drivers/nvmem/Makefile                             |   2 +
>  drivers/nvmem/snvs_lpgpr.c                         | 155 +++++++++++++++++++++
>  6 files changed, 195 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
>  create mode 100644 drivers/nvmem/snvs_lpgpr.c
>
