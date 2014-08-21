From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH 3/3] ARM: zynq: DT: Add Ethernet phys
Date: Thu, 21 Aug 2014 08:49:19 -0700
Message-ID: <f166a186-301c-4288-97cf-71f8173c07e7@BN1AFFO11FD010.protection.gbl>
References: <1408550219-19825-1-git-send-email-soren.brinkmann@xilinx.com>
 <1408550219-19825-3-git-send-email-soren.brinkmann@xilinx.com>
 <5a7b6f57-b6c0-4fb3-af0d-d403277c0207@BN1AFFO11FD045.protection.gbl>
 <53F5D8D9.7040604@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53F5D8D9.7040604@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Cc: Michal Simek <michal.simek@xilinx.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, 2014-08-21 at 01:32PM +0200, Andreas F=C3=A4rber wrote:
> Am 21.08.2014 10:41, schrieb Michal Simek:
> > On 08/20/2014 05:56 PM, Soren Brinkmann wrote:
> >> Add missing Ethernet phys to Zynq DTs.
> >>
> >> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> >> ---
> >>  arch/arm/boot/dts/zynq-zc702.dts | 6 ++++++
> >>  arch/arm/boot/dts/zynq-zc706.dts | 6 ++++++
> >>  arch/arm/boot/dts/zynq-zed.dts   | 6 ++++++
> >>  3 files changed, 18 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/=
zynq-zc702.dts
> >> index 30bcfe20f0bc..fa810505ab8f 100644
> >> --- a/arch/arm/boot/dts/zynq-zc702.dts
> >> +++ b/arch/arm/boot/dts/zynq-zc702.dts
> >> @@ -36,6 +36,12 @@
> >>  &gem0 {
> >>  	status =3D "okay";
> >>  	phy-mode =3D "rgmii-id";
> >> +	phy-handle =3D <&ethernet_phy>;
> >> +
> >> +	ethernet_phy: ethernet-phy@7 {
> >> +		compatible =3D "marvell,88e1116r", "ethernet-phy-ieee802.3-c22"=
;
> >=20
> > c22 is completely unused by the kernel and also c22 is default opti=
on anyway.
> > Any advantage to have c22 specified here?
>=20
> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/devicetree/bindings/net/phy.txt
>=20
> S=C3=B6ren's marvell,* entries do not seem documented, therefore I us=
ed the
> documented "ethernet-phy-idAAAA.BBBB" based syntax. The documented
> example specifically uses -c22, too.
>=20
> Either it's okay to prepend unrecognized model strings, then you shou=
ld
> update zynq-parallella.dts as well (I put the model in a comment ther=
e)
> or use the official strings like I used and keep the readable models =
as
> comments. Documenting all those "marvell,88e1116r", "marvell,88e1518"=
,
> "marvell,88e1318" PHY bindings and possibly prepending them to the ID
> based strings would be another option, of course.

These phy-bindings are everything than obvious to me. It seems the docs
are spread across a couple of different files and not fully up to date
either. I basically tried to get something working out of the docs, the
parallela and our vendor DT files.

So my thinkings:
 - the compatible string with the -c22 is used and documented in the ph=
y
   bindings, it should be there.
 - the ID based strings seem to be not needed since, IIUC, the core
   reads the ID from the PHY and uses it, so I just left it out not
   trying to figure out how to obtain the correct ID
 - the marvell compatible strings are used in our vendor tree. They
   aren't used anywhere but in our vendor tree. I though keeping them i=
s
   nice since it identifies the PHY fully. And in case that level of
   detail is needed at some point it is already there.

Assuming that we wanna keep things this way, I'm happy to re-spin this
patch and also add a similar compatible string to the parallela DT.

	Thanks,
	S=C3=B6ren
