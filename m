From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 1/2] dts: arm64: add LS1043A DPAA support
Date: Mon, 27 Mar 2017 15:55:48 +0800
Message-ID: <20170327075546.GR30608@dragon>
References: <1488382505-17554-1-git-send-email-madalin.bucur@nxp.com>
 <1488382505-17554-2-git-send-email-madalin.bucur@nxp.com>
 <20170314070732.GH3618@dragon>
 <HE1PR04MB11297D944241012F44C0ADF8EC3C0@HE1PR04MB1129.eurprd04.prod.outlook.com>
 <20170327062719.GQ30608@dragon>
 <HE1PR04MB1129A2CA69EB29CD45DBCD17EC330@HE1PR04MB1129.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <HE1PR04MB1129A2CA69EB29CD45DBCD17EC330@HE1PR04MB1129.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Madalin-Cristian Bucur <madalin.bucur@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, Roy Pledge <roy.pledge@nxp.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 27, 2017 at 07:03:40AM +0000, Madalin-Cristian Bucur wrote:
> > > > > +	fman@1a00000 {
> > > > > +		enet0: ethernet@e0000 {
> > > > > +		};
> > > > > +
> > > > > +		enet1: ethernet@e2000 {
> > > > > +		};
> > > > > +
> > > > > +		enet2: ethernet@e4000 {
> > > > > +		};
> > > > > +
> > > > > +		enet3: ethernet@e6000 {
> > > > > +		};
> > > > > +
> > > > > +		enet4: ethernet@e8000 {
> > > > > +		};
> > > > > +
> > > > > +		enet5: ethernet@ea000 {
> > > > > +		};
> > > > > +
> > > > > +		enet6: ethernet@f0000 {
> > > > > +		};
> > > > > +	};
> > > >
> > > > I do not quite understand why these nodes are empty.
> > >
> > > These nodes provide the aliases (and custom SoC mapping) for the
> > > FMan ports that are used on this particular SoC. The particular
> > > node details are found in the port dtsi file thus no information
> > > is required here. Given the fact that the numbering and actual
> > > ports that are in use can vary between SoCs, the aliases cannot
> > > be included in the port dtsi nor in the FMan dtsi.
> > 
> > Do not completely follow.  What do you mean by 'port dtsi file'?  Maybe
> > I should wait for you new patches with better commit log and comments to
> > understand these odd empty nodes.
> 
> The DPAA IP can have a certain number of ports. Out of those, a certain
> SoC can use all or only a subset, with diverse decisions on actual numbering
> of the used ports. Next, when using the SoC on a particular board, some
> ports will be used, some will not. The file hierarchy relates to this
> hierarchy - you have individual port files that are included by the
> SoC dtsi which in turn is included by the board dts. These nodes do not
> need any new content as all the node details are provided by the port
> dtsi files. The information they provide is the alias used for each port.

My impression is that such hierarchy mapping is not really necessary and
only makes the device tree source messy and hard to follow.  I do not
like it.

> 
> > >
> > > > > +};
> > > > > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
> > > > b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
> > > > > index 0989d63..ee66bb2 100644
> > > > > --- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
> > > > > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
> > > > > @@ -181,3 +181,5 @@
> > > > >  		reg = <0>;
> > > > >  	};
> > > > >  };
> > > > > +
> > > > > +/include/ "fsl-ls1043-post.dtsi"
> > > >
> > > > Move it to header of the file.
> > >
> > > This is to be included at the end, to make sure the references are
> > > met and to allow overrides if needed.
> > 
> > What is broken if you move the include to header?
> 
> Not much besides the structure we've always used for our SoCs device
> trees. The file is called "-post.dtsi" because here is the place any
> required overrides can be made, if needed. Moving to the top renders
> having this separate file useless.

That's great, and let's kill it then.

> 
> > >
> > > > > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
> > > > b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
> > > > > index c37110b..d94f003 100644
> > > > > --- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
> > > > > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
> > > > > @@ -139,3 +139,78 @@
> > > > >  &duart1 {
> > > > >  	status = "okay";
> > > > >  };
> > > > > +
> > > > > +/include/ "fsl-ls1043-post.dtsi"
> > > > > +
> > > >
> > > > Ditto
> > > >
> > > > > +&soc {
> > > > > +	fman@1a00000 {
> > > > > +		ethernet@e0000 {
> > > >
> > > > You defined enet0 label.  Why don't you use it?
> > > >
> > >
> > > The enet0 label is used by u-boot for fix-ups, providing the
> > > actual offset here makes it easier to follow.
> > 
> > You will not need to construct the node hierarchy with label.  And
> > alias/label name is more easier to follow than offset.
> > 
> > Shawn
> 
> When I said easier to follow I was referring to someone creating a
> new device tree for his custom board, not someone reading the device
> tree. If you have the board and SoC reference manuals in your hands
> and you are writing a new board device tree, having the offset here
> makes things easier. The benefit of having one less indentation level
> is lesser than that.

The while complex and messy file hierarchy makes users' life harder,
both the ones reading the device tree and the ones creating board device
tree.  I would suggest you go the opposite, making the device tree
simple and easy for users by allowing data duplication.  In arm/arm64
device tree world, we do not consider DT data reusing/sharing among
different SoCs that much.

Shawn
