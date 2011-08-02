From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v3 1/2] arm/mx5: add device tree support for imx53 boards
Date: Tue, 2 Aug 2011 14:40:30 +0100
Message-ID: <20110802134030.GA20071@ponder.secretlab.ca>
References: <1312226252-8566-1-git-send-email-shawn.guo@linaro.org>
	<1312226252-8566-2-git-send-email-shawn.guo@linaro.org>
	<CACxGe6vvL=xGCGMR0yhyJ8r2zLvBgYhYS1b9_VF3dg5hRNhNzQ@mail.gmail.com>
	<20110802060936.GA9972@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20110802060936.GA9972@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawn.guo@freescale.com>
Cc: devicetree-discuss@lists.ozlabs.org, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 02, 2011 at 02:09:37PM +0800, Shawn Guo wrote:
> On Mon, Aug 01, 2011 at 11:01:39PM +0100, Grant Likely wrote:
> > On Mon, Aug 1, 2011 at 8:17 PM, Shawn Guo <shawn.guo@linaro.org> wrote:
> > However, today when we were talking you asked if it would be better to
> > use a callback into board-specific code instead of the iomux table
> > that is implemented in this patch.  I was fine either way, but my
> > opinion was that the table would probably result in less code.  Well,
> > combined with the above problem, I think I was wrong.  Since the only
> > difference in the ard variant is the call to
> > imx53_ard_weim_cs_config(), both the cs config and the iomux setup
> > will be simpler if both are handled in a callback.  You're original
> > instinct was correct.
> > 
> 
> Ok, here you go.

Yes, I think this is the right approach.  Go ahead and spin it into a
real patch series and repost.

Acked-by: Grant Likely <grant.likely@secretlab.ca>

g.
