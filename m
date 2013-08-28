From: alison_chaiken@mentor.com
Subject: [PATCH 0/2]
Date: Tue, 27 Aug 2013 20:17:33 -0700
Message-ID: <1377659855-9573-1-git-send-email-alison_chaiken@mentor.com>
References: <521C40D9.3070802@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <521C40D9.3070802@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linus.walleij@linaro.org
Cc: devicetree@vger.kernel.org, alison@she-devel.com, rob.herring@calxeda.com, b32955@freescale.com, olof@lixom.net, alison_chaiken@mentor.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Alison Chaiken <alison_chaiken@mentor.com>

Tested on a variety of i.MX6 reference boards with older kernels.    Newly added
pinctrl configuration settings that are not tested are not modified.

Changes since v1:
 * Now rebased on linux-next.

Alison Chaiken (2):
  ARM: i.MX6: dts: change iomuxc pinctrl config to match Rev. 1 IMX6DQRM
  i.MX6: Documentation: Change fsl,imx-pinctrl.txt to match i.MX6 TRM

 .../bindings/pinctrl/fsl,imx-pinctrl.txt           |  25 +-
 arch/arm/boot/dts/imx6qdl.dtsi                     | 354 ++++++++++-----------
 arch/arm/boot/dts/imx6sl.dtsi                      |  48 +--
 3 files changed, 214 insertions(+), 213 deletions(-)

-- 
1.8.4
