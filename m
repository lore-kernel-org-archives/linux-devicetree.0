From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: imx6ul: Add csi node
Date: Thu, 2 May 2019 09:21:08 -0300
Message-ID: <CAOMZO5DTAvdxbb8UQufDTNWgkCj55OzXn=SZFXRocUOnkMY55Q@mail.gmail.com>
References: <20190430074730.8236-1-sebastien.szymanski@armadeus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190430074730.8236-1-sebastien.szymanski@armadeus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi S=C3=A9bastien,

On Tue, Apr 30, 2019 at 4:47 AM S=C3=A9bastien Szymanski
<sebastien.szymanski@armadeus.com> wrote:

> +                       csi: csi@21c4000 {
> +                               compatible =3D "fsl,imx6ul-csi", "fsl,imx=
7-csi";

After adding "fsl,imx6ul-csi" to
Documentation/devicetree/bindings/media/imx7-csi.txt:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
