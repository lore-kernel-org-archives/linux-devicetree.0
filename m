From: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 0/7] arm64: dts: meson: ir keymap updates
Date: Sun, 25 Aug 2019 08:01:21 +0400
Message-ID: <1566705688-18442-1-git-send-email-christianshewitt@gmail.com>
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
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Chrisitian Hewitt <christianshewitt@gmail.com>
List-Id: devicetree@vger.kernel.org

This series adds keymaps for several box/board vendor IR remote devices
to respective device-tree files. The keymaps were submitted in [0] and
have been queued for inclusion in Linux 5.4.

The Khadas remote change swaps the rc-geekbox keymap for rc-khadas. The
Geekbox branded remote was only sold for a brief period when VIM(1) was
a new device. The Khadas branded remote that replaced it exchanged the
Geekbox full-screen key for an Android mouse button using a different IR
keycode. The rc-khadas keymap supports the mouse button keycode and maps
it to KEY_MUTE.

[0] https://patchwork.kernel.org/project/linux-media/list/?series=160309

Christian Hewitt (7):
  arm64: dts: meson-g12b-odroid-n2: add rc-odroid keymap
  arm64: dts: meson-g12a-x96-max: add rc-x96max keymap
  arm64: dts: meson-gxbb-wetek-hub: add rc-wetek-hub keymap
  arm64: dts: meson-gxbb-wetek-play2: add rc-wetek-play2 keymap
  arm64: dts: meson-gxl-s905x-khadas-vim: use rc-khadas keymap
  arm64: dts: meson-gxl-s905w-tx3-mini: add rc-tx3mini keymap
  arm64: dts: meson-gxm-khadas-vim2: use rc-khadas keymap

 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts         | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts       | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts       | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts     | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dts   | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts      | 2 +-
 7 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.7.4
