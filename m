From: Scott Wood <oss@buserror.net>
Subject: Re: [PATCH 1/2 v3] powerpc/fsl: Use new clockgen binding
Date: Fri, 21 Dec 2018 22:35:45 -0600
Message-ID: <5f83750ca7c146f7080444b85dc58f51cc0b3b35.camel@buserror.net>
References: <20181031065736.32719-1-andy.tang@nxp.com>
 <09ee2f91765add47e628e0ab03776d468cec0914.camel@buserror.net>
 <VI1PR04MB43332FE4914896FCBE8E997FF3A70@VI1PR04MB4333.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <VI1PR04MB43332FE4914896FCBE8E997FF3A70@VI1PR04MB4333.eurprd04.prod.outlook.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Andy Tang <andy.tang@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "paulus@samba.org" <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2018-12-12 at 01:57 +0000, Andy Tang wrote:
> > -----Original Message-----
> > From: Scott Wood <oss@buserror.net>
> > Sent: 2018年11月26日 9:19
> > To: Andy Tang <andy.tang@nxp.com>
> > Cc: mturquette@baylibre.com; sboyd@kernel.org; robh+dt@kernel.org;
> > mark.rutland@arm.com; benh@kernel.crashing.org; paulus@samba.org;
> > mpe@ellerman.id.au; linux-clk@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> > linuxppc-dev@lists.ozlabs.org
> > Subject: Re: [PATCH 1/2 v3] powerpc/fsl: Use new clockgen binding
> > 
> > On Wed, 2018-10-31 at 14:57 +0800, Yuantian Tang wrote:
> > > From: Scott Wood <oss@buserror.net>
> > > 
> > > The driver retains compatibility with old device trees, but we don't
> > > want the old nodes lying around to be copied, or used as a reference
> > > (some of the mux options are incorrect), or even just being clutter.
> > > 
> > > 
> > > +sysclk: sysclk {
> > > +	compatible = "fixed-clock";
> > > +	#clock-cells = <0>;
> > > +	clock-frequency = <100000000>;
> > > +	clock-output-names = "sysclk";
> > > +};
> > > +
> > >  clockgen: global-utilities@e1000 {
> > 
> > The U-Boot fixup won't work with this.  U-Boot patches the frequency
> > directly into the clockgen node (BTW, this is another reason to preserve
> > the generic
> > 1.0/2.0 compatible string).  The new binding does not require an input
> > clock node when it is provided as clock-frequency directly in the clockgen
> > node -- and the sysclk node was not in my original patch (nor did you note
> > that you made changes from that original).  Why did you add it?
> > 
> > I would just remove it when applying, but I'm concerned that this
> > indicates
> > a lack of testing (and I don't have the hardware access to test it myself,
> > except on t4240) -- unless the 100 MHz sysclk just happened to be correct
> > on the machines you tested (which would also be a test coverage
> > problem)?
> 
> [Andy] You are right. Sysclk may not be useful anymore. 
> Uboot will fixup the clockgen node correctly. Please apply this patch
> without sysclk. We will
> test it and catch the error if the clock is not fixed correctly.

OK.

> BTW, which git tree are you going to apply it on? This one?
> 
https://git.kernel.org/pub/scm/linux/kernel/git/scottwood/linux.git/log/?h=next

That will be the branch I use to send the patches to Michael, but it's not a
branch that is kept constantly updated.  If you're asking what tree to base
future patches on, that would generally be the next branch of
powerpc/linux.git (unless you depend on something else that isn't there yet).

-Scott
