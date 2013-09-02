From: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH 1/4] ARM: shmobile: r8a7778: add Ether DT support
Date: Mon, 02 Sep 2013 16:32:34 +0100
Message-ID: <1378135954.3321.5.camel@hornet>
References: <201309010311.05466.sergei.shtylyov@cogentembedded.com>
	 <1643070.uIkONXsrBj@avalon> <52249B16.8010409@cogentembedded.com>
	 <1738124.5rApJWhXUN@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1738124.5rApJWhXUN@avalon>
Sender: linux-sh-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "horms@verge.net.au" <horms@verge.net.au>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Mark Rutland <Mark.Rutland@arm.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "ian.campbell@citrix.com" <ian.campbell@citrix.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2013-09-02 at 15:18 +0100, Laurent Pinchart wrote:
> Documentation/devicetree/booting-without-of.txt mentions it, as well =
as a=20
> couple of other DT bindings document, but there's no clear documentat=
ion of=20
> what device_type should be for network device, and whether the proper=
ty is=20
> mandatory or optional. Clarifying the documentation would be great.

It's documented in the ePAPR spec:

"The device_type property was used in IEEE 1275 to describe the device=E2=
=80=99s
=46Code programming model. Because ePAPR does not have FCode, new use o=
f
the property is deprecated, and it should be included only on cpu and
memory nodes for compatibility with IEEE 1275=E2=80=93derived device tr=
ees."

The bottom line is - don't use it, unless you've good good reasons?

Pawe=C5=82


