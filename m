From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: [PATCH 0/2 v6] arm: kirkwood: add dreamplug/devicetree support
Date: Mon, 27 Feb 2012 16:07:12 +0000
Message-ID: <cover.1330358323.git.jason@lakedaemon.net>
References: <cover.1312906908.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <cover.1312906908.git.jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
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
