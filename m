From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: add binding for i.MX8MQ CCM
Date: Fri, 23 Feb 2018 17:29:35 +0800
Message-ID: <20180223092934.GS3217@dragon>
References: <20180201175412.9480-1-l.stach@pengutronix.de>
 <20180222035518.GG3217@dragon> <20180222141246.GL3217@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180222141246.GL3217@dragon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: "A . s . Dong" <aisheng.dong@nxp.com>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, patchwork-lst@pengutronix.de, Rob Herring <robh+dt@kernel.org>, linux-imx@nxp.com, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 22, 2018 at 10:12:48PM +0800, Shawn Guo wrote:
> On Thu, Feb 22, 2018 at 11:55:20AM +0800, Shawn Guo wrote:
> > On Thu, Feb 01, 2018 at 06:54:09PM +0100, Lucas Stach wrote:
> > > This adds the binding for the i.MX8MQ Clock Controller Module.
> > > 
> > > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > 
> > Applied all, thanks.
> 
> I decided to hold it a bit, as I found something which needs a bit more
> discussion.  Will reply to individual patch tomorrow.

Besides the comments I put on individual patches, please also go through
the checkpatch results.  We ignore MAINTAINERS updating and line over
80 characters warnings, but I see the following ones which I think we
should fix.

 - ERROR: code indent should use tabs where possible
 - WARNING: please, no space before tabs

Shawn
