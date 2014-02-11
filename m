From: Valentin Longchamp <valentin.longchamp@keymile.com>
Subject: [PATCH v2 0/2] Support of the kmcoge4 board
Date: Tue, 11 Feb 2014 12:50:05 +0100
Message-ID: <1392119407-29490-1-git-send-email-valentin.longchamp@keymile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Scott Wood <scottwood@freescale.com>, linuxppc-dev@lists.ozlabs.org
Cc: Valentin Longchamp <valentin.longchamp@keymile.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series adds support for Keymile's COGE4 board, called kmcoge4. This
board is the reference design for further designs at Keymile around the
P2040/P2041 SoCs from Freescale. This reference design is internally
called kmp204x.

Changes in v2:
- add a patch so that the Zarlink vendor prefix is defined
- add some nodes on the localbus CS when possible
- only use the corenet_generic machine and add kmcoge4 to the supported
  boards instead of defining a new kmp204x machine
- set better and more precise device nodes for the spi devices
- remove the partion layout for the spi_flash@0

Valentin Longchamp (2):
  devicetree: bindings: add Zarlink to the vendor prefixes
  powerpc/mpc85xx: add support for Keymile's kmcoge4 board

 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/powerpc/boot/dts/kmcoge4.dts                  | 161 +++++++++++++++
 arch/powerpc/configs/85xx/kmp204x_defconfig        | 227 +++++++++++++++++++++
 arch/powerpc/platforms/85xx/Kconfig                |   2 +-
 arch/powerpc/platforms/85xx/corenet_generic.c      |   3 +-
 5 files changed, 392 insertions(+), 2 deletions(-)
 create mode 100644 arch/powerpc/boot/dts/kmcoge4.dts
 create mode 100644 arch/powerpc/configs/85xx/kmp204x_defconfig

-- 
1.8.0.1
