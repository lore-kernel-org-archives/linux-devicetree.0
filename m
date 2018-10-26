From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH 4/9] dt-bindings: Add ANX6345 DP/eDP
 transmitter binding
Date: Fri, 26 Oct 2018 08:08:43 +0800
Message-ID: <3E73AB92-AFD7-4DA6-AF42-725B894DE114@aosc.io>
References: <20181018073327.64942-1-icenowy@aosc.io> <1886367.eljNk7jKYl@avalon> <c68f0da9607805e1f6673a9a16a7dcfff4d8fe91.camel@aosc.io> <2778638.na8ndVNUfi@avalon> <f71d442412f31828c466e3483e9d42f5e96ddc1d.camel@aosc.io> <20181025183003.GA12672@bogus>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBGFWZHPAKGQE757E2UY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181025183003.GA12672@bogus>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B410=E6=9C=8826=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=882=
:30:03, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> =E5=86=99=E5=88=B0:
>On Thu, Oct 18, 2018 at 08:40:11PM +0800, Icenowy Zheng wrote:
>> =E5=9C=A8 2018-10-18=E5=9B=9B=E7=9A=84 14:23 +0300=EF=BC=8CLaurent Pinch=
art=E5=86=99=E9=81=93=EF=BC=9A
>> > Hi Icenowy,
>> >=20
>> > On Thursday, 18 October 2018 13:00:05 EEST Icenowy Zheng wrote:
>> > > =E5=9C=A8 2018-10-18=E5=9B=9B=E7=9A=84 11:53 +0300=EF=BC=8CLaurent P=
inchart=E5=86=99=E9=81=93=EF=BC=9A
>> > > > On Thursday, 18 October 2018 10:33:22 EEST Icenowy Zheng wrote:
>> > > > > The ANX6345 is an ultra-low power DisplayPort/eDP transmitter
>> > > > > designed
>> > > > > for portable devices.
>> > > > >=20
>> > > > > Add a binding document for it.
>> > > > >=20
>> > > > > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> > > > > ---
>> > > > >=20
>> > > > >  .../bindings/display/bridge/anx6345.txt       | 39
>> > > > > +++++++++++++++++++
>> > > > >=20
>> > > > >  1 file changed, 39 insertions(+)
>> > > > >  create mode 100644
>> > > > >=20
>> > > > > Documentation/devicetree/bindings/display/bridge/anx6345.txt
>> > > > >=20
>> > > > > diff --git
>> > > > >
>a/Documentation/devicetree/bindings/display/bridge/anx6345.txt
>> > > > >
>b/Documentation/devicetree/bindings/display/bridge/anx6345.txt
>> > > > > new
>> > > > > file
>> > > > > mode 100644
>> > > > > index 000000000000..0689d4eb5f65
>> > > > > --- /dev/null
>> > > > > +++
>> > > > >
>b/Documentation/devicetree/bindings/display/bridge/anx6345.txt
>> > > > > @@ -0,0 +1,39 @@
>> > > > > +Analogix ANX6345 eDP Transmitter
>> > > > > +--------------------------------
>> > > > > +
>> > > > > +The ANX6345 is an ultra-low power Full-HD eDP transmitter
>> > > > > designed
>> > > > > for
>> > > > > +portable devices.
>> > > > > +
>> > > > > +Required properties:
>> > > > > +
>> > > > > + - compatible		: "analogix,anx6345"
>> > > > > + - reg			: I2C address of the device
>> > > > > + - reset-gpios		: Which GPIO to use for reset
>> > > > > +
>> > > > > +Optional properties:
>> > > > > +
>> > > > > + - dvdd12-supply	: Regulator for 1.2V digital core
>> > > > > power.
>> > > > > + - dvdd25-supply	: Regulator for 2.5V digital core
>> > > > > power.
>> > > >=20
>> > > > Shouldn't these to supplies be mandatory ?
>> > >=20
>> > > Yes they should.
>> > >=20
>> > > > > + - panel-supply		: Regulator for the power of
>> > > > > the panel.
>> > > >=20
>> > > > Shouldn't the panel supply for specified in the DT node of the
>> > > > panel
>> > > > ?
>> > >=20
>> > > However, eDP panel can be probed, may vary on the same device,
>and
>> > > we
>> > > don't have a generic binding for it...
>> >=20
>> > Shouldn't we fix that ? :-)
>>=20
>> Maybe we should create a connector binding instead of a panel
>binding?
>
>There's not any such thing as a standard eDP connector, is there?=20
>Otherwise, that's just creating a generic panel binding in disguise.=20
>Maybe if eDP interface is standardized enough in terms of power
>control,=20
>control lines, EDID at least sometimes present, etc., then we could

eDP has the same display signal set with DP, including AUX which
carries DPCD and EDID (if present).

But I don't know whether other lines are standardized, including power, bac=
klight, etc.

>have=20
>some sort of generic eDP panel/connector binding.
>
>Rob
>
>_______________________________________________
>linux-arm-kernel mailing list
>linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
