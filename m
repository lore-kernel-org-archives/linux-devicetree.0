From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Subject: Re: [PATCH V2 0/3] Pistachio USB2.0 PHY
Date: Tue, 5 May 2015 15:13:19 -0300
Message-ID: <5549083F.8080505@imgtec.com>
References: <1428444258-25852-1-git-send-email-abrestic@chromium.org> <CAL1qeaE0+aMLBgk8SKgJ3fXm==M2-Z_yEPYNVZ0yxSee-p7YOw@mail.gmail.com>
Reply-To: <1428444258-25852-1-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL1qeaE0+aMLBgk8SKgJ3fXm==M2-Z_yEPYNVZ0yxSee-p7YOw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org, Kishon Vijay Abraham I <kishon@ti.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: devicetree@vger.kernel.org, James Hartley <james.hartley@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Bresticker <abrestic@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi Kishon,

> 
> This series adds support for the USB2.0 PHY present on the IMG Pistachio SoC.
> 
> Based on mips-for-linux-next and tested on the IMG Pistachio BuB.  If possible,
> I'd like this to go through the MIPS tree with Kishon's ACK.
> 

Tested-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>

Can we have your Ack for this series so Ralf can pick it?

Thanks!
Ezequiel

> Cc: James Hartley <james.hartley@imgtec.com>
> Cc: Damien Horsley <Damien.Horsley@imgtec.com>
> 
> Changes from v1:
>  - Added patch to enable PHY driver in pistachio_defconfig
>  - Fixed a couple of spelling errors
> 
> Andrew Bresticker (3):
>   phy: Add binding document for Pistachio USB2.0 PHY
>   phy: Add driver for Pistachio USB2.0 PHY
>   MIPS: pistachio: Enable USB PHY driver in defconfig
> 
>  .../devicetree/bindings/phy/pistachio-usb-phy.txt  |  29 +++
>  arch/mips/configs/pistachio_defconfig              |   1 +
>  drivers/phy/Kconfig                                |   7 +
>  drivers/phy/Makefile                               |   1 +
>  drivers/phy/phy-pistachio-usb.c                    | 206 +++++++++++++++++++++
>  include/dt-bindings/phy/phy-pistachio-usb.h        |  16 ++
>  6 files changed, 260 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt
>  create mode 100644 drivers/phy/phy-pistachio-usb.c
>  create mode 100644 include/dt-bindings/phy/phy-pistachio-usb.h
> 
> --
> 2.2.0.rc0.207.ga3a616c
> 

-- 
Ezequiel
