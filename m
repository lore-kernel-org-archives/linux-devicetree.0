From: "Kumar, Anil" <anilkumar.v-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 0/2]  ARM: davinci: da850: add pinctrl support
Date: Fri, 7 Dec 2012 15:57:29 +0530
Message-ID: <1354876051-25938-1-git-send-email-anilkumar.v@ti.com>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, hs-ynQEQJNshbs@public.gmane.org
List-Id: devicetree@vger.kernel.org

This set of patches adds:

* Add pinctrl-single for handling Padconf registers.
* Add NAND node to export NAND functionality on da850 EVM.
* Add NAND pinctrl node to do pin mux according to pinctrl-single driver.

Kumar, Anil (2):
  ARM: davinci: da850: add pinctrl driver entries
  ARM: davinci: da850: add NAND driver entries

 .../devicetree/bindings/arm/davinci/pinctrl.txt    |   29 ++++++++++++++++++++
 arch/arm/Kconfig                                   |    1 +
 arch/arm/boot/dts/da850-evm.dts                    |   22 +++++++++++++++
 arch/arm/boot/dts/da850.dtsi                       |   23 +++++++++++++++
 arch/arm/configs/da8xx_omapl_defconfig             |    1 +
 5 files changed, 76 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/davinci/pinctrl.txt

-- 
1.7.4.1
