From: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 0/4] switch DT creation to using of_attach_node (v2)
Date: Thu, 17 Mar 2011 17:32:32 -0700
Message-ID: <1300408356-15253-1-git-send-email-dilinger@queued.net>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is attempt #2 to make OF core use of_attach_node for both promtree
and flattree building.  This reworks of_attach_node quite a bit to conform
with our expectations of how the DT should look in memory.

It's different in many ways from the original patches, so it's worth
reviewing each in their entirety.


Andres Salomon (4):
      of: rework of_attach_node, removing CONFIG_OF_DYNAMIC
      of/promtree: switch to building the DT using of_attach_node
      of/flattree: minor cleanups
      of/flattree: use of_attach_node to build tree

----
 b/drivers/of/Kconfig |    4 ----
 b/drivers/of/base.c  |   47 ++++++++++++++++++++++++++++++++---------------
 b/drivers/of/fdt.c   |    6 ++++--
 b/drivers/of/pdt.c   |   30 ++++++------------------------
 b/include/linux/of.h |    5 ++---
 drivers/of/fdt.c     |   35 ++++++++++++++---------------------
 include/linux/of.h   |    1 -
 7 files changed, 58 insertions(+), 70 deletions(-)
