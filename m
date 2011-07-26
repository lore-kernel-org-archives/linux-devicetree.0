From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH 1/2] arm/mx5: parse iomuxc pad configuratoin from device
	tree
Date: Wed, 27 Jul 2011 00:34:07 +0800
Message-ID: <20110726163406.GB19600@S2100-06.ap.freescale.net>
References: <1311606467-28985-1-git-send-email-shawn.guo@linaro.org>
	<1311606467-28985-2-git-send-email-shawn.guo@linaro.org>
	<20110725204630.GD26735@ponder.secretlab.ca>
	<20110726024354.GI21641@S2100-06.ap.freescale.net>
	<20110726062931.GZ20587@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20110726062931.GZ20587@pengutronix.de>
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
Cc: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 26, 2011 at 08:29:32AM +0200, Sascha Hauer wrote:
> On Tue, Jul 26, 2011 at 10:43:55AM +0800, Shawn Guo wrote:
> > On Mon, Jul 25, 2011 at 02:46:30PM -0600, Grant Likely wrote:
> > > On Mon, Jul 25, 2011 at 11:07:46PM +0800, Shawn Guo wrote:
> > > > It adds function mxc_iomuxc_dt_init() to parse iomuxc pad configuration
> > > 
> > Specifying string in dts, and then parsing the string, mapping it to
> > one of the huge MX53_PAD_ definition in kernel init code?
> > 
> > One thing I'm trying to do is to replace those huge iomux-mx*.h headers
> > with dts binding, and then get rid of those headers from Linux tree.
> 
> I don't like these files either, so getting rid of them looks promising.
> OTOH don't forget that we need some of the pins during runtime for
> gpio/function switching.
> 
Do we have plan to use Linus.W's pinmux subsystem, which will perfectly
work for runtime configuration?

-- 
Regards,
Shawn
