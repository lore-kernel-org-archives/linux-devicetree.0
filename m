From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [Patch v3 0/5] Introduce keystone reset driver
Date: Mon, 19 May 2014 11:07:24 -0400
Message-ID: <537A1E2C.8040102@ti.com>
References: <1400495155-11136-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1400495155-11136-1-git-send-email-ivan.khoronzhuk@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: dbaryshkov@gmail.com, dwmw2@infradead.org, ijc+devicetree@hellion.org.uk, arnd@arndb.de
Cc: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, galak@codeaurora.org, grant.likely@linaro.org, rdunlap@infradead.org, linux@arm.linux.org.uk, grygorii.strashko@ti.com, olof@lixom.net, w-kwok2@ti.com, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On Monday 19 May 2014 06:25 AM, Ivan Khoronzhuk wrote:
> These patches introduce keystone reset driver.
> 
> The keystone SoC can be rebooted in several ways. By external reset
> pin, by soft and by watchdogs. This driver allows software reset and reset
> by one of the watchdogs. Also added opportunity to set soft/hard reset type.
> 
> Based on v3.15-rc5
> 
Arnd,
Can I have have your ack/reviewed-by please since you did gave few comments
on previous version.

Dmitry, David W,
Are you ok to get the drivers/power/reset/ related changes merged via arm-soc
tree ? If not, we can split the series accordingly.

Am hoping to get the series merged for v3.16 so do let me know your preference
as early as you can.



> v2..v3
>   Power: reset: keystone-reset: introduce keystone reset driver
> 	- no functional changes, only sanity
>   Power: reset: add bindings for keystone reset driver
>   	- corrected WDT numeration in examples
> 	- extended description of wdt_list property
> 
> v1..v2
> 	- re basedon on v3.15-rc1 without changes
> 
> Ivan Khoronzhuk (5):
>   Power: reset: keystone-reset: introduce keystone reset driver
>   Power: reset: add bindings for keystone reset driver
>   ARM: keystone: remove redundant reset stuff
>   ARM: dts: keystone: update reset node to work with reset driver
>   ARM: keystone: enable reset driver support
> 
>  .../bindings/power/reset/keystone-reset.txt        |  61 ++++++++
>  arch/arm/boot/dts/keystone.dtsi                    |   4 +-
>  arch/arm/configs/keystone_defconfig                |   3 +
>  arch/arm/mach-keystone/keystone.c                  |  35 -----
>  drivers/power/reset/Kconfig                        |   7 +
>  drivers/power/reset/Makefile                       |   1 +
>  drivers/power/reset/keystone-reset.c               | 171 +++++++++++++++++++++
>  7 files changed, 246 insertions(+), 36 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/power/reset/keystone-reset.txt
>  create mode 100644 drivers/power/reset/keystone-reset.c
> 

Regards,
Santosh
