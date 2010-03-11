From: Grant Likely <grant.likely@secretlab.ca>
Subject: [PATCH 0/2] Stuff to make of_device more like platform_device
Date: Thu, 11 Mar 2010 11:12:18 -0700
Message-ID: <20100311180952.13022.82694.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: monstr@monstr.eu, benh@kernel.crashing.org, sfr@canb.auug.org.au, jeremy.kerr@canonical.com, microblaze-uclinux@itee.uq.edu.au, linuxppc-dev@ozlabs.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

These patches make it possible to use struct platform_device as a drop
in replacement for struct of_device, which is a stepping stone to
removing the duplication between the platform bus and the of bus.

g.

---

Grant Likely (2):
      arch/microblaze: Move dma_mask from of_device into pdev_archdata
      arch/powerpc: Move dma_mask from of_device into pdev_archdata


 arch/microblaze/include/asm/device.h    |    1 +
 arch/microblaze/include/asm/of_device.h |    2 +-
 arch/microblaze/kernel/of_device.c      |    2 +-
 arch/microblaze/kernel/of_platform.c    |    2 +-
 arch/powerpc/include/asm/device.h       |    1 +
 arch/powerpc/include/asm/of_device.h    |    2 +-
 arch/powerpc/kernel/of_device.c         |    2 +-
 arch/powerpc/kernel/of_platform.c       |    2 +-
 drivers/macintosh/macio_asic.c          |    4 ++--
 sound/aoa/soundbus/i2sbus/core.c        |    4 ++--
 10 files changed, 12 insertions(+), 10 deletions(-)

-- 
Signature
