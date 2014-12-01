From: james liao <jamesjj.liao@mediatek.com>
Subject: Re: [PATCH 2/4] clk: Add INFRA and PERI clocks for Mediatek MT8135.
Date: Mon, 1 Dec 2014 11:41:10 +0800
Message-ID: <1417405278.31427.15.camel@mtksdaap41>
References: <1417174490-6845-1-git-send-email-jamesjj.liao@mediatek.com>
 <1417174490-6845-3-git-send-email-jamesjj.liao@mediatek.com>
 <20141128120636.GD25883@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20141128120636.GD25883@leverpostej>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Ashwin Chaugule <ashwin.chaugule@linaro.org>, Vladimir Murzin <Vladimir.Murzin@arm.com>, Mike Turquette <mturquette@linaro.org>, Pawel Moll <Pawel.Moll@arm.com>, "srv_heupstream@mediatek.com" <srv_heupstream@mediatek.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <Catalin.Marinas@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, HenryC.Chen@mediatek.com, "Joe.C" <yingjoe.chen@mediatek.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, Russell King <linux@arm.linux.org.uk>, "eddie.huang@mediatek.com" <eddie.huang@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Fri, 2014-11-28 at 12:06 +0000, Mark Rutland wrote:
> On Fri, Nov 28, 2014 at 11:34:48AM +0000, James Liao wrote:
> > This patch adds clock gates support for Mediatek SoCs, and adds clocks of
> > INFRA sys and PERI sys for MT8135.
> > 
> 
> Please fold the include/dt-bindings changes into the DT documentation
> patch, and put that earlier in the series.
> 

OK, I'll send a new patchset later with the following sequence:

1. include/dt-bindings + DT documention.
2. Basic clocks (PLLs + TOPCKGEN).
3. Basic clocks (INFRA + PERI)
4. Update device tree to enable clocks.


Best regards,

James
