From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 0/2] QEMU patches to generate device tree data
Date: Sat, 03 Apr 2010 01:19:25 -0600
Message-ID: <20100403071537.27923.48206.stgit@angua>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jeremy,

Here are a couple of patches to your QEMU tree that add basic support
for creating device nodes at run time based on the data in the qemu
device model.  I'm still refining these, and the irq handling is a
bit of a hack, but I wanted to get these out to you so that you could
take a look and provide some initial feedback.

Cheers,
g.
---

Grant Likely (2):
      arm-dt: auto-populate the device tree with qdev data
      devicetree: Add 8k instead of double dtb size when reserving extra memory


 device_tree.c |    4 +-
 hw/arm_boot.c |    3 +
 hw/qdev.c     |  127 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/qdev.h     |    9 ++++
 hw/sysbus.c   |   84 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 225 insertions(+), 2 deletions(-)

-- 
Signature
