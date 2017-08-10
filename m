From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 0/3] Add DSP DT nodes on Keystone 66AK2G platforms
Date: Thu, 10 Aug 2017 18:52:42 -0500
Message-ID: <20170810235245.30316-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Santosh Shilimkar <ssantosh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>, linux-arm-kernel@lists.infradead.org, Sam Nelson <sam.nelson@ti.com>
List-Id: devicetree@vger.kernel.org

Hi Santosh,

The following series adds the DT nodes for the DSP device present
on the Keystone2 66AK2G SoC and enables them on the currently
supported platforms.

The DTS nodes for the other Keystone2 family of SoCs were posted
previously [1] and already in your staging branches for 4.14.
This series adds the equivalent patches for 66AK2G SoCs. K2G uses
slightly different properties compared to other K2 SoCs. The
binding update for K2G is in-flight [2] and already acked by Rob.
So, I am not sure if you need to wait for that patch to show up
on mainline to avoid checkpatch warnings on these patches due to
the undocumented compatible on your tree.

Validation done on K2G EVM and K2G ICE boards using ramdisk boot.
Supported features are the same as the other Keystone 2 platforms.
Patches are based on your current -next branch [3], so should apply
fine on your 4.14 keystone_dts branch.

regards
Suman

[1] http://marc.info/?l=linux-kernel&m=150128405901497&w=2
[2] https://patchwork.kernel.org/patch/9873085/
[3] https://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git/log/?h=next

Andrew F. Davis (1):
  ARM: dts: keystone-k2g-evm: Add and enable DSP CMA memory pool

Suman Anna (2):
  ARM: dts: keystone-k2g: Add DSP node
  ARM: dts: keystone-k2g-ice: Add and enable DSP CMA memory pool

 arch/arm/boot/dts/keystone-k2g-evm.dts | 18 ++++++++++++++++++
 arch/arm/boot/dts/keystone-k2g-ice.dts | 18 ++++++++++++++++++
 arch/arm/boot/dts/keystone-k2g.dtsi    | 17 +++++++++++++++++
 3 files changed, 53 insertions(+)

-- 
2.13.1
