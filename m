From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 1/3] ARM: dts: imx: Pass empty memory size on board dts
Date: Fri, 2 Feb 2018 22:01:51 -0200
Message-ID: <CAOMZO5AKkutCx5y8z8XUniaynsUda1dwrZRa=vgWTCqOJu=tgA@mail.gmail.com>
References: <1516800134-5018-1-git-send-email-marcofrk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1516800134-5018-1-git-send-email-marcofrk@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Franchi <marcofrk@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@karo-electronics.de>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Marco Franchi <marco.franchi@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 24, 2018 at 11:22 AM, Marco Franchi <marcofrk@gmail.com> wrote:
> In preparation for removing 'reg = <0 0>;' from the dtsi SoC files, pass
> 'reg = <0 0 >;' to the dts/dtsi board files that do not pass the memory
> size.
>
> Signed-off-by: Marco Franchi <marco.franchi@nxp.com>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
