From: Roman Volkov <rvolkov@v1ros.org>
Subject: [PATCH v3 0/2] WM8505/WM8650 DT fixes for SD card controller
Date: Sun,  1 Mar 2015 19:06:45 +0300
Message-ID: <1425226007-2757-1-git-send-email-rvolkov@v1ros.org>
References: <1423130878-3894-1-git-send-email-v1ron@v1ros.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1423130878-3894-1-git-send-email-v1ron@v1ros.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>
Cc: devicetree@vger.kernel.org, Alexey Charkov <alchark@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Roman Volkov <rvolkov@v1ros.org>
List-Id: devicetree@vger.kernel.org

This patch set enables SD controller support for WM8650 and
fixes minor errors in WM8505 Device Tree file.

Changes in v3:
1. Add minor fixes for WM8505 SDHC node

Tested on both WM8505 and WM8650.

Roman Volkov (2):
  dts: vt8500: Add SDHC node to DTS file for WM8650
  dts: vt8500: Fix errors in SDHC node for WM8505

 arch/arm/boot/dts/wm8505.dtsi | 4 ++--
 arch/arm/boot/dts/wm8650.dtsi | 9 +++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
Hi maintainers, I see my previous versions were not applied. Could this
little patch set be applied for the linux-next? I don't think this is new
functionality, this must be considered as bugfix for existing Device Tree.

Any other suggestions?

2.3.1
