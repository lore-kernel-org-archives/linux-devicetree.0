From: "Kumar, Anil" <anilkumar.v@ti.com>
Subject: RE: [PATCH 0/2]  ARM: davinci: da850: add pinctrl support
Date: Mon, 17 Dec 2012 04:26:47 +0000
Message-ID: <F3DBB1B3EF102E4994C89758CFCA32412A40C5@DBDE01.ent.ti.com>
References: <1354876051-25938-1-git-send-email-anilkumar.v@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1354876051-25938-1-git-send-email-anilkumar.v@ti.com>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: "Kumar, Anil" <anilkumar.v@ti.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>
Cc: "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "Nori, Sekhar" <nsekhar@ti.com>, "hs@denx.de" <hs@denx.de>
List-Id: devicetree@vger.kernel.org

Hi All,

As pinctrl-single is required for handling Pad configuration of various 
DaVinci module(for e.g mcasp, i2c etc) with DT. Hence for this patch if
there are no review comments, could you pull this patch ?

Thanks,
Anil     

On Fri, Dec 07, 2012 at 15:57:29, Kumar, Anil wrote:
> This set of patches adds:
> 
> * Add pinctrl-single for handling Padconf registers.
> * Add NAND node to export NAND functionality on da850 EVM.
> * Add NAND pinctrl node to do pin mux according to pinctrl-single driver.
> 
> Kumar, Anil (2):
>   ARM: davinci: da850: add pinctrl driver entries
>   ARM: davinci: da850: add NAND driver entries
> 
>  .../devicetree/bindings/arm/davinci/pinctrl.txt    |   29 ++++++++++++++++++++
>  arch/arm/Kconfig                                   |    1 +
>  arch/arm/boot/dts/da850-evm.dts                    |   22 +++++++++++++++
>  arch/arm/boot/dts/da850.dtsi                       |   23 +++++++++++++++
>  arch/arm/configs/da8xx_omapl_defconfig             |    1 +
>  5 files changed, 76 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/davinci/pinctrl.txt
> 
> -- 
> 1.7.4.1
> 
> 

