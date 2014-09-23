From: Joe.C <srv_yingjoe.chen@mediatek.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: mt8135: Add pinctrl node for mt8135.
Date: Tue, 23 Sep 2014 22:29:46 +0800
Message-ID: <1411482586.21299.26.camel@mtksdaap41>
References: <1411443545-24951-1-git-send-email-srv_hongzhou.yang@mediatek.com>
 <2770365.r419rjIAOU@wuerfel> <1411480694.21299.18.camel@mtksdaap41>
 <7840459.vtELiqVIOL@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <7840459.vtELiqVIOL@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "Hongzhou. Yang" <srv_hongzhou.yang@mediatek.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Russell King <linux@arm.linux.org.uk>, srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>Hongzhou Yang <hongzhou.yang@mediatek.com>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, dandan.he@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 2014-09-23 at 16:10 +0200, Arnd Bergmann wrote:
> On Tuesday 23 September 2014 21:58:14 Joe. C wrote:
> > Thanks for review. 
> > The intend for these macros is helpin pinctrl user to write DT node.
> > With these macro, we could write like this for i2c0:
> > 
> > mediatek,pinfunc = <MT8135_PIN_100_SDA0__FUNC_SDA0 
> >                         MT8135_PIN_101_SCL0__FUNC_SCL0>;
> > 
> > We feel this is less error prone and easier to write than this:
> > 
> > mediatek,pinfunc = <MT_PIN_FUNC(100, 1) MT_PIN_FUNC(101, 1)>
> 
> But you don't actually use the same macros in the driver, so in effect
> you just move the definitions from the file they are needed in to another
> file as a macro.
> 
> It is no less error prone to define those macros in mt8135-pinfunc.h
> than in the pinctrl node, just less readable.
> 
> 	Arnd

Yes, mt8135-pinfunc.h must be in sync with pinctrl-mtk-mt8135.h in patch
2/4, otherwise it is a bug. We use script to generate macros to make
sure they are in sync.

Joe.C
