From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/3] Add fdt_unflatten_tree
Date: Wed, 17 Nov 2010 11:15:42 -0800
Message-ID: <5ca1cf50-4bc4-45ce-87d2-c499d981449b@VA3EHSMHS008.ehs.local>
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
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

	Currently, fdt blobs are handled solely at boot time.  However,
it may be useful to parse blobs into device trees after boot time.  For
instance, a PCIe device may have an FPGA which includes a device
tree.  This set of patches locally refactors the existing code to enable
this.   The code has been compile-tested on X86 but has not been run in this
version.  However, the patch is rather straightforward.

Stephen Neuendorffer (3):
  fdt.c: Add non-boottime device tree functions
  fdt.c: Refactor unflatten_dt_node
  fdt.c: Refactor unflatten_device_tree and add fdt_unflatten_tree

 drivers/of/fdt.c       |  393 +++++++++++++++++++++++++++++-------------------
 include/linux/of_fdt.h |   11 ++
 2 files changed, 251 insertions(+), 153 deletions(-)



This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
