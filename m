From: Tang Yuantian-B29983 <B29983@freescale.com>
Subject: RE: [PATCH v5] powerpc/mpc85xx: Update the clock nodes in device tree
Date: Mon, 21 Oct 2013 02:55:21 +0000
Message-ID: <D07C73A334FF604B95B3CBD2A545D07B150C62BA@039-SN2MPN1-013.039d.mgd.msft.net>
References: <1381300704-4238-1-git-send-email-Yuantian.Tang@freescale.com>
 <20131010100331.GE26954@e106331-lin.cambridge.arm.com>
 <D07C73A334FF604B95B3CBD2A545D07B150BD137@039-SN2MPN1-013.039d.mgd.msft.net>
 <20131011092526.GE3910@e106331-lin.cambridge.arm.com>
 <1381518433.7979.536.camel@snotra.buserror.net>
 <D07C73A334FF604B95B3CBD2A545D07B150C24BD@039-SN2MPN1-013.039d.mgd.msft.net>
 <1381788786.7979.643.camel@snotra.buserror.net>
 <D07C73A334FF604B95B3CBD2A545D07B150C2B08@039-SN2MPN1-013.039d.mgd.msft.net>
 <1381858855.7979.693.camel@snotra.buserror.net>
 <D07C73A334FF604B95B3CBD2A545D07B150C312F@039-SN2MPN1-013.039d.mgd.msft.net>
 <1381942009.7979.727.camel@snotra.buserror.net>
 <D07C73A334FF604B95B3CBD2A545D07B150C4600@039-SN2MPN1-013.039d.mgd.msft.net>
 <1382027085.7979.774.camel@snotra.buserror.net>
 <D07C73A334FF604B95B3CBD2A545D07B150C5CAB@039-SN2MPN1-013.039d.mgd.msft.net>
 <1382113880.7979.836.camel@snotra.buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1382113880.7979.836.camel@snotra.buserror.net>
Content-Language: en-US
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
To: Wood Scott-B07421 <B07421@freescale.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Li Yang-Leo-R58472 <r58472@freescale.com>
List-Id: devicetree@vger.kernel.org

> > > > >
> > > > > It's still selecting from multiple PLLs.
> > > > >
> > > > > > I don't know whether "divider" module exists or not. If it
> > > > > > exists, it should be part of PLL or between PLL and MUX.
> > > > > > wherever it was, the
> > > > > device tree binding is appropriate.
> > > > >
> > > > > The device tree binding is unnecessarily complicated.
> > > > >
> > > > > > The P3041RM shows exactly each PLL has 2 outputs which
> > > > > > definitely have
> > > > > no "divider" at all.
> > > > >
> > > > > That diagram is a bit weird -- one of the outputs is used as is,
> > > > > and the other is split into 1/2 and 1/4.  It doesn't really
> > > > > matter though; the end result is the same.  We're describing the
> > > > > programming interface, not artwork choices in the manual.
> > > > >
> > > > > -Scott
> > > > >
> > > > If the device tree needs to be modified, could you give me your
> > > suggestions?
> > >
> > > My suggestion is to have only one output per PLL node.  The MUX node
> > > would have one input per PLL.  Dividers would be handled internally
> > > to the MUX driver.
> > >
> > > -Scott
> > >
> > I don't think your suggestion is constructive.
> 
> Hmm?
> 
> > Your suggestion is on the premise of that the "divider" is part of
> > MUX, And I think it should be part of PLL.
> > MUX can't CREATE clock which PLL can. So my thought is more reasonable.
> > If the device tree documents like what you said, it would have few help
> for driver.
> > The reason is obvious that the driver is still going to deal with the
> "divider"
> > detail which varies from platform to platform.
> > I will document as it was unless you prove your suggestion.
> 
> I can't follow this.  My point is that my suggestion better matches the
> programming model, and is simpler.
> 
> -Scott
> 
I didn't see how your suggestion is a better matching.

 OSC ----> PLL1 ----> mux ----> CPU
      |           |
      |--> PLL2 --| 
        ........
As your suggestion, the clock tree looks like the above.
In this case, the MUX driver will not know the divider
details(/2, /4, or /3).
I think the MUX should act like "switch" which choose one
of the input clock as a output clock. It should not CREATE
clock(like PLL1/2, PLL1/4).
The purpose of clock driver is to establish the clock tree.
The clock tree will not be established in your suggestion
because the divider is missing, we don't know where PLL/2 comes from.

If you really like your proposal, it should be changed to this:

OSC ------> PLL1 -----> PLL1 /1 ---------> MUX ------->CPU
     |            |___> PLL1 /2 _______|
     |                                 |
     |____> PLL2 -----> PLL2 /2 -------|
                  |___> PLL2/ 4 _______|

(it is possible that PLLs have different divider).

Regards,
Yuantian
