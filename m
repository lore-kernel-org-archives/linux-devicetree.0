From: Marek Belisko <marek@goldelico.com>
Subject: [PATCH v2 0/3] Add display support for gta04 device
Date: Wed, 23 Apr 2014 22:15:17 +0200
Message-ID: <1398284120-4986-1-git-send-email-marek@goldelico.com>
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
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org, bcousson@baylibre.com, tony@atomide.com, linux@arm.linux.org.uk, plagnioj@jcrosoft.com, tomi.valkeinen@ti.com, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org, hns@goldelico.com, linux-kernel@vger.kernel.org, Marek Belisko <marek@goldelico.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This 3 patches adding display support for openmoko gta04 device.
First patch add DT bindings for topolly td028 panel. Second add description for
dss + panel and third fix panel probing when panel is compiled as module.

Changes from v1:
- extend panel compatible string by 'omapdss'
- add tpo-td028 panel to dss_compat_conv_list
- add MODULE_ALIAS macro to properly probe panel when is compiled as module

Marek Belisko (3):
  omapdss: panel-tpo-td028ec1: Add DT support.
  ARM: dts: oma3-gta04: Add display support
  omapdss: panel-tpo-td028ec1: Add module alias

 .../bindings/video/toppoly,td028ttec1.txt          | 30 ++++++++
 arch/arm/boot/dts/omap3-gta04.dts                  | 86 ++++++++++++++++++++++
 arch/arm/mach-omap2/display.c                      |  1 +
 .../omap2/displays-new/panel-tpo-td028ttec1.c      | 33 ++++++++-
 4 files changed, 149 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/video/toppoly,td028ttec1.txt

-- 
1.8.3.2
