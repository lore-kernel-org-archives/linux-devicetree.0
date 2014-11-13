From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 04/14] ARM: multi_v7_defconfig: Enable st ohci and ehci HCD
 drivers.
Date: Thu, 13 Nov 2014 11:00:07 +0000
Message-ID: <1415876417-28728-5-git-send-email-peter.griffin@linaro.org>
References: <1415876417-28728-1-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1415876417-28728-1-git-send-email-peter.griffin@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, maxime.coquelin@st.com, srinivas.kandagatla@gmail.com, patrice.chotard@st.com, arnd@arndb.de
Cc: peter.griffin@linaro.org, devicetree@vger.kernel.org, lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org

Enable the ehci and ohci drivers in the multi_v7_defconfig so that
the USB controllers on stih41x work by default.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 491b7d5..c7a9517 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -318,9 +318,11 @@ CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_MVEBU=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_TEGRA=y
+CONFIG_USB_EHCI_HCD_STI=y
 CONFIG_USB_EHCI_HCD_PLATFORM=y
 CONFIG_USB_ISP1760_HCD=y
 CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_OHCI_HCD_STI=y
 CONFIG_USB_OHCI_HCD_PLATFORM=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_CHIPIDEA=y
-- 
1.9.1
