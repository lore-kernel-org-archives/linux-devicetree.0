From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC PATCH 0/7] QEMU patches to generate FDT from qdevs
Date: Tue, 06 Apr 2010 22:09:57 -0600
Message-ID: <20100407040129.20274.44284.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi everyone,

This is an experimental set of patches for populating the flattened
device tree (fdt) data from the actual set of qdevs in the platform.
I'm not expecting this to get merged anytime soon, but I wanted to get
it out there to solicit comments.  My target for this is testing
device tree support on ARM.

The approach is by no means final, and there are still a number of
details to work out, but I've got it working well with the versatile
platform and I've got the kernel using fdt data to bind against the
smc91x device driver.  I'll be posting my associated kernel patches
real-soon-now.

This series is based on Jeremy Kerr's device tree branch found here:

git://kernel.ubuntu.com/jk/dt/qemu.git

Cheers,
g.

---

Grant Likely (7):
      devicetree: Add fdt_populate hook to smc91x device
      devicetree: Add fdt_populate hook to pl011 device
      devicetree: Add helper to register devices with an fdt_populate hook
      devicetree: Add sysbus fdt populate hooks.
      devicetree: add helper for determining IRQ properties in the device tree
      devicetree: auto-populate the device tree with qdev data
      devicetree: Add 8k instead of double dtb size when reserving extra memory


 device_tree.c  |    4 +-
 hw/arm_boot.c  |    3 +
 hw/pl011.c     |   29 ++++++++++--
 hw/qdev.c      |  139 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/qdev.h      |    9 ++++
 hw/smc91c111.c |   20 ++++++++
 hw/sysbus.c    |  107 +++++++++++++++++++++++++++++++++++++++++++
 hw/sysbus.h    |    4 ++
 8 files changed, 309 insertions(+), 6 deletions(-)

-- 
Signature
