From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/5] Add R8A77980/Condor/V3HSK LVDS/HDMI support
Date: Thu, 7 Jun 2018 23:17:03 +0300
Message-ID: <390fabf0-4caf-1600-3780-1893207d94f7@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-MW
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello!

Here's the set of 5 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20180604-v4.17' tag. We're adding the R8A77980 FCPVD/VSPD/
DU/LVDS device nodes and then describing the LVDS decoder and HDMI encoder
connected to the LVDS output. These patches depend on the Thine THC63LVD1024
driver and the R8A77980 LVDS support patch in order to work, and R8A77980 GPIO
DT patches in order to apply/compile...

[1/5] arm64: dts: renesas: r8a77980: add FCPVD support
[2/5] arm64: dts: renesas: r8a77980: add VSPD support
[3/5] arm64: dts: renesas: r8a77980: add DU support
[4/5] arm64: dts: renesas: r8a77980: add LVDS support
[5/5] arm64: dts: renesas: condor/v3hsk: add DU/LVDS/HDMI support

WBR, Sergei
