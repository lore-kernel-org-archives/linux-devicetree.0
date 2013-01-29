From: "Kumar, Anil" <anilkumar.v-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 0/2] DaVinci: da850: Add NOR flash DT node support
Date: Tue, 29 Jan 2013 10:49:54 +0530
Message-ID: <1359436796-25135-1-git-send-email-anilkumar.v@ti.com>
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
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, b-cousson-l0cyMroinI0@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, hs-ynQEQJNshbs@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add NOR flash DT node support for DA850 EVM and related pin mux.
Configure 16 bit data bus width for CS2(aemif) to use the norflash on
DA850.

This series is based on top of 3.8-rc4 and the following patches.

 -drivers/pinctrl: grab default handles from device core
  https://patchwork.kernel.org/patch/1862231/
 -ARM: davinci: da850: add pinctrl driver DT entries

Tested on DA850 EVM.

Kumar, Anil (2):
  ARM: davinci: da850 evm: add norflash DT node
  ARM: davinci: da850: configure CS2(aemif) for norflash

 arch/arm/boot/dts/da850-evm.dts  |   25 +++++++++++++++++++++++
 arch/arm/boot/dts/da850.dtsi     |   41 ++++++++++++++++++++++++++++++++++++++
 arch/arm/mach-davinci/da8xx-dt.c |   17 +++++++++++++++
 3 files changed, 83 insertions(+), 0 deletions(-)

-- 
1.7.4.1
