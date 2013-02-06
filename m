From: "Kumar, Anil" <anilkumar.v-l0cyMroinI0@public.gmane.org>
Subject: [PATCH V2 0/2] ARM: davinci: da850: add wdt DT node
Date: Wed, 6 Feb 2013 09:30:02 +0530
Message-ID: <1360123204-9978-1-git-send-email-anilkumar.v@ti.com>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
Cc: mporter-l0cyMroinI0@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, mchehab-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, hs-ynQEQJNshbs@public.gmane.org, b-cousson-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add wdt DT node and OF_DEV_AUXDATA for wdt driver in
da850 board dt file to use wdt clock.

This is tested on da850 EVM.

Test Procedure:

$watchdog -F /dev/watchdog (Device should not reboot)
 After wdt heartbeat timeout(DEFAULT_HEARTBEAT is 60 sec)
$ctr + c   (Device should reboot after heartbeat timeout)

Changes since V1:

 - Rebase changes on top of v3.8-rc6.
 - Make single patch for wdt DT node and its OF_DEV_AUXDATA entry changes.
 - Fix wdt to machine restart with DT.

Kumar, Anil (2):
  ARM: davinci: da850: add wdt DT node
  ARM: davinci: restart: fix wdt to machine restart with DT

 arch/arm/boot/dts/da850-evm.dts            |    3 +++
 arch/arm/boot/dts/da850.dtsi               |    5 +++++
 arch/arm/mach-davinci/da8xx-dt.c           |    8 +++++++-
 arch/arm/mach-davinci/devices-da8xx.c      |   14 ++++++++++++--
 arch/arm/mach-davinci/include/mach/da8xx.h |    1 -
 5 files changed, 27 insertions(+), 4 deletions(-)

-- 
1.7.4.1
