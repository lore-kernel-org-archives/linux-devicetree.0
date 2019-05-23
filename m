From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH V3 RESEND 2/4] nvmem: imx: add i.MX8 nvmem driver
Date: Thu, 23 May 2019 09:47:10 +0100
Message-ID: <9d8ea55c-e9e7-82f5-45be-53bc86e59f69@linaro.org>
References: <20190522020040.30283-1-peng.fan@nxp.com>
 <20190522020040.30283-2-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190522020040.30283-2-peng.fan@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Fan <peng.fan@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "van.freenix@gmail.com" <van.freenix@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org



On 22/05/2019 02:46, Peng Fan wrote:
> This patch adds i.MX8 nvmem ocotp driver to access fuse via
> RPC to i.MX8 system controller.
> 
> Cc: Srinivas Kandagatla<srinivas.kandagatla@linaro.org>
> Cc: Shawn Guo<shawnguo@kernel.org>
> Cc: Sascha Hauer<s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team<kernel@pengutronix.de>
> Cc: Fabio Estevam<festevam@gmail.com>
> Cc: NXP Linux Team<linux-imx@nxp.com>
> Cc:linux-arm-kernel@lists.infradead.org
> Signed-off-by: Peng Fan<peng.fan@nxp.com>
> ---
> 
> V3:
>   Use imx_sc_msg_misc_fuse_read for req/resp
>   Drop uneccessary check
>   Drop the unnecessary type conversion
>   Minor fixes according to v2 comments
> 
> V2:
>   Add "scu" or "SCU", Add imx_sc_misc_otp_fuse_read, minor fixes
> 
>   drivers/nvmem/Kconfig         |   7 ++
>   drivers/nvmem/Makefile        |   2 +
>   drivers/nvmem/imx-ocotp-scu.c | 161 ++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 170 insertions(+)
>   create mode 100644 drivers/nvmem/imx-ocotp-scu.c

Applied 1/4 and 2/4 patches.
defconfig and dts changes should go via arm-soc tree.

Thanks,
srini
