From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv2 2/5] arm64: dts: allwinner: a64: Add watchdog
Date: Sun, 18 Mar 2018 07:52:37 -0500
Message-ID: <20180318031909.u5s4ttzxmta7e4sa@rob-hp-laptop>
References: <20180315162510.11669-1-harald@ccbib.org>
 <20180315162510.11669-3-harald@ccbib.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180315162510.11669-3-harald@ccbib.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Harald Geyer <harald@ccbib.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, info@olimex.com, Maxime Ripard <maxime.ripard@bootlin.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Andre Przywara <andre.przywara@arm.com>, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 15, 2018 at 04:25:07PM +0000, Harald Geyer wrote:
> Add a watchdog node for the A64, automatically enabled on all boards.
> Since the device is compatible with an existing driver, we only reserve
> a new compatible string to be used together with the fall back.
> Tested on Olimex Teres-I.
> 
> Signed-off-by: Harald Geyer <harald@ccbib.org>
> ---
> changes since v1:
>  * add and use a specific compatible string
> 
>  Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt | 6 ++++--
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi            | 7 +++++++
>  2 files changed, 11 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
