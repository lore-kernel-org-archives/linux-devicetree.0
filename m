From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: bcm47094: add missing #cells for mdio-bus-mux
Date: Mon, 22 Jul 2019 11:13:54 +0200
Message-ID: <CAK8P3a0eosUb0mZ_rDayChXC36w5Xj0gqtcKOcPCP8MEiMm3bQ@mail.gmail.com>
References: <20190703132255.852025-1-arnd@arndb.de> <20190709161630.7963-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190709161630.7963-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vivek Unune <npcomplete13@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Neil Armstrong <narmstrong@baylibre.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 9, 2019 at 6:16 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On Wed,  3 Jul 2019 15:22:45 +0200, Arnd Bergmann <arnd@arndb.de> wrote:
> > The mdio-bus-mux has no #address-cells/#size-cells property,
> > which causes a few dtc warnings:
> >
> > arch/arm/boot/dts/bcm47094-linksys-panamera.dts:129.4-18: Warning (reg_format): /mdio-bus-mux/mdio@200:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
> > arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> > arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> > arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> > arch/arm/boot/dts/bcm47094-linksys-panamera.dts:128.22-132.5: Warning (avoid_default_addr_size): /mdio-bus-mux/mdio@200: Relying on default #address-cells value
> > arch/arm/boot/dts/bcm47094-linksys-panamera.dts:128.22-132.5: Warning (avoid_default_addr_size): /mdio-bus-mux/mdio@200: Relying on default #size-cells value
> >
> > Add the normal cell numbers.
> >
> > Fixes: 2bebdfcdcd0f ("ARM: dts: BCM5301X: Add support for Linksys EA9500")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
>
> Applied to devicetree/fixes, thanks!

I just noticed this never made it into linux-next or the merge window.
Did it get dropped by accident?

       Arnd
