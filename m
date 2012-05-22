From: Dirk Behme <dirk.behme@de.bosch.com>
Subject: Re: [PATCH v2 00/12] add imx usb driver for mx28/6x
Date: Tue, 22 May 2012 15:13:36 +0200
Message-ID: <4FBB9100.8070502@de.bosch.com>
References: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com>
 <CAOMZO5AcP2cAAkuFPJn3Xp5NuR+JG4hDO7Ehq5H-V6PCy4DwNA@mail.gmail.com>
 <20120522050831.GQ6206@b20223-02.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20120522050831.GQ6206@b20223-02.ap.freescale.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Richard Zhao <richard.zhao@freescale.com>
Cc: "marex@denx.de" <marex@denx.de>, "B20596@freescale.com" <B20596@freescale.com>, "linuxzsc@gmaill.com" <linuxzsc@gmaill.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "B29397@freescale.com" <B29397@freescale.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "dong.aisheng@linaro.org" <dong.aisheng@linaro.org>, Fabio Estevam <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 22.05.2012 07:08, Richard Zhao wrote:
> On Mon, May 21, 2012 at 04:34:15PM -0300, Fabio Estevam wrote:
>> Hi Richard,
>>
>> On Mon, May 21, 2012 at 6:23 AM, Richard Zhao
>> <richard.zhao@freescale.com> wrote:
>>> The work is based on  ci13xxx rework done by Alexander Shishkin.
>>>
>>> Status:
>>>  - this version only support host
>>>  - usbotg controler works at host role
>>>
>>> Changes since V1:
>>>  - Merge the work of Marek
>>>  - re-implement connect change notify
>>>  - imx6q: move part of code to clk
>>>  - imx6q: add config-on-boot gpios
>> Can you please also add the driver into the defconfig files?
> Thanks for you reminder.

For i.MX6 I use something like [1].

Best regards

Dirk

[1]

From: Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH] ARM: imx_v6_v7_defconfig: Enable chipidea USB host driver

Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
  arch/arm/configs/imx_v6_v7_defconfig |    8 ++++++--
  1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig 
b/arch/arm/configs/imx_v6_v7_defconfig
index c3a828e..45001ef 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -130,6 +130,7 @@ CONFIG_GPIO_SYSFS=y
  CONFIG_WATCHDOG=y
  CONFIG_IMX2_WDT=y
  CONFIG_MFD_MC13XXX=y
+CONFIG_MFD_ANATOP=y
  CONFIG_REGULATOR=y
  CONFIG_REGULATOR_FIXED_VOLTAGE=y
  CONFIG_REGULATOR_MC13783=y
@@ -166,9 +167,12 @@ CONFIG_LOGO_LINUX_MONO=y
  CONFIG_LOGO_LINUX_VGA16=y
  CONFIG_LOGO_LINUX_CLUT224=y
  CONFIG_USB=y
-CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_EHCI_MXC=y
+CONFIG_USB_EHCI_ROOT_HUB_TT=y
+CONFIG_USB_CHIPIDEA=y
+CONFIG_USB_CHIPIDEA_HOST=y
+CONFIG_USB_CHIPIDEA_DEBUG=y
  CONFIG_USB_STORAGE=y
+CONFIG_USB_MXS_PHY=y
  CONFIG_MMC=y
  CONFIG_MMC_SDHCI=y
  CONFIG_MMC_SDHCI_PLTFM=y
