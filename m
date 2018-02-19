From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: add a standalone version of
 the  rk3399 sapphire
Date: Mon, 19 Feb 2018 14:42:55 -0600
Message-ID: <20180219204255.cvn2z5dw5ritjkod@rob-hp-laptop>
References: <CAAMcf8CY1m+998+GpD2wOfAZb=oZNkL2GqYu_o5piGEh76uoYw@mail.gmail.com>
 <3840224.sEPfbROKII@phil> <7102557.xWtZfjvKIZ@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <7102557.xWtZfjvKIZ@phil>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: mark.rutland@arm.com, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Vicente Bergas <vicencb@gmail.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 19, 2018 at 09:16:17AM +0100, Heiko Stuebner wrote:
> While the sapphire board is a system-on-module and mostly used with the
> excavator baseboard, it is also possible to use it standalone without
> any base. So add a board-variant for this type.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.txt |  4 ++++
>  arch/arm64/boot/dts/rockchip/Makefile              |  1 +
>  arch/arm64/boot/dts/rockchip/rk3399-sapphire.dts   | 12 ++++++++++++
>  3 files changed, 17 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-sapphire.dts

Reviewed-by: Rob Herring <robh@kernel.org>
