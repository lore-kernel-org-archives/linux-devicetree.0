From: Jamie Lentin <jm@lentin.co.uk>
Subject: [PATCH 0/4] Use DT to define more of the DNS320 & DNS325
Date: Thu, 19 Jul 2012 21:30:56 +0100
Message-ID: <1342729860-14647-1-git-send-email-jm@lentin.co.uk>
References: <y>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <y>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>, Jason <jason@lakedaemon.net>
Cc: devicetree-discuss@lists.ozlabs.org, Jamie Lentin <jm@lentin.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Thanks to sterling work by Andrew Lunn, more code has been turned into
devicetree bindings. The following takes what he's done, moves common
parts into a DT include file, adds LED and key bindings for both the 
DNS320 and DNS325. It has been tested on both devices.

This patchset replaces the DNS32? work in his patchset:-

git://github.com/lunn/linux.git v3.5-rc7-for-next-v3

I've not modified Andrew's DNS325 temperature sensor patch but 
included it in the patchset to make it more obvious I've tested it.

Thanks!

Andrew Lunn (1):
  ARM: Kirkwood: Describe DNS325 temperature sensor in DT.

Jamie Lentin (3):
  kirkwood: Replace DNS-320/DNS-325 leds with dt bindings
  ARM: Kirkwood: Move common portions into a kirkwood-dnskw.dtsi
  ARM: Kirkwood: Describe DNS32? gpio-keys in DT.

 arch/arm/boot/dts/kirkwood-dns320.dts |   67 +++++++---------
 arch/arm/boot/dts/kirkwood-dns325.dts |   71 ++++++++---------
 arch/arm/boot/dts/kirkwood-dnskw.dtsi |   69 +++++++++++++++++
 arch/arm/mach-kirkwood/board-dnskw.c  |  138 ---------------------------------
 4 files changed, 127 insertions(+), 218 deletions(-)
 create mode 100644 arch/arm/boot/dts/kirkwood-dnskw.dtsi

-- 
1.7.10.4
