From: Jason Cooper <jason@lakedaemon.net>
Subject: [PATCH 0/2 v5] arm: kirkwood: add dreamplug/devicetree support
Date: Thu, 23 Feb 2012 19:52:16 +0000
Message-ID: <cover.1330025976.git.jason@lakedaemon.net>
References: <cover.1312906908.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1312906908.git.jason@lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arnd@arndb.de, grant.likely@secretlab.ca
Cc: devicetree-discuss@lists.ozlabs.org, Jason Cooper <jason@lakedaemon.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch series provides initial support for devicetree on kirkwood for the
dreamplug platform.  After discussing the approach with Arnd Bergman last week
at ELC, we decided to take an incremental approach to the conversion.  First, I
would detect that we were on the dreamplug via the devicetree blob.  Then,
configure uart0 via devicetree.  We chose the uart since it is already well
supported under devicetree.

This patch series has been boot-tested on the dreamplug.

In a future patch series, I plan to migrate spi/flash/partitions over to
devicetree.

When the migration is complete, board-dt.c will not be specific to the
dreamplug, and dts files can be written for all of the other kirkwood boards.

Jason Cooper (2):
  arm: kirkwood: add dreamplug (fdt) support.
  arm: kirkwood: convert uart0 to devicetree.

 arch/arm/boot/dts/kirkwood-dreamplug.dts |   25 ++++
 arch/arm/boot/dts/kirkwood.dtsi          |    6 +
 arch/arm/mach-kirkwood/Kconfig           |   14 +++
 arch/arm/mach-kirkwood/Makefile          |    1 +
 arch/arm/mach-kirkwood/Makefile.boot     |    2 +
 arch/arm/mach-kirkwood/board-dt.c        |  180 ++++++++++++++++++++++++++++++
 6 files changed, 228 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/boot/dts/kirkwood-dreamplug.dts
 create mode 100644 arch/arm/boot/dts/kirkwood.dtsi
 create mode 100644 arch/arm/mach-kirkwood/board-dt.c

-- 
1.7.3.4
