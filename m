From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 0/2] gpio: brcm: XGS iProc GPIO driver
Date: Fri,  4 Oct 2019 14:25:23 +1300
Message-ID: <20191004012525.26647-1-chris.packham@alliedtelesis.co.nz>
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
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com, richard.laing@alliedtelesis.co.nz
Cc: linux-gpio@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is ported this from Broadcom's XLDK. There seem to be 3 different
IP blocks for 3 separate banks of GPIOs in the iProc chips.

I've dropped everything except support for the Chip Common A GPIO
controller because the other blocks actually seem to be supportable with
other drivers. The driver itself is halfway between pinctrl-nsp-gpio.c
and pinctrl-iproc-gpio.c.

Chris Packham (2):
  dt-bindings: gpio: brcm: Add bindings for xgs-iproc
  gpio: Add xgs-iproc driver

 .../bindings/gpio/brcm,xgs-iproc.txt          |  41 ++
 drivers/gpio/Kconfig                          |   9 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-xgs-iproc.c                 | 422 ++++++++++++++++++
 4 files changed, 473 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/brcm,xgs-iproc.txt
 create mode 100644 drivers/gpio/gpio-xgs-iproc.c

-- 
2.23.0
