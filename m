From: Y Vo <yvo@apm.com>
Subject: [PATCH v1 0/3] gpio: Add APM X-Gene standy platform GPIO driver
Date: Wed,  8 Oct 2014 21:52:25 +0700
Message-ID: <1412779948-28769-1-git-send-email-yvo@apm.com>
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
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Tin Huynh <tnhuynh@apm.com>, patches@apm.com, Toan Le <toanle@apm.com>, Y Vo <yvo@apm.com>, Phong Vo <pvo@apm.com>
List-Id: devicetree@vger.kernel.org

This patch add the GPIO standby controller in the APM X-Gene platform.

Y Vo (3):
  gpio: Add APM X-Gene standby GPIO controller driver
  Documentation: gpio: Add APM X-Gene standby GPIO controller DTS
    binding
  arm64:dts: Add APM X-Gene standby GPIO controller DTS entries

 .../devicetree/bindings/gpio/gpio-xgene-sb.txt     |   31 +++
 arch/arm64/boot/dts/apm-storm.dtsi                 |   13 ++
 drivers/gpio/Kconfig                               |    7 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-xgene-sb.c                       |  232 ++++++++++++++++++++
 5 files changed, 284 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt
 create mode 100755 drivers/gpio/gpio-xgene-sb.c

-- 
1.7.9.5

CONFIDENTIALITY NOTICE: This e-mail message, including any attachments, 
is for the sole use of the intended recipient(s) and contains information
that is confidential and proprietary to Applied Micro Circuits Corporation or its subsidiaries. 
It is to be used solely for the purpose of furthering the parties' business relationship. 
All unauthorized review, use, disclosure or distribution is prohibited. 
If you are not the intended recipient, please contact the sender by reply e-mail 
and destroy all copies of the original message.
