From: Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
Subject: [PATCH 0/4 v2] Merge OF dynamic patches
Date: Fri, 20 Nov 2009 09:01:07 -0600
Message-ID: <4B06AF33.1000400@austin.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This set of patches merges the common dynamic device tree
updating routines of_attach_node() and of_detach_node() to
drivers/of/of_dynamic.c.

Built and tested on powerpc, I have no access to build/test
this on microblaze.

-Nathan Fontenot
---

1/4 - Merge of_attach_node
2/4 - Merge of_detach_node
3/4 - Makefile/Kconfig updates
4/4 - Update powerpc/pseries to include of_dynamic.h

 arch/microblaze/Kconfig                   |    1 
 arch/microblaze/include/asm/prom.h        |    4 -
 arch/microblaze/kernel/prom.c             |   59 -----------------------
 arch/powerpc/Kconfig                      |    1 
 arch/powerpc/include/asm/prom.h           |    4 -
 arch/powerpc/kernel/prom.c                |   59 -----------------------
 arch/powerpc/platforms/pseries/reconfig.c |    1 
 drivers/of/Kconfig                        |    4 +
 drivers/of/Makefile                       |    1 
 drivers/of/of_dynamic.c                   |   75 ++++++++++++++++++++++++++++++
 include/linux/of_dynamic.h                |   27 ++++++++++
 11 files changed, 110 insertions(+), 126 deletions(-)
