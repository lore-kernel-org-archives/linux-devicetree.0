From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 0/2] ARM: vexpress: DT enablement
Date: Wed, 13 Apr 2011 19:02:19 +0100
Message-ID: <1302717741-18753-1-git-send-email-lorenzo.pieralisi@arm.com>
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
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset enables basic Versatile Express DT support in the Linaro kernel.

It applies to:

git://git.linaro.org/kernel/linux-linaro-2.6.38.git master

	commit 7c4bc9c2662c6d9840afed0e29eb01314af9bb78

It defines the required match table and adds a simple dts file where the memory 
node by default declares the full 1GB memory space.

Tested on a Versatile Express board with u-boot compiled with DT support.

Lorenzo Pieralisi (2):
  ARM: vexpress: add basic DT platform matching support
  ARM: vexpress: add basic dts DT source

 arch/arm/boot/dts/vexpress.dts |   18 ++++++++++++++++++
 arch/arm/mach-vexpress/v2m.c   |    6 ++++++
 2 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/boot/dts/vexpress.dts

-- 
1.7.4.4
