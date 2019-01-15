From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH 0/3] nvmem: imx-ocotp: Implement i.MX6ULL/ULZ support
Date: Tue, 15 Jan 2019 11:17:49 +0100
Message-ID: <7ca64f1d-8649-79a3-4c48-5242a68a837b@i2se.com>
References: <1544536273-17909-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1544536273-17909-1-git-send-email-stefan.wahren@i2se.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-imx@nxp.com, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

Hi Shawn,
hi Srinivas,

Am 11.12.18 um 14:51 schrieb Stefan Wahren:
> According to the reference manuals for i.MX6ULL and i.MX6ULZ both SoCs
> only support 8 OTP banks instead of 16. So we can't use the compatible
> string of i.MX6UL.
>
> Stefan Wahren (3):
>   dt-bindings: imx-ocotp: Add i.MX6ULL/ULZ support
>   nvmem: imx-ocotp: Implement i.MX6ULL/ULZ support
>   ARM: dts: imx6ull: Fix i.MX6ULL/ULZ ocotp compatible
>
>  Documentation/devicetree/bindings/nvmem/imx-ocotp.txt | 3 ++-
>  arch/arm/boot/dts/imx6ull.dtsi                        | 4 ++++
>  drivers/nvmem/imx-ocotp.c                             | 7 +++++++
>  3 files changed, 13 insertions(+), 1 deletion(-)
>
Rob already gave his Reviewed-By for the binding. Are you fine with the rest of the series?

Regards
Stefan
