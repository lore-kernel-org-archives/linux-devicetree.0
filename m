From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2 1/4] arm64: dts: rockchip: Split out common nodes for Rock960 based boards
Date: Wed, 12 Sep 2018 09:26:12 +0200
Message-ID: <11137562.zz0kzkSHxt@diego>
References: <20180911023031.4892-1-manivannan.sadhasivam@linaro.org> <9e1868684ed851dfa19300ac2e648cfea7bf3eb9.camel@collabora.com> <20180912031248.GA4880@Mani-XPS-13-9360>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180912031248.GA4880@Mani-XPS-13-9360>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Ezequiel Garcia <ezequiel@collabora.com>, robh+dt@kernel.org, vicencb@gmail.com, shawn.lin@rock-chips.com, enric.balletbo@collabora.com, pbrobinson@gmail.com, tom@vamrs.com, dev@vamrs.com, stephen@vamrs.com, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 12. September 2018, 05:12:48 CEST schrieb Manivannan Sadhasivam:
> Hi Ezequiel,
> 
> On Tue, Sep 11, 2018 at 04:40:29PM -0300, Ezequiel Garcia wrote:
> > On Tue, 2018-09-11 at 08:00 +0530, Manivannan Sadhasivam wrote:
> > > Since the same family members of Rock960 boards (Rock960 and Ficus)
> > > share the same configuration, split out the common nodes into a common
> > > dtsi file for reducing code duplication. The board specific nodes for
> > > Ficus boards are then placed in corresponding board DTS file.
> > 
> > I think it should be possible to move the common USB nodes to the dtsi
> > file, and keep the board-specific (phy-supply property) in the dts files:
> > 
> > &u2phy0_host {
> > 
> >         phy-supply = <&vcc5v0_host>;
> > 
> > };
> > 
> > &u2phy1_host {
> > 
> >         phy-supply = <&vcc5v0_host>;
> > 
> > };
> 
> We can do that but my intention was to entirely partition the nodes
> which are not common. So that it would be less confusing when someone
> looks at it (please correct me if I'm wrong).

The supply is actually named the same on both boards, so you could move
all the usb-nodes to the main dtsi, including the reference to vcc5v0_host
which would then get defined itself in the two board dts.

Then again, seeing that the vcc5v0_host also only differs in the actually
used gpio another option would be to move the whole regulator node
to the dtsi and just define the gpio properties in the board dts files.


Heiko
