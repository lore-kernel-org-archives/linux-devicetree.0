From: "Y.T. Tang" <yuantian.tang@nxp.com>
Subject: RE: [PATCH 1/2] dt-bindings: qoriq-clock: Add coreclk
Date: Wed, 1 Mar 2017 01:45:54 +0000
Message-ID: <DB6PR0402MB2837F35D8881AA2E4F12F430F0290@DB6PR0402MB2837.eurprd04.prod.outlook.com>
References: <1487137656-4006-1-git-send-email-yuantian.tang@nxp.com>
 <20170227171837.eymnyebgn7ocsp7w@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170227171837.eymnyebgn7ocsp7w@rob-hp-laptop>
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
To: Rob Herring <robh@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Scott Wood <oss@buserror.net>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Tuesday, February 28, 2017 1:19 AM
> To: Y.T. Tang <yuantian.tang@nxp.com>
> Cc: mturquette@baylibre.com; sboyd@codeaurora.org;
> mark.rutland@arm.com; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; Scott Wood <oss@buserror.net>
> Subject: Re: [PATCH 1/2] dt-bindings: qoriq-clock: Add coreclk
> 
> On Wed, Feb 15, 2017 at 01:47:35PM +0800, yuantian.tang@nxp.com wrote:
> > From: Tang Yuantian <Yuantian.Tang@nxp.com>
> >
> > ls1012a has separate input root clocks for core PLLs versus the
> > platform PLL, with the latter described as sysclk in the hw docs.
> > Update the qoriq-clock binding to allow a second input clock, named
> > "coreclk".  If present, this clock will be used for the core PLLs.
> >
> > Signed-off-by: Scott Wood <oss@buserror.net>
> > Signed-off-by: Tang Yuantian <yuantian.tang@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/clock/qoriq-clock.txt | 6 ++++++
> >  1 file changed, 6 insertions(+)
> 
> The change looks fine, but sounds like Scott should remain the author (or
> agree he shouldn't be).
> 
Sure, please make Scott the author and apply this patch set.

Regards,
Yuantian

> >
> > diff --git a/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> > b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> > index df9cb5a..97a9666 100644
> > --- a/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> > +++ b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> > @@ -55,6 +55,11 @@ Optional properties:
> >  - clocks: If clock-frequency is not specified, sysclk may be provided
> >  	as an input clock.  Either clock-frequency or clocks must be
> >  	provided.
> > +	A second input clock, called "coreclk", may be provided if
> > +	core PLLs are based on a different input clock from the
> > +	platform PLL.
> > +- clock-names: Required if a coreclk is present.  Valid names are
> > +	"sysclk" and "coreclk".
> >
> >  2. Clock Provider
> >
> > @@ -71,6 +76,7 @@ second cell is the clock index for the specified type.
> >  	2	hwaccel		index (n in CLKCGnHWACSR)
> >  	3	fman		0 for fm1, 1 for fm2
> >  	4	platform pll	0=pll, 1=pll/2, 2=pll/3, 3=pll/4
> > +	5	coreclk		must be 0
> >
> >  3. Example
> >
> > --
> > 2.1.0.27.g96db324
> >
