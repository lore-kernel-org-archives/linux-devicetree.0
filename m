From: Bernd Edlinger <bernd.edlinger@hotmail.de>
Subject: [PATCHv5 0/2] GPIO driver and bindings for Altera FPGA Manager I/O
Date: Thu, 26 Oct 2017 15:28:05 +0000
Message-ID: <AM5PR0701MB265718BE81AA70B8F1F1F99FE4450@AM5PR0701MB2657.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Language: de-DE
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Christian Lamparter <chunkeey@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

Part 1 (bindings) is unchanged.

Part 2 (driver) addresses review comments.
- use BGPIOF_NO_OUTPUT for input port


Bernd Edlinger (2):
  Add device tree bindings for Altera FPGA Manager GPIO
  Add a GPIO driver for Altera FPGA Manager Fabric I/O

 .../bindings/gpio/gpio-altera-fpgamgr.txt          |  43 ++++
 drivers/gpio/Kconfig                               |   6 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-altera-fpgamgr.c                 | 219 +++++++++++++++++++++
 4 files changed, 269 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-altera-fpgamgr.txt
 create mode 100644 drivers/gpio/gpio-altera-fpgamgr.c

-- 
1.9.1
