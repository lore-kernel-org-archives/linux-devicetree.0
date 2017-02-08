From: Jon Mason <jon.mason@broadcom.com>
Subject: [PATCH 0/2] ARM: dts: BCM5301X: QSPI and NAND
Date: Wed,  8 Feb 2017 15:45:14 -0500
Message-ID: <1486586716-6781-1-git-send-email-jon.mason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hauke Mehrtens <hauke@hauke-m.de>, zajec5@gmail.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Change the default SPI of the BCM5301X to be the new(-ish) iProc QSPI
driver.  Testing limited to internal Broadcom systems.  So, this might\
need extended testing (though I epxect it to work).

Also, Add NAND to bcm953012k

Jon Mason (2):
  ARM: dts: BCM5301X: Add NAND entries to bcm953012k
  ARM: dts: BCM5301X: convert to iProc QSPI

 arch/arm/boot/dts/bcm5301x.dtsi  | 50 ++++++++++++++++++++++++----------
 arch/arm/boot/dts/bcm953012k.dts | 58 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 94 insertions(+), 14 deletions(-)

-- 
2.7.4
