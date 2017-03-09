From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/3] ARM64: dts: meson-gx: Cleanup for common nodes
Date: Thu,  9 Mar 2017 11:39:05 +0100
Message-ID: <1489055948-10656-1-git-send-email-narmstrong@baylibre.com>
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
To: carlo@caione.org, khilman@baylibre.com
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Since we know the GXBBB and GXL/GXM share more hardware, we can safely move
the remaining peripheral nodes present in the GXBB dtsi to the common GX dtsi.
The following patches are small cleanups and helps to uniform the GX common
dtsi compatible scheme.

Neil Armstrong (3):
  ARM64: dts: meson-gx: Finally move common nodes to GX dtsi
  ARM64: dts: meson-gx: empty line cleanup
  ARM64: dts: meson-gx: Prepend GX generic compatible like other nodes

 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 39 ++++++++++++++++++++------
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 43 ++++++-----------------------
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  |  8 ++++++
 3 files changed, 47 insertions(+), 43 deletions(-)

-- 
1.9.1
