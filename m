From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH V2 0/5] phy: bcm-ns-usb3: add MDIO driver
Date: Fri, 16 Jun 2017 12:06:21 +0530
Message-ID: <a28bd799-abc2-8f4e-c3db-b9f82f35295a@ti.com>
References: <20170511132925.14564-1-zajec5@gmail.com>
 <20170608200428.9187-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170608200428.9187-1-zajec5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
List-Id: devicetree@vger.kernel.org



On Friday 09 June 2017 01:34 AM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> As explained in the commit 9200c6f177638 ("Revert "phy: Add USB3 PHY support
> for Broadcom NSP SoC"") this module should be modified to use MDIO bus as
> this is how PHY is really attached.
> 
> This should allow reusing this driver on NSP and any other platform with
> MDIO bus and this particular PHY.

can you run checkpatch and fix all warnings in this series?

Thanks
Kishon
> 
> V2: Rebase and update 4/5 and 5/5.
> 
> Rafał Miłecki (5):
>   phy: bcm-ns-usb3: always wait for idle after writing to the PHY reg
>   phy: bcm-ns-usb3: use pointer for PHY writing function
>   phy: bcm-ns-usb3: enable MDIO in the platform specific code
>   dt-bindings: phy: Modify Broadcom NS USB 3.0 PHY binding to use MDIO
>   phy: bcm-ns-usb3: add MDIO driver using proper bus layer
> 
>  .../devicetree/bindings/phy/bcm-ns-usb3-phy.txt    |  27 ++-
>  drivers/phy/broadcom/Kconfig                       |   1 +
>  drivers/phy/broadcom/phy-bcm-ns-usb3.c             | 230 +++++++++++++++------
>  3 files changed, 186 insertions(+), 72 deletions(-)
> 
