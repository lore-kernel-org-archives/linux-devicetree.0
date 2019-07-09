From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] ARM: bcm47094: add missing #cells for mdio-bus-mux
Date: Tue,  9 Jul 2019 09:16:30 -0700
Message-ID: <20190709161630.7963-1-f.fainelli@gmail.com>
References: <20190703132255.852025-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703132255.852025-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: bcm-kernel-feedback-list@broadcom.com, Arnd Bergmann <arnd@arndb.de>, Hauke Mehrtens <hauke@hauke-m.de>, =?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Vivek Unune <npcomplete13@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed,  3 Jul 2019 15:22:45 +0200, Arnd Bergmann <arnd@arndb.de> wrote:
> The mdio-bus-mux has no #address-cells/#size-cells property,
> which causes a few dtc warnings:
> 
> arch/arm/boot/dts/bcm47094-linksys-panamera.dts:129.4-18: Warning (reg_format): /mdio-bus-mux/mdio@200:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
> arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> arch/arm/boot/dts/bcm47094-linksys-panamera.dts:128.22-132.5: Warning (avoid_default_addr_size): /mdio-bus-mux/mdio@200: Relying on default #address-cells value
> arch/arm/boot/dts/bcm47094-linksys-panamera.dts:128.22-132.5: Warning (avoid_default_addr_size): /mdio-bus-mux/mdio@200: Relying on default #size-cells value
> 
> Add the normal cell numbers.
> 
> Fixes: 2bebdfcdcd0f ("ARM: dts: BCM5301X: Add support for Linksys EA9500")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to devicetree/fixes, thanks!
--
Florian
