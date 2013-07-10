From: Bo Shen <voice.shen@atmel.com>
Subject: [PATCH 0/3] arm: atmel: at91sam9n12: add i2c pinctrl and qt1070
 support
Date: Wed, 10 Jul 2013 17:51:06 +0800
Message-ID: <1373449869-5083-1-git-send-email-voice.shen@atmel.com>
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
To: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: Bo Shen <voice.shen@atmel.com>, devicetree-discuss@lists.ozlabs.org, ludovic.desroches@atmel.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

this patch is based on linux master branch, implementation as following:
  - add the i2c pinctrl which needed for using at91sam9n12 TWI
  - enable qt1070
  - trivial fix for the gpio-key pin number


Bo Shen (3):
  arm: atmel: at91sam9n12: add pinctrl of TWI
  arm: atmel: at91sam9n12: add qt1070 support
  arm: atmel: at91sam9n12: correct pin number of gpio-key

 arch/arm/boot/dts/at91sam9n12.dtsi  |   20 ++++++++++++++++++++
 arch/arm/boot/dts/at91sam9n12ek.dts |   18 +++++++++++++++++-
 2 files changed, 37 insertions(+), 1 deletion(-)

-- 
1.7.9.5
