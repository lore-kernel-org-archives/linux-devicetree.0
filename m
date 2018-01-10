From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: imx6ul-evk: Add support for mag3110 sensor
Date: Wed, 10 Jan 2018 14:51:59 -0200
Message-ID: <CAOMZO5B-_E3mpf7gU02+LAeqSpnNx75yUR-7GSOMYmoVKz3q6g@mail.gmail.com>
References: <1515498385-23198-1-git-send-email-marco.franchi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1515498385-23198-1-git-send-email-marco.franchi@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Franchi <marco.franchi@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 9, 2018 at 9:46 AM, Marco Franchi <marco.franchi@nxp.com> wrote:
> The i.MX 6UL EVK has a MAG3110 Magnetometer sensor in its base board.
> Add support for this sensor, which is included in the trivial i2c devices
> and according to the bindings documentation, just need a compatible field
> and an address.
>
> Signed-off-by: Marco Franchi <marco.franchi@nxp.com>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
