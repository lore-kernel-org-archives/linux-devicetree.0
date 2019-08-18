From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH nvmem v2 0/2] nvmem: imx: add i.MX8QM platform support
Date: Sun, 18 Aug 2019 10:34:44 +0100
Message-ID: <5c7e5ff3-f453-c765-8795-c392434c7663@linaro.org>
References: <20190807040320.1760-1-fugang.duan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807040320.1760-1-fugang.duan@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: fugang.duan@nxp.com
Cc: robh@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, shawnguo@kernel.org, kernel@pengutronix.de, gregkh@linuxfoundation.org, festevam@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 07/08/2019 05:03, fugang.duan@nxp.com wrote:
> From: Fugang Duan <fugang.duan@nxp.com>
> 
> The patch set is to add i.MX8QM platform support for i.MX8 SCU
> OCOTP driver due to i.MX8QM efuse table has some difference with
> i.MX8QXP platform.
> 
> V2:
> - Add dt-bindings for the new compatible string support.
> 
> Fugang Duan (2):
>    nvmem: imx: add i.MX8QM platform support
>    dt-bindings: fsl: scu: add new compatible string for ocotp
> 

Applied thanks.

--srini
>   Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 4 +++-
>   drivers/nvmem/imx-ocotp-scu.c                               | 7 +++++++
>   2 files changed, 10 insertions(+), 1 deletion(-)
> 
