From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V3 3/3] ARM: dts: imx: make MMDC node name generic
Date: Thu, 28 Feb 2019 15:27:14 -0300
Message-ID: <CAOMZO5CZrCZF0iFnn0qTpKvpUTP_DQSDEsNSGRx=mOSYPWpEGw@mail.gmail.com>
References: <1551321831-11597-1-git-send-email-Anson.Huang@nxp.com> <1551321831-11597-3-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551321831-11597-3-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 27, 2019 at 11:48 PM Anson Huang <anson.huang@nxp.com> wrote:
>
> Node name should be generic, so use "memory-controller"
> instead of "mmdc" for MMDC node name, also remove "mmdc"
> label for platforms with single MMDC node.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V2:
>         - remove "mmdc" label for single MMDC node.

Reviewed-by: Fabio Estevam <festevam@gmail.com>
