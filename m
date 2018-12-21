From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH 4/5] clk: imx8qxp: make the name of clock ID generic
Date: Fri, 21 Dec 2018 01:44:28 +0000
Message-ID: <AM0PR04MB4211F8786714DD6CCBB55F0A80B80@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1545232888-9302-1-git-send-email-aisheng.dong@nxp.com>
 <1545232888-9302-5-git-send-email-aisheng.dong@nxp.com>
 <CAOMZO5DzMpMp-Tf74iM3SuHoFpji8z-dxM-UsC13GeDx2bZYgA@mail.gmail.com>
 <VI1PR04MB4222ABD43B82BD3C0B73404780BF0@VI1PR04MB4222.eurprd04.prod.outlook.com>
 <154533484105.79149.16225192496445475758@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <154533484105.79149.16225192496445475758@swboyd.mtv.corp.google.com>
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
To: Stephen Boyd <sboyd@kernel.org>, Fabio Estevam <festevam@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Stephen Boyd [mailto:sboyd@kernel.org]
> Quoting Aisheng Dong (2018-12-19 22:26:50)
> > > -----Original Message-----
> > > From: Fabio Estevam [mailto:festevam@gmail.com] Hi Aisheng,
> > >
> > > On Wed, Dec 19, 2018 at 1:29 PM Aisheng Dong
> <aisheng.dong@nxp.com>
> > > wrote:
> > > >
> > > > SCU clock can be used in a similar way by IMX8QXP and IMX8QM SoCs.
> > > > Let's make the name of clock ID generic to allow other SoCs to
> > > > reuse the common part.
> > > >
> > > > This patch only changes the clock id name and file name, so no
> > > > functional change.
> > > >
> > > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > > Cc: Sascha Hauer <kernel@pengutronix.de>
> > > > Cc: Fabio Estevam <fabio.estevam@nxp.com>
> > > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > > Cc: Michael Turquette <mturquette@baylibre.com>
> > > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > > ---
> > > >  drivers/clk/imx/clk-imx8qxp-lpcg.c        | 146 +++++++--------
> > > >  drivers/clk/imx/clk-imx8qxp.c             | 152 ++++++++--------
> > > >  include/dt-bindings/clock/imx8-clock.h    | 289
> > > ++++++++++++++++++++++++++++++
> > > >  include/dt-bindings/clock/imx8qxp-clock.h | 289
> > > > ------------------------------
> > > >  4 files changed, 438 insertions(+), 438 deletions(-)
> > >
> > > This seems like unneeded churn. Just keep the existing naming and
> > > other SoCs can reuse it without problem.
> >
> > There's a reason.
> > We still need add some clock IDs which exist on MX8QM only (probably
> > more on future SoCs) Having them prefixed with 'IMX8QXP' may look
> strange.
> >
> > Besides that, as those clock IDs will also be used in devicetree, make
> > the name generic for different SoCs seems still better and less confusing.
> >
> 
> This looks like an integration problem. Is anyone using the defines that are
> merged through clk tree now? A grep of linux-next says no, but how can I be
> sure?

I'm sure no one is using it now.
The only user DTS (imx8qxp mek) is waiting for merge after 4.21-rc1 is out.
So it's a chance to update it. 

> 
> So can you leave around the header file with the deprecated define names and
> introduce another one that's a copy of the header file but with the non-SoC
> specific names?  Then you can wait for a release cycle and delete the old
> header file that nobody should be using in DT anymore.
> Unless you plan to make sure that nobody uses the deprecated defines
> somehow?
> 

Yes, the plan is to make sure nobody uses that.
Otherwise, it may be hard to send DTS patches using new CLK ID name through
different tree later.

> And please Cc DT mailing list and maintainers one all bindings patches.
> This includes include/dt-bindings/.

Sorry, I should have added Devicetree maintainer.
Copy Rob.

Regards
Dong Aisheng
