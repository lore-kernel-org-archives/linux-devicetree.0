From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH] dt-bindings: imx: update scu resource id headfile
Date: Wed, 20 Feb 2019 09:49:54 +0000
Message-ID: <AM6PR04MB4215014B734F71D409D617A5807D0@AM6PR04MB4215.eurprd04.prod.outlook.com>
References: <1550566601-11497-1-git-send-email-Anson.Huang@nxp.com>
 <20190219125211.2pg2bqxner4klcb5@pengutronix.de>
 <DB3PR0402MB3916AF3AA0283DB22DF61E2FF57C0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <20190219144808.qqpaubjcsb4huoml@pengutronix.de>
 <DB3PR0402MB39160A56E168ED20410674D7F57C0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <AM6PR04MB42152D05E62753E760741160807D0@AM6PR04MB4215.eurprd04.prod.outlook.com>
 <20190220081650.cu3yzausx55jefb6@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190220081650.cu3yzausx55jefb6@pengutronix.de>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Anson Huang <anson.huang@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> From: Marco Felsch [mailto:m.felsch@pengutronix.de]
> Sent: Wednesday, February 20, 2019 4:17 PM
> On 19-02-20 03:38, Aisheng Dong wrote:
> > [...]
> >
> > > > I don't like droping some ID's (e.g. IMX_SC_R_DC_0_CAPTURE0) by
> > > > mark them as unused or even worse give them a other meaning. IMHO
> > > > the scu-api should be stable since day 1 and the ID's should only be
> extended.
> > > > Marking ID's as deprecated is much better than moving them around.
> > >
> > > I agree the SCU APIs should be stable since day 1 and the ID should
> > > ONLY be extended, but that is the best cases, the reality is, there
> > > are different SoCs/Revision, some revisions may remove the resources
> > > ID defined in pre-coded SCU firmware, like the
> > > IMX_SC_R_DC_0_CAPTURE0 etc., so SCU APIs removes them after real
> > > silicon arrived, now latest SCU firmware marks them as UNUSED, they
> > > could be replaced by some other new resources in later new SoC, I am
> > > NOT sure, but if it happens, this resource ID table should be
> > > updated anyway, leaving the out-of-date resource ID table there will have
> issues, since it is NOT sync with SCU firmware.
> > >
> > > So how to resolve such issue? We hope the SCU firmware should be
> > > stable since day 1, but the truth is NOT, could be still some
> > > updates but NOT very often. And I believe the updates will NOT break old
> kernel version.
> 
> Hi Anson,
> 
> Please don't mix the dt-bindings and the kernel related stuff.
> Unfortunately the bindings are within the kernel repo which in fact is great for
> us kernel developer but the bindings are also used in other projects such as
> barebox or other kernels (don't know the BSD guys). So you can't ensure that
> your change will break something. Please keep that in mind.
> 
> IMHO solving that issue should be done by the scu firmware. I tought the scu is
> a cortex-m4 with a bunch of embedded flash and ram (I don't know that much
> about the scu since it is closed/black-boxed). Why do you don't use a
> translation table within the scu? As I said earlier I don't like the redefinition of
> ID's since they are now part of the dt-bindings.
> The bindings can store up to 32bit values which is a large number ;) IMHO
> wasting some ID's in favour of stability is a better solution.
> 

As far as I know, those remove resource IDs are pre-defined and has never been used
and won't be used anymore by SC firmware. (Anson can double check it)
So I think it's safe to remove them or mark them as deprecated.

Personally I may prefer to remove them as they never worked to avoid confusing,
especially at this early stage for mx8.

Regards
Dong Aisheng
