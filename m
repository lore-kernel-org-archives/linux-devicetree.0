From: Patrick Wildt <patrick@blueri.se>
Subject: Re: [PATCH] dt-bindings: clock: imx8mq: Fix numbering overlaps and
 gaps
Date: Tue, 12 Mar 2019 08:36:54 +0100
Message-ID: <20190312073654.GA85609@thor.local>
References: <1551779342-2640-1-git-send-email-abel.vesa@nxp.com>
 <155181110921.20095.1641360339603928947@swboyd.mtv.corp.google.com>
 <20190306130941.dqf3swx66bchm5k2@fsr-ub1664-175>
 <155205894567.20095.2782332899458282059@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <155205894567.20095.2782332899458282059@swboyd.mtv.corp.google.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Abel Vesa <abel.vesa@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 08, 2019 at 07:29:05AM -0800, Stephen Boyd wrote:
> It's mostly about making sure that any existing dtbs don't have their
> numbers shifted around. So hopefully any overlapping identifiers aren't
> in use yet and then those ids can be changed while leaving the ones that
> are in use how they are.

In practice I bet no one uses Linux 5.0's i.MX8M device trees since they
lack too much support.  It's so basic it's not useful.  You'd still run
your existing non-mainline bindings until it is.  Thus I would argue
changing the ABI right now would be the only chance there is.

If you think that chance is gone, then I guess the reasonable thing is
to keep the numbers and only move those (to the end) which overlap.  Or
put them into that erreneous number gap.

Patrick
