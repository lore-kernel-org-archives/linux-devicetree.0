From: Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v2 0/2] pinctrl: rockchip: support rk3308 SoC
Date: Mon, 14 Oct 2019 11:03:32 +0800
Message-ID: <20191014030332.18807-1-jay.xu@rock-chips.com>
References: <20191012061528.27821-1-jay.xu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191012061528.27821-1-jay.xu@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, heiko@sntech.de, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Jianqun Xu <jay.xu@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Add support for rk3308 SoC from rockchip.

Jianqun Xu (2):
  dt-bindings: pinctrl: rockchip: add rk3308 SoC support
  pinctrl: rockchip: add rk3308 SoC support

 .../bindings/pinctrl/rockchip,pinctrl.txt     |   1 +
 drivers/pinctrl/pinctrl-rockchip.c            | 379 ++++++++++++++++++
 2 files changed, 380 insertions(+)

-- 
changes since v1:
- Add type case for pull get/set
- Add Reviewed-by: Heiko Stuebner <heiko@sntech.de>


2.17.1
