From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: salvator-common: enable
 usb3_peri0
Date: Wed, 20 Dec 2017 12:43:32 +0100
Message-ID: <20171220114331.4vz4a6czk6g3a3k7@verge.net.au>
References: <1512640542-10380-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1512640542-10380-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1512640542-10380-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 07, 2017 at 06:55:42PM +0900, Yoshihiro Shimoda wrote:
> This patch enables usb3_peri0 that uses usb3_phy0 to enable VBUS
> detection for the USB3.0 peripheral.
> 
> The Salvator-X[S] has USB3.0 type-A connector and supplies VBUS
> if USB3.0 host runs. So, you need a special cable for it, and
> to stop the VBUS supplies from the board, after you installs
> a gadget driver, you should run the following command to avoid
> conflict VBUS supply:
> 
> 	# echo 1 > /sys/kernel/debug/ee020000.usb/b_device
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks, applied.
