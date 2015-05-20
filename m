From: Hongzhou Yang <hongzhou.yang@mediatek.com>
Subject: Re: [PATCH v2 08/11] mfd: mediatek: Add GPIO sub module support
 into mfd.
Date: Tue, 19 May 2015 23:05:35 -0700
Message-ID: <1432101935.4007.1.camel@mussux00.eus.mediatek.inc>
References: <1432015882-8646-1-git-send-email-hongzhou.yang@mediatek.com>
	 <1432015882-8646-9-git-send-email-hongzhou.yang@mediatek.com>
	 <20150519093426.GS22418@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20150519093426.GS22418@x1>
Sender: linux-gpio-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Samuel Ortiz <sameo@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Fabian Frederick <fabf@skynet.be>, Maoguang Meng <maoguang.meng@mediatek.com>, Axel Lin <axel.lin@ingics.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, dandan.he@mediatek.com, eddie.huang@mediatek.co
List-Id: devicetree@vger.kernel.org

On Tue, 2015-05-19 at 10:34 +0100, Lee Jones wrote:
> On Mon, 18 May 2015, Hongzhou Yang wrote:
> 
> > Register pinctrl subnode into 6397 mfd cell.
> > 
> > Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
> > ---
> >  drivers/mfd/mt6397-core.c |    3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> > index 09bc780..012c620 100644
> > --- a/drivers/mfd/mt6397-core.c
> > +++ b/drivers/mfd/mt6397-core.c
> > @@ -34,6 +34,9 @@ static const struct mfd_cell mt6397_devs[] = {
> >  	}, {
> >  		.name = "mt6397-clk",
> >  		.of_compatible = "mediatek,mt6397-clk",
> > +	}, {
> > +		.name = "mediatek-mt6397-pinctrl",
> 
> I think the "mediatek-" part should be removed, no?


Ok, I will send another patch to change it, thank you.

Yours,
Hongzhou

