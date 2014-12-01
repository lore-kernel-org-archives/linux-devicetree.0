From: Flora Fu <flora.fu@mediatek.com>
Subject: Re: [PATCH v2 8/8] ARM: dts: mt8135: Add support for MT6397 regulator
Date: Mon, 1 Dec 2014 11:19:25 +0800
Message-ID: <1417403967.9547.2.camel@mtksdaap41>
References: <1417146874-5232-1-git-send-email-flora.fu@mediatek.com>
 <1417146874-5232-9-git-send-email-flora.fu@mediatek.com>
 <20141128153008.GS7712@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20141128153008.GS7712@sirena.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Russell King <linux@arm.linux.org.uk>, Samuel Ortiz <sameo@linux.intel.com>, Sandeep Nair <sandeep_n@ti.com>, Grant Likely <grant.likely@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, Vladimir Murzin <vladimir.murzin@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Warren <swarren@nvidia.com>, Eddie Huang <eddie.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org, Dongdong Cheng <dongdong.cheng@mediatek.com>, srv_heupstream@mediatek.comPeter De Schrijver <p>
List-Id: devicetree@vger.kernel.org

Hi, Mark, 

On Fri, 2014-11-28 at 15:30 +0000, Mark Brown wrote: 
> On Fri, Nov 28, 2014 at 11:54:34AM +0800, Flora Fu wrote:
> 
> > Add device tree for MT6397 regulators in mt8135.dtsi.
> > 
> > Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> > ---
> >  arch/arm/boot/dts/mt8135.dtsi | 192 ++++++++++++++++++++++++++++++++++++++++++
> 
> This appears to be the DT fragment for a SoC but you are defining the
> system integration for the PMIC.  That's bad, the PMIC is a separate
> device so should be hooked up by the board using it.  If there's common
> elements from a reference design they should be in their own .dtsi.
> 

Do you mean that we should add a mt6397.dtsi and include it from
mt8135.dtsi? For board specific, update them in mt8135.dtsi? 

Thanks,
Flora
