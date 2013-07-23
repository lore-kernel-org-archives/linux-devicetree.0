From: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH 3/3] MAINTAINERS: Refactor device tree maintainership
Date: Tue, 23 Jul 2013 18:14:27 +0100
Message-ID: <1374599667.25700.92.camel@hornet>
References: <1374290388-19308-1-git-send-email-grant.likely@linaro.org>
	 <1374290388-19308-3-git-send-email-grant.likely@linaro.org>
	 <1374511851.3609.10.camel@hornet> <51ED9018.1020003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51ED9018.1020003@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: "grant.likely@linaro.org" <grant.likely@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Olof Johansson <olof@lixom.net>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2013-07-22 at 21:03 +0100, Rob Herring wrote:
> On 07/22/2013 11:50 AM, Pawel Moll wrote:
> > On Sat, 2013-07-20 at 04:19 +0100, Grant Likely wrote:
> >> +F:	include/dt-bindings
> >=20
> > One thing we didn't finish talking about was the question if this
> > directory is supposed to contain *.dtsi files as well? The obvious
> > problem I have is a vexpress motherboard being (well, actually not =
bein
> > right now) shared between arch/arm/boot/dts and arch/arm64/boot/dts=
=2E
>=20
> Please no.=20

No as in: no don't put *.dtsi files into include/dt-bindings; or: no, d=
o
not duplicate the motherboard file?

It you meant the latter, this is exactly what I wanted to say: I don't
want to do that, but there's no way of avoiding it right now.

> When we move dts files out of the kernel,=20

And when would this happen? Don't get me wrong, I'm in favour of doing
this as well (I really don't want to push all 15-or-so DTSes for all th=
e
different models and SMMs I have into the kernel)

> we will still need
> to copy dt-bindings into the kernel. Also, I think we should move all
> dts files out of arch subdirs and arrange by vendor or soc family. I'=
m
> sure there are some cases that structure doesn't fit well, but there =
is
> very little in a dts tied to a cpu architecture.

I couldn't agree more. So:

<root>/include/dt-bindings/vendor/*?
<root>/dts/vendor/*?
<root>/of/vendor/*?
<root>/dt/vendor/*?
<root>/drivers/of/vendor/*?

Pawe=C5=82
