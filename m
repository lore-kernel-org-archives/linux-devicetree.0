From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 0/4] Support for device-tree appended to zImage
Date: Mon, 28 Feb 2011 15:33:18 -0800
Message-ID: <20110228233153.24836.24176.stgit@riker>
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
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The following series support for device tree binary blobs (dtb) that are
appended to the compressed kernel image (zImage).

Having appended dtb data is not required to boot with a device tree. If no dtb
data is appended to zImage, the kernel will boot using prior methods.

---

John Bonesio (4):
      ARM:boot:device tree: Allow the device tree binary to be appended to zImage
      ARM:boot:device tree: Merge specific atags into the device tree
      ARM:boot:device tree: Add puthex routine for use in the boot wrapper
      ARM:boot:device tree: Allow multiple device trees to be appended to zImage


 arch/arm/Kconfig                  |    7 ++
 arch/arm/boot/compressed/Makefile |   31 +++++++-
 arch/arm/boot/compressed/atags.c  |   70 +++++++++++++++++++
 arch/arm/boot/compressed/head.S   |  136 +++++++++++++++++++++++++++++++++++--
 arch/arm/boot/compressed/misc.c   |  134 ++++++++++++++++++++++++++++++++++++
 5 files changed, 365 insertions(+), 13 deletions(-)
 create mode 100644 arch/arm/boot/compressed/atags.c

-- 
Signature
