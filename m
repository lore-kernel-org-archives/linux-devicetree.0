From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v3 1/2] arm/mx5: add device tree support for imx53 boards
Date: Tue, 2 Aug 2011 12:43:40 +0100
Message-ID: <20110802114340.GA17952@ponder.secretlab.ca>
References: <1312226252-8566-1-git-send-email-shawn.guo@linaro.org>
	<1312226252-8566-2-git-send-email-shawn.guo@linaro.org>
	<20110802065814.GM31404@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20110802065814.GM31404@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: devicetree-discuss@lists.ozlabs.org, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>, patches@linaro.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 02, 2011 at 08:58:14AM +0200, Sascha Hauer wrote:
> On Tue, Aug 02, 2011 at 03:17:31AM +0800, Shawn Guo wrote:
> > +
> > +	aips@50000000 { /* AIPS1 */
> > +		spba@50000000 {
> > +			esdhc@50004000 { /* ESDHC1 */
> > +				cd-gpios = <&gpio0 1 0>; /* GPIO1_1 */
> > +				wp-gpios = <&gpio0 9 0>; /* GPIO1_9 */
> > +			};
> > +
> > +			esdhc@50008000 { /* ESDHC2 */
> > +				status = "disabled";
> > +			};
> 
> I know the decision is that all devices are enabled by default and must
> be explicitely disabled like this. I really hope we can change this in
> the future for the following reasons:
> 
> - The imx53 device tree is not complete, several devices like nand, ipu
>   and rtc are missing. Now when imx53.dtsi gets the nand device, all
>   board devicetrees have to be changed to keep the old behaviour.
> - Most enabled device entries like the esdhc1 above have additional
>   nodes like cd-gpios anyway, so they must appear in the board tree
>   whereas the disabled devices just add additional churn.

I'll add this topic to the whiteboard for the kernel WG to discuss
this week.

http://pad.ubuntu.com/device-tree-workshop

g.
