Return-Path: <SRS0=ckZ6=KR=verge.net.au=horms@kernel.org>
Date: Thu, 2 Aug 2018 13:05:13 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v7] usb: gadget: udc: renesas_usb3: Add register of usb
 role switch
Message-ID: <20180802110512.sr76jd5mcms6tv5m@verge.net.au>
References: <1532656240-7951-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1532656240-7951-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Jul 27, 2018 at 10:50:40AM +0900, Yoshihiro Shimoda wrote:
> This patch adds role switch support for R-Car SoCs into the USB 3.0
> peripheral driver. Some R-Car SoCs (e.g. R-Car H3) have USB 3.0
> dual-role device controller which has the USB 3.0 xHCI host and
> Renesas USB 3.0 peripheral.
> 
> Unfortunately, the mode change register (DRD_CON) contains
> the USB 3.0 peripheral controller side only. So, this renesas_usb3
> driver manages the DRD_CON now. However, in peripheral mode, the host
> should stop. Also the host hardware needs to reinitialize its own
> registers when the mode changes from peripheral to host mode.
> Otherwise, the host cannot work correctly (e.g. detect a device
> as high-speed).
> 
> To achieve this reinitialization by a driver, this driver also
> registers a role switch driver to manage the DRD_CON and get
> a device pointer of usb 3.0 host from "companion" property of OF.
> Then, when the usb role is changed, renesas_usb3_role_switch_set()
> will attach/release the xhci-plat driver to reinitialize the host
> hardware.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
