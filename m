From: Simon Glass <sjg@chromium.org>
Subject: [PATCH 0/14] fdt: Add various device tree utilities and
	features
Date: Thu, 25 Oct 2012 19:30:57 -0700
Message-ID: <1351218671-15228-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Tom Rini <trini@ti.com>, Jerry Van Baren <vanbaren@cideas.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

This series contains a number of features related to CONFIG_OF_CONTROL,
such as:

- reading fdt values
- reading configuration from the fdt
- allowing the fdt to specify a boot command


Abhilash Kesavan (2):
  fdt: Add function to get config int from device tree
  fdt: Add function for decoding multiple gpios globally available

Che-Liang Chiou (2):
  fdt: Add fdtdec_get_uint64 to decode a 64-bit value from a property
  fdt: Load boot command from device tree

Doug Anderson (1):
  fdt: Allow device tree to specify secure booting

Gabe Black (3):
  fdt: Add function to read boolean property
  fdt: Tell the FDT library where the device tree is
  fdt: Add option to default to most compatible conf in a fit image

Sean Paul (1):
  fdt: Add polarity-aware gpio functions to fdtdec

Simon Glass (5):
  fdt: Add function to get a config string from device tree
  fdt: Add fdtdec_decode_region() to decode memory region
  fdt: Export fdtdec_find_alias_node() function
  fdt: Export fdtdec_lookup() and fix the name
  fdt: Set kernaddr if fdt indicates a kernel is present

 README             |   11 +++++
 common/cmd_bootm.c |   11 +++++
 common/image.c     |  127 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 common/main.c      |  102 +++++++++++++++++++++++++++++++++++++++++-
 include/fdtdec.h   |  121 +++++++++++++++++++++++++++++++++++++++++++++++++
 include/image.h    |    1 +
 lib/fdtdec.c       |  107 +++++++++++++++++++++++++++++++++++++++++---
 7 files changed, 472 insertions(+), 8 deletions(-)

-- 
1.7.7.3
