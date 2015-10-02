From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH 0/6] arm64: Simple additions to NS2 DT
Date: Fri, 2 Oct 2015 23:24:17 +0530
Message-ID: <1443808463-21120-1-git-send-email-anup.patel@broadcom.com>
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
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Vikram Prakash <vikramp@broadcom.com>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, Kumar Gala <galak@codeaurora.org>, Pramod KUMAR <pramodku@broadcom.com>, Anup Patel <anup.patel@broadcom.com>
List-Id: devicetree@vger.kernel.org

We add l2-cache, SMMU, reboot, PMUv3, RNG, and I2C DT nodes
for NS2 SVK.

This patchset is based on v4.3-rc3 and available in ns2_dt1_v1
branch of https://github.com/Broadcom/arm64-linux.git.

The patchset is tested on NS2 SVK.

Anup Patel (5):
  arm64: dts: Add L2-cache DT node for NS2
  arm64: dts: Add SMMU DT node for NS2
  arm64: dts: Add syscon based reboot in DT for NS2
  arm64: dts: Add ARM PMUv3 DT node in NS2 DT
  arm64: dts: Add IPROC RNG200 DT node for NS2

Ray Jui (1):
  arm64: dts: Add I2C nodes for NS2

 arch/arm64/boot/dts/broadcom/ns2-svk.dts |   8 +++
 arch/arm64/boot/dts/broadcom/ns2.dtsi    | 106 +++++++++++++++++++++++++++++--
 2 files changed, 110 insertions(+), 4 deletions(-)

-- 
1.9.1
