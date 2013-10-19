From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH RFC 1/2] ARM: imx6qdl: provide pinctrl configurations
 for DAT3 pull-down
Date: Sat, 19 Oct 2013 16:05:56 +0100
Message-ID: <20131019150556.GI25034@n2100.arm.linux.org.uk>
References: <20131005112147.GX12758@n2100.arm.linux.org.uk>
 <E1VSPw9-0004Ug-BF@rmk-PC.arm.linux.org.uk>
 <20131007055340.GB3739@S2101-09.ap.freescale.net>
 <20131007180357.GS12758@n2100.arm.linux.org.uk>
 <20131008015426.GA7480@S2101-09.ap.freescale.net>
 <52537378.1020904@wwwdotorg.org>
 <20131008034048.GB7480@S2101-09.ap.freescale.net>
 <20131008090015.GC25034@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20131008090015.GC25034@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 08, 2013 at 10:00:15AM +0100, Russell King - ARM Linux wrote:
> On Tue, Oct 08, 2013 at 11:40:51AM +0800, Shawn Guo wrote:
> > On Mon, Oct 07, 2013 at 08:52:40PM -0600, Stephen Warren wrote:
> > > >>> &usdhc1 {
> > > >>> 	pinctrl-names = "default";
> > > >>> 	pinctrl-0 = <&pinctrl_usdhc1_1 &pinctrl_usdhc1_1_dat3cd>;
> > > >>> 	...
> > > >>> 	status = "okay";
> > > >>> };
> > > >>
> > > >> Are you sure that this will always be the case?  This would assume that
> > > >> the pinctrl entries are always processed sequentially.
> > > > 
> > > > That will always be the case per my understanding.  Otherwise, I would
> > > > be so surprised.  Are you seeing any case that the entries are not
> > > > processed sequentially?
> > > 
> > > Given the way the Linux code currently works, I think that will
> > > currently happen in practice. However, there's nothing in the pinctrl DT
> > > binding documentation that guarantees (or even mentions) such semantics.
> > 
> > Ah, that's Russell's point, I guess.  I think it makes perfect sense to
> > make this clear in the binding doc, as this "overwrite mechanism" can be
> > very helpful.  I will send a patch for it.
> 
> Exactly - otherwise we're just relying on implementation details.
> There's nothing at present which mandates starting at the first entry
> and working through sequentially to the last entry, which means another
> implementation can choose to operate in the opposite order.  If it does,
> what you're suggesting won't work so well.
> 
> However, there's another point to consider.  In cases like this, we will
> cause a glitch on the pin.  When we process the initial set, we will set
> the pull-up high, and then later set it low.  That may not be a problem
> in this case, but that's not to say it won't be in every case, and that's
> something which also needs to be considered.

I can't find what the result of this discussion was, but from what I
remember, we decided that we weren't going to do this override thing,
and instead we were going to separate out the configuration of DAT3.

Who's going to do that?  I'd rather not, because it means editing
quite a number of DT files which I have no way to test, and the
chances of messing this up are quite high.  I've already developed
a deep seated hatred for DT in general through my involvement with
IMX, particularly how it's very easy to make an undetected mistake
and then spend hours debugging it.

Until this is resolved, I'm sticking with my own method of redefining
the entire pinctrl set for DAT3 pull-down, which I've tested as working.
