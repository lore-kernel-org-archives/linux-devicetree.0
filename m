From: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Subject: [RESEND PATCH v3 0/5] Introduce of_get_child_by_name
Date: Tue, 18 Sep 2012 08:08:10 +0100
Message-ID: <1347952090-24054-1-git-send-email-srinivas.kandagatla@st.com>
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
To: robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bergner-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, afleming-KZfg59tc24xl57MIdRCFDg@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>

This patch series introduces of_get_child_by_name function to get a 
child node by its name in a given parent node and also removes code 
duplication in some of the existing driver code by using of_get_child_by_name.

Normally if a driver want to get a child node it would iterate all the nodes
of parent and compare its name and then get it.
This use case is becoming common as device trees are used more, so moving this 
functionality to a libary function makes sense.

Having of_get_child_by_name libary function would avoid code duplication,
errors, proper reference counting and is more convenient.

Changes from v3:
	- Removed extra of_get_node from of_get_child_by_name.
	- reordered of_put_node in hvc_opal.c
Changes from v2:
	- Fixed typo errors.
	- Removed bogus patches which used "type" instead of "name" 
	- Fixed reference counting in follow-up patches.

Changes from v1:
	-rename of_get_child to of_get_child_by_name.
	-remove read lock in of_get_child_by_name.
	-make use of of_get_child_by_name in the existing kernel code.

Srinivas Kandagatla (5):
  dt: introduce of_get_child_by_name to get child node by name
  dt/powerpc/powernv: Use of_get_child_by_name to get a named child
  dt/powerpc/sysdev: Use of_get_child_by_name to get a named child
  dt/s3c64xx/spi: Use of_get_child_by_name to get a named child
  dt/tty/opal: Use of_get_child_by_name to get a named child

 arch/powerpc/platforms/powernv/opal.c |    6 +++---
 arch/powerpc/sysdev/qe_lib/qe.c       |    5 +----
 drivers/of/base.c                     |   23 +++++++++++++++++++++++
 drivers/spi/spi-s3c64xx.c             |    7 ++++---
 drivers/tty/hvc/hvc_opal.c            |    9 ++-------
 include/linux/of.h                    |    2 ++
 6 files changed, 35 insertions(+), 17 deletions(-)
