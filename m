From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Device Tree nodes ending with -supply
Date: Mon, 20 May 2019 17:51:27 +0200
Message-ID: <20190520155127.cdc6dofoqckwsrrb@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

I've noticed that you recently added support to validate the *-supply
properties in the dt-schema tools.

However, we have a family of PMIC that are exposing a bunch of power
supplies (battery, AC, USB, etc) to know what is currently powering
the board.

All these various supplies are exposed as children nodes of the PMIC
itself, and they are named *-power-supply. For an example, you can
look at:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/axp209.dtsi#n56

Now, those are obviously not properties, and yet the current dt-schema
schemas are trying to validate them.

I'm not really sure how to fix that. Changing the node names seems
like an obvious solution, but they seem to be what they should be. Can
we reduce the scope of the validation to only match properties (ie
arrays?) and not the nodes (objects?)

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
