From: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCHv6 0/2] socfpga: support suspend to ram*
Date: Thu, 4 Jun 2015 17:35:06 -0500
Message-ID: <5570D29A.2030007@opensource.altera.com>
References: <1433270139-7042-1-git-send-email-atull@opensource.altera.com>
 <556E028E.2080800@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <556E028E.2080800@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Tull <atull@opensource.altera.com>, Rob Herring <robh+dt@kernel.org>
Cc: Pavel Machek <pavel@denx.de>, Arnd Bergmann <arnd@arndb.de>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, Delicious Quinoq <delicious.quinoa@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Alan,

On 06/02/2015 02:22 PM, Dinh Nguyen wrote:
> On 06/02/2015 01:35 PM, Alan Tull wrote:
>> Support suspend to ram on socfpga.
>>   * allocate space in ocram using sram driver.
>>   * Add a function in ocram to place DDR in self-refresh
>>     and suspend.
>>   * Prevent suspend if EDAC is enabled.
>>   * Add a device tree binding document for the Altera
>>     SOCFPGA SDRAM controller that is used to put DDR in
>>     self-refresh mode.
>>
>> Alan Tull (2):
>>   ARM: socfpga: support suspend to ram
>>   ARM: socfpga: dts: add sdram controller dt binding doc
>>
>>  .../arm/altera/socfpga-sdram-controller.txt        |   12 ++
>>  arch/arm/mach-socfpga/Kconfig                      |   10 +-
>>  arch/arm/mach-socfpga/Makefile                     |    1 +
>>  arch/arm/mach-socfpga/core.h                       |    6 +-
>>  arch/arm/mach-socfpga/pm.c                         |  149 ++++++++++++++++++++
>>  arch/arm/mach-socfpga/self-refresh.S               |  136 ++++++++++++++++++
>>  arch/arm/mach-socfpga/socfpga.c                    |    6 +-
>>  drivers/edac/altera_edac.c                         |   20 +++
>>  8 files changed, 337 insertions(+), 3 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-sdram-controller.txt
>>  create mode 100644 arch/arm/mach-socfpga/pm.c
>>  create mode 100644 arch/arm/mach-socfpga/self-refresh.S
>>
> 
> 
> Applied.
> 

I had to un-apply this patch because I noticed that it's touching
drivers/edac/altera_edac.c. This part should be a separate patch and
need to go through linux-edac.

Dinh
