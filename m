From: Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 0/6] arm: mvebu: Add support for USB host controllers in Armada 370/XP
Date: Tue, 15 Jan 2013 20:54:19 +0100
Message-ID: <9636031.hlmqlZtOEo@bender>
References: <50F5289D.80903@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50F5289D.80903-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michael Opdenacker <michael.opdenacker-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Ezequiel,

On Tuesday 15 January 2013 06:59:57 Ezequiel Garcia wrote:
> Hi,
> 
> This small patch set enables USB support on Armada 370 and Armada XP platforms.
> It's based on Jason Cooper's mvebu/dt branch.
> 
> Any comments or feedback are welcome.

I successfully tested this serie on a Marvell RD-A370-A1 and a DB-MV784MP-GP:

Tested-by: Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>

Thanks!

> 
> Ezequiel Garcia (6):
>  arm: mvebu: Add support for USB host controllers in Armada 370/XP
>  arm: mvebu: Enable USB controllers on Armada 370 evaluation board
>  arm: mvebu: Enable USB controllers on Armada 370 Mirabox board
>  arm: mvebu: Enable USB controllers on Armada XP evaluation board
>  arm: mvebu: Enable USB controllers on Armada XP OpenBlocks AX3-4 board
>  arm: mvebu: Update defconfig to select USB support
> 
>  arch/arm/boot/dts/armada-370-db.dts              |    8 ++++++++
>  arch/arm/boot/dts/armada-370-mirabox.dts         |    8 ++++++++
>  arch/arm/boot/dts/armada-370-xp.dtsi             |   15 +++++++++++++++
>  arch/arm/boot/dts/armada-370.dtsi                |    9 +++++++++
>  arch/arm/boot/dts/armada-xp-db.dts               |   12 ++++++++++++
>  arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts |    9 +++++++++
>  arch/arm/boot/dts/armada-xp.dtsi                 |   17 +++++++++++++++++
>  arch/arm/configs/mvebu_defconfig                 |    5 ++++-
>  arch/arm/mach-mvebu/Kconfig                      |    1 +
>  9 files changed, 83 insertions(+), 1 deletions(-)
>  
> Thanks!
> 
> 
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
