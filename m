From: Jakub Kicinski <jakub.kicinski@netronome.com>
Subject: Re: [PATCH] dt-bindings: net: dwmac: fix 'mac-mode' type
Date: Sat, 21 Sep 2019 11:46:24 -0700
Message-ID: <20190921114624.453e4b32@cakuba.netronome.com>
References: <20190917103052.13456-1-alexandru.ardelean@analog.com>
        <20190920181141.52cfee67@cakuba.netronome.com>
        <f189cdbc-b399-7700-a39a-ba185df4af49@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <f189cdbc-b399-7700-a39a-ba185df4af49@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Alexandru Ardelean <alexandru.ardelean@analog.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, peppe.cavallaro@st.com, alexandre.torgue@st.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

On Fri, 20 Sep 2019 20:02:58 -0700, Florian Fainelli wrote:
> On 9/20/2019 6:11 PM, Jakub Kicinski wrote:
> > On Tue, 17 Sep 2019 13:30:52 +0300, Alexandru Ardelean wrote: =20
> >> The 'mac-mode' property is similar to 'phy-mode' and 'phy-connection-t=
ype',
> >> which are enums of mode strings.
> >>
> >> The 'dwmac' driver supports almost all modes declared in the 'phy-mode'
> >> enum (except for 1 or 2). But in general, there may be a case where
> >> 'mac-mode' becomes more generic and is moved as part of phylib or netd=
ev.
> >>
> >> In any case, the 'mac-mode' field should be made an enum, and it also =
makes
> >> sense to just reference the 'phy-connection-type' from
> >> 'ethernet-controller.yaml'. That will also make it more future-proof f=
or new
> >> modes.
> >>
> >> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com> =20
> >=20
> > Applied, thank you!
> >=20
> > FWIW I had to add the Fixes tag by hand, either ozlabs patchwork or my
> > git-pw doesn't have the automagic handling there, yet. =20
>=20
> AFAICT the ozlabs patchwork instance does not do it, but if you have
> patchwork administrative rights (the jango administration panel I mean)
> then it is simple to add the regular expression to the list of tags that
> patchwork already recognized. Had tried getting that included by
> default, but it also counted all of those tags and therefore was not
> particularly fine grained:
>=20
> https://lists.ozlabs.org/pipermail/patchwork/2017-January/003910.html

Curious, it did seem to have counted the Fixes in the 'F' field on the
web UI but git-pw didn't pull it down =F0=9F=A4=94

linux$ git checkout 92974a1d006ad8b30d53047c70974c9e065eb7df
Note: checking out '92974a1d006ad8b30d53047c70974c9e065eb7df'.
[...]
linux$ git pw patch apply 1163199 --signoff
11:41 linux$ git show
commit ac964661384b93ff3c9839c6d56f293195d54b4e (HEAD)
Author: Alexandru Ardelean <alexandru.ardelean@analog.com>
Date:   Tue Sep 17 13:30:52 2019 +0300

    dt-bindings: net: dwmac: fix 'mac-mode' type
   =20
    The 'mac-mode' property is similar to 'phy-mode' and 'phy-connection-ty=
pe',
    which are enums of mode strings.
   =20
    The 'dwmac' driver supports almost all modes declared in the 'phy-mode'
    enum (except for 1 or 2). But in general, there may be a case where
    'mac-mode' becomes more generic and is moved as part of phylib or netde=
v.
   =20
    In any case, the 'mac-mode' field should be made an enum, and it also m=
akes
    sense to just reference the 'phy-connection-type' from
    'ethernet-controller.yaml'. That will also make it more future-proof fo=
r new
    modes.
   =20
    Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
    Reviewed-by: Andrew Lunn <andrew@lunn.ch>
    Reviewed-by: Rob Herring <robh@kernel.org>
    Signed-off-by: Jakub Kicinski <jakub.kicinski@netronome.com>

11:41 linux$=20
