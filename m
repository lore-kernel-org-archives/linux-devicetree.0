From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 1/2] usb: renesas_usbhs: Change USBHS_TYPE_R8A779x to
 USBHS_TYPE_RCAR_GEN2
Date: Tue, 19 May 2015 10:34:33 +0900
Message-ID: <20150519013433.GB19506@verge.net.au>
References: <1431947055-4324-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1431947055-4324-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1431947055-4324-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-sh-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: gregkh@linuxfoundation.org, balbi@ti.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-usb@vger.kernel.org, linux-sh@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, May 18, 2015 at 08:04:14PM +0900, Yoshihiro Shimoda wrote:
> Since the HSUSB controllers of R-Car Gen2 are the same specification
> (they have 16 pipes and usb-dmac), this patch changes USBHS_TYPE_R8A7790
> and USBHS_TYPE_R8A7791 to USBHS_TYPE_RCAR_GEN2.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Acked-by: Simon Horman <horms+renesas@verge.net.au>
