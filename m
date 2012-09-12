From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: [PATCH RESEND 0/9] ARM: davinci: DT boot support for DA850
Date: Wed, 12 Sep 2012 22:05:23 +0530
Message-ID: <1347467732-1332-1-git-send-email-nsekhar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series adds basic DT boot support for DA850 EVM and EnBW CMC board.
It applies to master branch of Linux DaVinci tree[1].

Resending this because I missed copying the DT and Documentation folks
last time around. Sorry about that. There is no change in patch contents.

Thanks,
Sekhar

[1] git://gitorious.org/linux-davinci/linux-davinci.git

Heiko Schocher (2):
  ARM: davinci: da850: add SoC DT data
  ARM: davinci: add support for am1808 based EnBW CMC board

Sekhar Nori (7):
  ARM: davinci: uncompress.h: bail out if uart not initialized
  ARM: davinci: serial: provide API to initialze UART clocks
  ARM: davinci: arrange kconfig selects in alphabetical order
  ARM: davinci: da850: add DT boot support
  ARM: davinci: da850 evm: add DT data
  ARM: davinci: da850: generate dtbs for da850 boards
  ARM: davinci: da8xx defconfig: enable DT config options

 Documentation/devicetree/bindings/arm/davinci.txt |   17 ++++++
 arch/arm/Kconfig                                  |    9 +--
 arch/arm/boot/dts/da850-enbw-cmc.dts              |   30 ++++++++++
 arch/arm/boot/dts/da850-evm.dts                   |   28 +++++++++
 arch/arm/boot/dts/da850.dtsi                      |   60 +++++++++++++++++++
 arch/arm/configs/da8xx_omapl_defconfig            |    3 +
 arch/arm/mach-davinci/Kconfig                     |    8 +++
 arch/arm/mach-davinci/Makefile                    |    1 +
 arch/arm/mach-davinci/Makefile.boot               |    2 +
 arch/arm/mach-davinci/da8xx-dt.c                  |   66 +++++++++++++++++++++
 arch/arm/mach-davinci/include/mach/serial.h       |    1 +
 arch/arm/mach-davinci/include/mach/uncompress.h   |    6 ++
 arch/arm/mach-davinci/serial.c                    |   39 ++++++++----
 13 files changed, 254 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/davinci.txt
 create mode 100644 arch/arm/boot/dts/da850-enbw-cmc.dts
 create mode 100644 arch/arm/boot/dts/da850-evm.dts
 create mode 100644 arch/arm/boot/dts/da850.dtsi
 create mode 100644 arch/arm/mach-davinci/da8xx-dt.c

-- 
1.7.10.1
