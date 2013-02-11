From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH 0/4] Various PCI-related device tree helpers
Date: Mon, 11 Feb 2013 09:22:16 +0100
Message-ID: <1360570940-17086-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

These patches add a few device tree helpers that are used are partially
shared by Thomas' Marvell PCIe controller and my Tegra PCIe controller
series. In an attempt to decrease the number of dependencies between
trees, it would be nice to get these in for 3.9. There are a few ARM
specific patches that the series depend on which have also been
submitted and will hopefully make it into 3.9 so we can use the 3.9
cycle to focus on getting the driver patches merged.

Thierry

Andrew Murray (1):
  of/pci: Provide support for parsing PCI DT ranges property

Thierry Reding (3):
  of/pci: Add of_pci_get_devfn() function
  of/pci: Add of_pci_get_bus() function
  of/pci: Add of_pci_parse_bus_range() function

 drivers/of/address.c       | 63 ++++++++++++++++++++++++++++++++++++
 drivers/of/of_pci.c        | 80 +++++++++++++++++++++++++++++++++++++++++++---
 include/linux/of_address.h |  9 ++++++
 include/linux/of_pci.h     |  3 ++
 4 files changed, 150 insertions(+), 5 deletions(-)

-- 
1.8.1.2
