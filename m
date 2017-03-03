From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Subject: [PATCH 0/3] ARC: get frequency via clock driver instead of reading
 device tree
Date: Fri,  3 Mar 2017 14:29:59 +0300
Message-ID: <1488540602-11438-1-git-send-email-vzakhar@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: linux-snps-arc@lists.infradead.org
Cc: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>, devicetree@vger.kernel.org, Vineet Gupta <vgupta@synopys.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

This patch series replaces reading device tree with getting CPU
clock frequency via clock driver in show_cpuinfo function.

In order to achieve this we also add cpu nodes to device tree which
describes SMP system and add "clocks" properties to all ARC cpu nodes. 

Vlad Zakharov (3):
  ARC: [dts] add input clocks for cpu nodes
  ARC: [dts] add cpu nodes to ARCHS SMP device tree
  arc: get rate from clk driver instead of reading device tree

 arch/arc/boot/dts/skeleton.dtsi        |  1 +
 arch/arc/boot/dts/skeleton_hs.dtsi     |  1 +
 arch/arc/boot/dts/skeleton_hs_idu.dtsi | 21 ++++++++++++++++++++-
 arch/arc/kernel/setup.c                | 17 +++++++++++++----
 4 files changed, 35 insertions(+), 5 deletions(-)

-- 
2.7.4
