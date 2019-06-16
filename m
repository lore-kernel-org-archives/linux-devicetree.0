From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: arm: fsl: Add support for ZII i.MX7 RMU2
 board
Date: Sun, 16 Jun 2019 20:21:48 -0300
Message-ID: <CAOMZO5DNAEGWqG6VTn0KAJ5J5kKy=YurQJZ0FCTDunUADJZ3Pg@mail.gmail.com>
References: <20190614080317.16850-1-andrew.smirnov@gmail.com>
 <20190614080317.16850-2-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190614080317.16850-2-andrew.smirnov@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>, Liang Pan <Liang.Pan@zii.aero>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Healy <cphealy@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Bob Langer <Bob.Langer@zii.aero>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi Andrey,

On Fri, Jun 14, 2019 at 5:03 AM Andrey Smirnov <andrew.smirnov@gmail.com> wrote:

> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 407138ebc0d0..8fb4dc1d55e7 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -158,6 +158,7 @@ properties:
>                - fsl,imx7d-sdb             # i.MX7 SabreSD Board
>                - tq,imx7d-mba7             # i.MX7D TQ MBa7 with TQMa7D SoM
>                - zii,imx7d-rpu2            # ZII RPU2 Board
> +              - zii,imx7d-rmu2            # ZII RMU2 Board

Nit: Please keep the entries in alphabetical order.

Other than that:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
