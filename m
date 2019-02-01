From: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH 5/6] regulator: mt6358: Add support for MT6358 regulator
Date: Fri, 1 Feb 2019 10:13:37 +0800
Message-ID: <1548987217.28835.2.camel@mtksdaap41>
References: <1548839891-20932-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1548839891-20932-6-git-send-email-hsin-hsiung.wang@mediatek.com>
 <20190130151825.GA10665@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190130151825.GA10665@sirena.org.uk>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Wed, 2019-01-30 at 15:18 +0000, Mark Brown wrote:
> On Wed, Jan 30, 2019 at 05:18:10PM +0800, Hsin-Hsiung Wang wrote:
> 
> > +static const struct of_device_id mt6358_of_match[] = {
> > +	{ .compatible = "mediatek,mt6358-regulator", },
> > +	{ /* sentinel */ },
> > +};
> > +MODULE_DEVICE_TABLE(of, mt6358_of_match);
> 
> There should be no need for a separate compatbile string here - we
> aren't describing the hardware any more than we already did with the
> parent node for the MFD, we're describing how Linux currently splits the
> software that controls the hardware up.  Just have the MFD instantiate
> the regulator driver when it probes.
> 
> Otherwise this driver looks very good and clean.

Thanks for your suggestion.
It sounds pretty good and I will modify it in next patch series.

> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
