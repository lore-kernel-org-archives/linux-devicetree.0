Return-Path: <robherring2@gmail.com>
Date: Mon, 5 Mar 2018 16:15:36 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] usb: host: xhci-rcar: add support for r8a77965
Message-ID: <20180305221536.adxtoyvpxk3av77n@rob-hp-laptop>
References: <1519719320-27792-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1519719320-27792-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, mark.rutland@arm.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Feb 27, 2018 at 05:15:20PM +0900, Yoshihiro Shimoda wrote:
> This patch adds support for r8a77965 (R-Car M3-N).
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
>  drivers/usb/host/xhci-rcar.c                       | 4 ++++
>  2 files changed, 5 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
