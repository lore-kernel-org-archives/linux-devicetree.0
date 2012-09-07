From: Jamie Lentin <jm@lentin.co.uk>
Subject: [PATCH 0/2] hwmon: kirkwood: Add DT bindings to gpio-fan for
 DNS-32[05]
Date: Fri,  7 Sep 2012 17:34:33 +0100
Message-ID: <1347035675-23907-1-git-send-email-jm@lentin.co.uk>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Jean Delvare <khali@linux-fr.org>, Guenter Roeck <linux@roeck-us.net>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>
Cc: devicetree-discuss@lists.ozlabs.org, Jamie Lentin <jm@lentin.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is an attempt at getting DT support into gpio-fan, in a similar
fashion to gpio-leds and gpio-keys. I guess the most contentious bit is
going to be the bindings.

Tested on a D-Link DNS-320.

Feedback appreciated!

Jamie Lentin (2):
  hwmon: Add devicetree bindings to gpio-fan
  ARM: kirkwood: Use devicetree to define DNS-32[05] fan

 .../devicetree/bindings/gpio/gpio-fan.txt          |   25 +++++
 arch/arm/boot/dts/kirkwood-dnskw.dtsi              |   10 ++
 arch/arm/mach-kirkwood/board-dnskw.c               |   25 -----
 drivers/hwmon/gpio-fan.c                           |  111 ++++++++++++++++++++
 4 files changed, 146 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-fan.txt

-- 
1.7.10.4
