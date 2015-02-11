From: Hongzhou Yang <hongzhou.yang@mediatek.com>
Subject: Re: [PATCH v5 3/5] ARM: mediatek: Add Pinctrl/GPIO driver for mt8135.
Date: Wed, 11 Feb 2015 12:18:25 -0800
Message-ID: <1423685905.22987.0.camel@mussux00.eus.mediatek.inc>
References: <1421818097-9281-1-git-send-email-hongzhou.yang@mediatek.com>
 <1421818097-9281-4-git-send-email-hongzhou.yang@mediatek.com>
 <CACRpkdasVPUtn=-DhJ4OUXGZh36sLKwLhvm-nD-mkZjP7gQXww@mail.gmail.com>
 <1423644176.1967.12.camel@mussux00.eus.mediatek.inc>
 <CACRpkdYsxcF_VdX7VDvaGcashPj=A518aKE8eKxhcUmuOKejLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdYsxcF_VdX7VDvaGcashPj=A518aKE8eKxhcUmuOKejLQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, maoguang.meng@mediatek.com, Catalin Marinas <catalin.marinas@arm.com>, alan.cheng@mediatek.com, Russell King <linux@arm.linux.org.uk>, toby.liu@mediatek.com, Grant Likely <grant.likely@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrsoft.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, dandan.he@mediatek.com, huang eddie <eddie.huang@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar
List-Id: devicetree@vger.kernel.org

On Wed, 2015-02-11 at 22:45 +0800, Linus Walleij wrote:
> On Wed, Feb 11, 2015 at 4:42 PM, Hongzhou Yang
> <hongzhou.yang@mediatek.com> wrote:
> 
> > Due to pinconf relate API changed at kernel-3.20, a build error
> > happened.
> > Do I need to send patch v6?
> 
> I discussed with your colleagues and I think it's simplest just to make
> a small fix patch on top of what is found on the mtk-staging branch
> and I'll apply it there.
> 
> Yours,
> Linus Walleij

Ok, thank you.

Yours,
Hongzhou
