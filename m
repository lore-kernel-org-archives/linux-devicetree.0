From: Akash Gajjar <Akash_Gajjar@mentor.com>
Subject: [PATCH 0/4] arm64: dts: rockchip: rk3399-rockpro64 dts cleanup
Date: Wed, 13 Feb 2019 22:36:36 +0530
Message-ID: <20190213170651.3210-1-Akash_Gajjar@mentor.com>
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
To: heiko@sntech.de
Cc: Mark Rutland <mark.rutland@arm.com>, Shohei Maruyama <cheat.sc.linux@outlook.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Klaus Goger <klaus.goger@theobroma-systems.com>, Oskari Lemmela <oskari@lemmela.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

this patchset adds below various changes
- rename regulators name according to rockpro64 schematic.
- remove unused pinmux and regulator node
- rename LED name and set heartbeat default-trigger.
- add usb regulator.

schematic is available here:
http://files.pine64.org/doc/rockpro64/rockpro64_v21-SCH.pdf

Akash Gajjar (4):
  arm64: dts: rockchip: rockpro64 dts make regulator more readable
  arm64: dts: rockchip: rockpro64 dts remove unused node
  arm64: dts: rockchip: rockpro64 dts rename LED labels and default
    trigger
  arm64: dts: rockchip: rockpro64 dts add usb regulator

 .../boot/dts/rockchip/rk3399-rockpro64.dts    | 93 +++++++++----------
 1 file changed, 43 insertions(+), 50 deletions(-)

-- 
2.17.1
