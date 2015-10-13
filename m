From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 5/5] mfd: arizona: Update DT binding document for jack
 detection invert
Date: Tue, 13 Oct 2015 09:07:16 +0100
Message-ID: <20151013080716.GX17172@x1>
References: <1443803363-3251-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1443803363-3251-6-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20151005100105.GJ3243@x1>
 <20151012081526.GA8805@ck-lbox>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151012081526.GA8805@ck-lbox>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: cw00.choi@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, myungjoo.ham@samsung.com, broonie@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Mon, 12 Oct 2015, Charles Keepax wrote:

> On Mon, Oct 05, 2015 at 11:01:05AM +0100, Lee Jones wrote:
> > On Fri, 02 Oct 2015, Charles Keepax wrote:
> >=20
> > > Add additional binding for inverting the polarity of the detectio=
n on
> > > the jack detection pins.
> > >=20
> > > Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.co=
m>
> > > ---
> > >  Documentation/devicetree/bindings/mfd/arizona.txt |    2 ++
> > >  1 files changed, 2 insertions(+), 0 deletions(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/=
Documentation/devicetree/bindings/mfd/arizona.txt
> > > index b98a11b..ef59696 100644
> > > --- a/Documentation/devicetree/bindings/mfd/arizona.txt
> > > +++ b/Documentation/devicetree/bindings/mfd/arizona.txt
> > > @@ -73,6 +73,8 @@ Optional properties:
> > >      If this node is not mentioned or if the value is unknown, th=
en
> > >      headphone detection mode is set to HPDETL.
> > > =20
> > > +  - wlf,jd-invert : Invert the polarity of the jack detection sw=
itch
> > > +
> >=20
> > There are other jack detection properties in the bindings docs.
> >=20
> > Please generify.
>=20
> Apologies but not sure I follow what you want me to do here? Do
> you just want me to drop the wlf, prefix on this one?

I'm trying to avoid every vendor having their own audio jack
properties, when many of them have exactly the same function.

Please take a look at each of your bindings and make an informed
decision on which you think are unique to you and which you think
others can/will make use of.

Of course, if you have a unique requirement for a property and can
justify its existence, then it should be submitted with your vendor
prefix.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
