From: Jisheng Zhang <jszhang@marvell.com>
Subject: Re: [PATCH 2/3] ARM: dts: document the berlin enable-method
 property
Date: Thu, 3 Apr 2014 17:14:15 +0800
Message-ID: <20140403171415.13adae45@xhacker>
References: <1396512496-8030-1-git-send-email-antoine.tenart@free-electrons.com>
	<1396512496-8030-3-git-send-email-antoine.tenart@free-electrons.com>
	<20140403162202.79b63729@xhacker>
	<533D21AF.2070508@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <533D21AF.2070508@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Antoine =?UTF-8?B?VMOpbmFydA==?= <antoine.tenart@free-electrons.com>
Cc: "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>, "alexandre.belloni@free-electrons.com" <alexandre.belloni@free-electrons.com>, Jimmy Xu <zmxu@marvell.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Antoine,

On Thu, 3 Apr 2014 01:54:07 -0700
Antoine T=C3=A9nart <antoine.tenart@free-electrons.com> wrote:

> Jisheng,
>=20
> On 03/04/2014 10:22, Jisheng Zhang wrote:
> > Hi,
> >
> > On Thu, 3 Apr 2014 01:08:15 -0700
> > Antoine T=C3=A9nart <antoine.tenart@free-electrons.com> wrote:
> >
> >> Signed-off-by: Antoine T=C3=A9nart <antoine.tenart@free-electrons.=
com>
> >> ---
> >>   Documentation/devicetree/bindings/arm/cpus.txt | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt
> >> b/Documentation/devicetree/bindings/arm/cpus.txt index
> >> 333f4aea3029..a9e42a2dbc99 100644 ---
> >> a/Documentation/devicetree/bindings/arm/cpus.txt +++
> >> b/Documentation/devicetree/bindings/arm/cpus.txt @@ -185,6 +185,8 =
@@
> >> nodes to be present and contain the properties described below.
> >> "qcom,gcc-msm8660" "qcom,kpss-acc-v1"
> >>   			    "qcom,kpss-acc-v2"
> >> +			    "marvell,88de31-smp" - cpu-core handling for
> >
> > why not "marvell,berlin-smp"?
>=20
> We have SMP on the BG2 and the BG2Q currently. Future boards may not =
be=20
> compatible with this method (BG3 ?), I think "marvell,berlin-smp" is =
too=20

Yes. It's not compatible. But it will be PSCI. FWICT, current smp metho=
d
would be only used for BG2/BG2CT.

Thanks
