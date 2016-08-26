From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/3] Add R8A7792/Wheat board support
Date: Fri, 26 Aug 2016 23:16:49 +0300
Message-ID: <3665116.9BjHTnhfR3@wasted.cogentembedded.com>
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

   Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20160826-v4.8-rc3' tag. We add the device tree support for
the R8A7792-based Wheat board. I have only sparse board documentation
at this point, according to which this board somewhat differs from the other
R-Car evaluation boards in that it has debug serial port, debug Ethernet chip,
and a NOR flash on the separate debug board (connected to the main board
with a ribbon cable). I'm not sure how to approach this (DT overlay, perhaps?),
for now I'm just posting the debug UART/Ethernet support the same way it was
done for the Blanche board -- these components seem to be the same between 
these 2 boards...

[1/3] DT: arm: shmobile: document Wheat board
[2/3] ARM: dts: wheat: initial device tree
[3/3] ARM: dts: wheat: add Ethernet support

WBR, Sergei
