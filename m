From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 0/3] ARM: kernel: cpu_logical_map misc fixes
Date: Thu, 16 May 2013 16:34:04 +0100
Message-ID: <1368718447-19209-1-git-send-email-lorenzo.pieralisi@arm.com>
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
To: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Russell, Rob,

this series contains simple fixes/improvements related to the DT
cpu_logical_map initialization code. I would like to get these patches
in in order to have a stable base on top of which I can send the DT topology
bindings and cpu_logical_map bindings/parsing code updates for arm and arm64.

Thank you very much,
Lorenzo

Lorenzo Pieralisi (3):
  ARM: DT: kernel: move temporary cpu map stack array to static data
  ARM: kernel: fix arm_dt_init_cpu_maps() to skip non-cpu nodes
  ARM: kernel: fix __cpu_logical_map default initialization

 arch/arm/include/asm/cputype.h  |  2 ++
 arch/arm/include/asm/smp_plat.h |  2 +-
 arch/arm/kernel/devtree.c       | 14 ++++++++++----
 arch/arm/kernel/setup.c         |  2 +-
 4 files changed, 14 insertions(+), 6 deletions(-)

-- 
1.8.2.2
