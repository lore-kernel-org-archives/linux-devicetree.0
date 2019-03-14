From: Akash Gajjar <akash@openedev.com>
Subject: [PATCH 0/2] add gpu node support on rock960 and rockpi4
Date: Thu, 14 Mar 2019 12:48:40 +0530
Message-ID: <20190314071853.32176-1-akash@openedev.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, =?UTF-8?q?Andrius=20=C5=A0tikonas?= <andrius@stikonas.eu>, devicetree@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>, linux-kernel@vger.kernel.org, Vicente Bergas <vicencb@gmail.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Klaus Goger <klaus.goger@theobroma-systems.com>, Akash Gajjar <akash@openedev.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

add gpu node support on both rockchip-rk3399 board.
performance tested with freedesktop.org panfrost mali driver.

Akash Gajjar (2):
  arm64: dts: rockchip: add mali gpu support on rockpi4
  arm64: dts: rockchip: add mali gpu support on rock960

 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dts | 5 +++++
 arch/arm64/boot/dts/rockchip/rk3399-rock960.dts   | 5 +++++
 2 files changed, 10 insertions(+)

-- 
2.17.1
