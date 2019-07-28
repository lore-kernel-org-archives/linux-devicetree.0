From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/2] ARM: dts: rockchip: Add missing unit address to
 memory node on rk3288-veyron
Date: Sun, 28 Jul 2019 13:38:43 +0200
Message-ID: <CAJKOXPcHB9969bqw+aqRh1HYHKDazhhpKy_+uKKcA=5Gkg6+EA@mail.gmail.com>
References: <20190727142736.23188-1-krzk@kernel.org>
 <20190727142736.23188-2-krzk@kernel.org> <86910491.m50tbimVMv@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <86910491.m50tbimVMv@phil>
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
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, 27 Jul 2019 at 17:33, Heiko Stuebner <heiko@sntech.de> wrote:
>
> Hi Krzysztof,
>
> Am Samstag, 27. Juli 2019, 16:27:36 CEST schrieb Krzysztof Kozlowski:
> > Fix DTC warning:
> >
> >     arch/arm/boot/dts/rk3288-veyron.dtsi:21.9-24.4:
> >     Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>
> please see the comment directly above the memory node on why that needs
> to stay that way. So no, we'll keep the veyron memory node as is.

Damn it, I missed it.

Best regards,
Krzysztof
