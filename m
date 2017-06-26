From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 0/4] Broadcom STB S2/S3/S5 support for ARM and MIPS
Date: Mon, 26 Jun 2017 15:35:26 -0700
Message-ID: <94d1c634-99fd-e488-0aab-157396c0c86a@gmail.com>
References: <20170626223248.14199-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170626223248.14199-1-f.fainelli@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Markus Mayer <mmayer@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, Eric Anholt <eric@anholt.net>, Justin Chen <justinpopo6@gmail.com>, Doug Berger <opendmb@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:BROADCOM BCM47XX MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, linux-pm@vger.
List-Id: devicetree@vger.kernel.org

On 06/26/2017 03:32 PM, Florian Fainelli wrote:
> Hi,
> 
> This patch series adds support for S2/S3/S5 suspend/resume states on
> ARM and MIPS based Broadcom STB SoCs.
> 
> This was submitted a long time ago by Brian, and I am now picking this
> up and trying to get this included with support for our latest chips.
> 
> Provided that I can collect the necessary Acks from Rob (DT) and other
> people (Rafael?) I would probably take this via the Broadcom ARM SoC
> pull requests.
> 
> Thank you!

I managed to get other patches submitted from a related series, please
disregard those for now.

> 
> Changes in v2:
> 
> - clarify the first patch's subject (Rob)
> - removed patch #2 which was creating a bisectability problem (kbuild)
> - added proper AFLAGS to get s2-arm.S to build properly (kbuild)
> - improved MIPS power management binding document (Rob)
> 
> Brian Norris (1):
>   soc: bcm: brcmstb: Add support for S2/S3/S5 suspend states (ARM)
> 
> Florian Fainelli (2):
>   dt-bindings: ARM: brcmstb: Update Broadcom STB Power Management
>     binding
>   dt-bindings: Document MIPS Broadcom STB power management nodes
> 
> Justin Chen (1):
>   soc bcm: brcmstb: Add support for S2/S3/S5 suspend states (MIPS)
> 
>  .../devicetree/bindings/arm/bcm/brcm,brcmstb.txt   |   6 +-
>  .../devicetree/bindings/mips/brcm/soc.txt          | 153 ++++
>  drivers/soc/bcm/Kconfig                            |   2 +
>  drivers/soc/bcm/brcmstb/Kconfig                    |   9 +
>  drivers/soc/bcm/brcmstb/Makefile                   |   1 +
>  drivers/soc/bcm/brcmstb/pm/Makefile                |   3 +
>  drivers/soc/bcm/brcmstb/pm/aon_defs.h              | 113 +++
>  drivers/soc/bcm/brcmstb/pm/pm-arm.c                | 836 +++++++++++++++++++++
>  drivers/soc/bcm/brcmstb/pm/pm-mips.c               | 461 ++++++++++++
>  drivers/soc/bcm/brcmstb/pm/pm.h                    |  89 +++
>  drivers/soc/bcm/brcmstb/pm/s2-arm.S                |  76 ++
>  drivers/soc/bcm/brcmstb/pm/s2-mips.S               | 200 +++++
>  drivers/soc/bcm/brcmstb/pm/s3-mips.S               | 146 ++++
>  13 files changed, 2094 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/soc/bcm/brcmstb/Kconfig
>  create mode 100644 drivers/soc/bcm/brcmstb/pm/Makefile
>  create mode 100644 drivers/soc/bcm/brcmstb/pm/aon_defs.h
>  create mode 100644 drivers/soc/bcm/brcmstb/pm/pm-arm.c
>  create mode 100644 drivers/soc/bcm/brcmstb/pm/pm-mips.c
>  create mode 100644 drivers/soc/bcm/brcmstb/pm/pm.h
>  create mode 100644 drivers/soc/bcm/brcmstb/pm/s2-arm.S
>  create mode 100644 drivers/soc/bcm/brcmstb/pm/s2-mips.S
>  create mode 100644 drivers/soc/bcm/brcmstb/pm/s3-mips.S
> 


-- 
Florian
