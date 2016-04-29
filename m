From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 0/3] phy: rcar-gen3-usb2: add vbus-supply and extcon
Date: Fri, 29 Apr 2016 14:23:11 +0530
Message-ID: <572320F7.7090201@ti.com>
References: <1456999746-2800-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456999746-2800-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On Thursday 03 March 2016 03:39 PM, Yoshihiro Shimoda wrote:
> This patch set is based on the latest linux-phy / next branch
> (commit id = 89636adde4a05953e3bf18807ba1f6f205572f67)
> and the following patches:
> 
> http://thread.gmane.org/gmane.linux.kernel/2166364
> http://thread.gmane.org/gmane.linux.kernel.renesas-soc/1512/focus=1514
> 
> The patch "Add vbus-supply to handle VBUS on/off" has
> Rob's Acked-by as the followings:
> http://thread.gmane.org/gmane.linux.kernel.renesas-soc/1087/focus=1153

merged, thanks.

-Kishon
> 
> Yoshihiro Shimoda (3):
>   phy: rcar-gen3-usb2: remove unnecesary struct rcar_gen3_data
>   phy: rcar-gen3-usb2: Add vbus-supply to handle VBUS on/off
>   phy: rcar-gen3-usb2: add extcon support
> 
>  .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |  2 +
>  drivers/phy/Kconfig                                |  1 +
>  drivers/phy/phy-rcar-gen3-usb2.c                   | 87 +++++++++++++++++-----
>  3 files changed, 71 insertions(+), 19 deletions(-)
> 
