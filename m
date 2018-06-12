From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: BCM5301X: Make usb3 phy use mdio phy driver
Date: Tue, 12 Jun 2018 11:49:39 -0700
Message-ID: <20180612184939.9095-1-f.fainelli@gmail.com>
References: <20180315135647.48456-1-npcomplete13@gmail.com> <20180409223153.41893-1-npcomplete13@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180409223153.41893-1-npcomplete13@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bcm-kernel-feedback-list@broadcom.com, Vivek Unune <npcomplete13@gmail.com>, florian.fainelli@broadcom.com, hauke@hauke-m.de, zajec5@gmail.com, jonmason@broadcom.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon,  9 Apr 2018 18:31:53 -0400, Vivek Unune <npcomplete13@gmail.com> wrote:
> Currently, usb3 phy in bcm5301x.dtsi uses platform driver which
> requires register range "ccb-mii" <0x18003000 0x1000>. This range
> overlaps with mdio cmd and param registers (<0x18003000 0x8>).
> Essentially, the platform driver partly acts like a mdio bus
> driver, hence to use of this register range.
> 
> In some Northstar devices like Linksys EA9500, secondary switch
> is connected via external mdio. The only way to access and
> configure the external switch is via mdio bus. When we enable the
> mdio bus in it's current state, the mdio bus and any child buses
> fail to register because of the register range overlap.
> 
> On Northstar, the usb3 phy is connected at address 0x10 on the
> internal mdio bus. This change moves the usb3_phy node and makes
> it a child node of internal mdio bus.
> 
> Thanks to Rafał Miłecki's commit af850e14a7ae
> ("phy: bcm-ns-usb3: add MDIO driver using proper bus layer") the
> same usb3 platform driver can now act as usb3 phy mdio driver.
> 
> Tested on Linksys Panamera (EA9500)
> 
> Signed-off-by: Vivek Unune <npcomplete13@gmail.com>
> ---

Applied to devicetree/next, thanks!
--
Florian
