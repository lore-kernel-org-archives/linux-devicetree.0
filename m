From: Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH v1] arm64: dts: dwc3: Add description of 'configure-gfladj'
Date: Wed, 5 Sep 2018 15:08:32 -0500
Message-ID: <CADRPPNQLy4vor9ABCZn98eS9m4VtbkmSPd-UPvWMH+xpCaQL1w@mail.gmail.com>
References: <20180829073324.36866-1-yinbo.zhu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180829073324.36866-1-yinbo.zhu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yinbo Zhu <yinbo.zhu@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Xiaobo Xie <xiaobo.xie@nxp.com>, Ran Wang <ran.wang_1@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 29, 2018 at 2:38 AM Yinbo Zhu <yinbo.zhu@nxp.com> wrote:
>
> This patch is to add description of 'configure-gfladj' to binding
> so that configuring devicetree
>
> Signed-off-by: Yinbo Zhu <yinbo.zhu@nxp.com>

This patch should be sent to the DWC3 driver maintainer to review and
probably merged through usb tree.  You shouldn't use the arm64: dts:
prefix for this patch either.

> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> index 3e4c38b..40c6568 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -101,6 +101,7 @@ Optional properties:
>                         When just one value, which means INCRX burst mode enabled. When
>                         more than one value, which means undefined length INCR burst type
>                         enabled. The values can be 1, 4, 8, 16, 32, 64, 128 and 256.
> + - configure-gfladj: determine whether frame length adjustment is required or not.
>
>   - in addition all properties from usb-xhci.txt from the current directory are
>     supported as well
> --
> 1.7.1
>
