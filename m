From: "David Summers" <beagleboard@davidjohnsummers.uk>
Subject: [PATCH] Device Tree for ASUS Tinker Board S (v2)
Date: Sun, 16 Sep 2018 19:16:33 +0100
Message-ID: <20180916181636.7938-1-beagleboard@davidjohnsummers.uk>
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
To: heiko@sntech.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Thanks to Heiko for comments on the first

The tinkerboard S is an ASUS device, it is similar to the tinker board
but with an eMMC chip, which needs enabling in the device tree.

This patch is split into 3 parts
1) It creates a common include file rk3288-tinker.dtsi and sets up
rk3288-tinker.dts and rk3288-tinker-s.dts to do device trees for the two boards
2) It patches the rk3288-tinker-s.dts to enable eMMC
3) It patches the rk3299-tinker-s.dts to enable WiFi and Bluetooth

I'm not sure if the wifi should be common for both boards (so in the dtsi)
But am sure its needed to enable wifi on the S variant.

I have asked for the dtb to be tested - but sending these patches anyway
to get comments back.

Regards

David Summers
signed-off: "David Summers" <beagleboard@davidjohnsummers.uk>
