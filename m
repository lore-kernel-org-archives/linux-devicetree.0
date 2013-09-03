From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/4] ARM: shmobile: r8a7778: add Ether DT support
Date: Tue, 03 Sep 2013 14:11:17 +0200
Message-ID: <2922765.My7X58lhxd@avalon>
References: <201309010311.05466.sergei.shtylyov@cogentembedded.com> <1738124.5rApJWhXUN@avalon> <1378135954.3321.5.camel@hornet>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1378135954.3321.5.camel@hornet>
Sender: linux-sh-owner@vger.kernel.org
To: Pawel Moll <pawel.moll@arm.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "horms@verge.net.au" <horms@verge.net.au>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Mark Rutland <Mark.Rutland@arm.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "ian.campbell@citrix.com" <ian.campbell@citrix.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Pawe=C5=82,

On Monday 02 September 2013 16:32:34 Pawel Moll wrote:
> On Mon, 2013-09-02 at 15:18 +0100, Laurent Pinchart wrote:
> > Documentation/devicetree/booting-without-of.txt mentions it, as wel=
l as a
> > couple of other DT bindings document, but there's no clear document=
ation
> > of what device_type should be for network device, and whether the p=
roperty
> > is mandatory or optional. Clarifying the documentation would be gre=
at.
>=20
> It's documented in the ePAPR spec:
>=20
> "The device_type property was used in IEEE 1275 to describe the devic=
e=E2=80=99s
> FCode programming model. Because ePAPR does not have FCode, new use o=
f
> the property is deprecated, and it should be included only on cpu and
> memory nodes for compatibility with IEEE 1275=E2=80=93derived device =
trees."

Thank you for the clarification.

> The bottom line is - don't use it, unless you've good good reasons?

I'll let Sergei share his opinion on whether we've got good reasons :-)

--=20
Regards,

Laurent Pinchart

