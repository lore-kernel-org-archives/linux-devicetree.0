From: Velibor Markovski <velibor.markovski@broadcom.com>
Subject: [PATCH INTERNAL 0/2] Add support for ARM CCN-502 interconnect
Date: Fri, 10 Feb 2017 12:35:07 -0800
Message-ID: <1486758909-23662-1-git-send-email-velibor.markovski@broadcom.com>
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
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, linux-kernel@vger.kernel.org, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Velibor Markovski <velibor.markovski@broadcom.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add compatible string for ARM CCN-502 interconnect.
CCN-502 interconnect is already compatible with the 
existing ARM CCN driver, which supports CCN-504.

This patchset is based on v4.10-rc3 and is available from github:
repo: https://github.com/Broadcom/arm64-linux
branch: arm64-ccn502

Velibor Markovski (2):
  dt-bindings: arm-ccn: Add bindings info for CCN-502 compatible string
  bus: arm-ccn: Enable stats for CCN-502 interconnect

 Documentation/devicetree/bindings/arm/ccn.txt | 1 +
 drivers/bus/arm-ccn.c                         | 1 +
 2 files changed, 2 insertions(+)

-- 
1.9.1
