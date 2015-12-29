From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 9/9] phy: omap-usb2: use *syscon* framework API to
 power on/off the PHY
Date: Tue, 29 Dec 2015 14:46:52 -0600
Message-ID: <20151229204652.GA28118@rob-hp-laptop>
References: <1450688053-3429-1-git-send-email-kishon@ti.com>
 <1450688053-3429-10-git-send-email-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1450688053-3429-10-git-send-email-kishon@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rogerq@ti.com
List-Id: devicetree@vger.kernel.org

On Mon, Dec 21, 2015 at 02:24:13PM +0530, Kishon Vijay Abraham I wrote:
> Deprecate using phy-omap-control driver to power on/off the PHY,
> and use *syscon* framework to do the same. This handles
> powering on/off the PHY for the USB2 PHYs used in various TI SoCs.
> 
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> ---
>  Documentation/devicetree/bindings/phy/ti-phy.txt |    8 +-
>  drivers/phy/phy-omap-usb2.c                      |   92 ++++++++++++++++++----
>  include/linux/phy/omap_usb.h                     |   23 ++++++
>  3 files changed, 105 insertions(+), 18 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
