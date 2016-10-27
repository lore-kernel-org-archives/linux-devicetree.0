From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v5 0/7] Add R8A7743/SK-RZG1M board support
Date: Fri, 28 Oct 2016 00:33:26 +0300
Message-ID: <1580369.yToZzJza1l@wasted.cogentembedded.com>
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
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: linux@arm.linux.org.uk, magnus.damm@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 7 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20161024-v4.9-rc2' tag. I'm adding the device tree support for
the R8A7743-based SK-RZG1M board. The SoC is close to R8A7791 and the board
seems identical to the R8A7791/Porter board. The device tree patches depend on
the R8A7743 CPG/MSSR driver series just re-posted in order to compile and work.
Already merged patches from this series won't be re-posted.

[1/7] ARM: dts: r8a7743: initial SoC device tree
[2/7] ARM: dts: r8a7743: add SYS-DMAC support
[3/7] ARM: dts: r8a7743: add [H]SCIF{A|B} support
[4/7] ARM: dts: r8a7743: add Ether support
[5/7] ARM: dts: r8a7743: add IRQC support
[6/7] ARM: dts: sk-rzg1m: initial device tree
[7/7] ARM: dts: sk-rzg1m: add Ether support

WBR, Sergei
