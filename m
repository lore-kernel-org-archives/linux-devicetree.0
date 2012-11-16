From: Bharat Reddy <bharat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH] of_i2c: I2C child node 10-bit client addressing
Date: Fri, 16 Nov 2012 18:42:23 +0530
Message-ID: <BLU002-W228A2064248B1A622AA97D6AC510@phx.gbl>
References: <1352972157-21299-1-git-send-email-bharat_404@hotmail.com>,
 <CACxGe6uSWy0-qZ3qYk5kfZzkxuyeZn0HMuzz+UU=6bGtGds1Hw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5332544189086656570=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACxGe6uSWy0-qZ3qYk5kfZzkxuyeZn0HMuzz+UU=6bGtGds1Hw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Bharat Reddy <bharat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>, "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============5332544189086656570==
Content-Type: multipart/alternative;
	boundary="_53def906-b7ee-41e2-8294-c8212500a066_"

--_53def906-b7ee-41e2-8294-c8212500a066_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I guess the I2C spec does not restricts.(A device to have an address that f=
its in the first 7 bits=2C but still requires 10 bit address transactions)

But I don't think their will be any I2C slave doing this.=20

Why a 7 bit slave want to have extra byte for every transaction?

Note: I am on vacation with limited e-mail access. I will be back on Nov 26=
.

Thanks=2C
-Bharat


> From: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
> Date: Thu=2C 15 Nov 2012 16:53:59 +0000
> Subject: Re: [PATCH] of_i2c: I2C child node 10-bit client addressing
> To: bharat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
> CC: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org=3B jochen-NIgtFMG+Po8@public.gmane.org=3B jonsmirl@gm=
ail.com
>=20
> On Thu=2C Nov 15=2C 2012 at 9:35 AM=2C  <bharat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> wrote:
> > From: Bharat Kumar Reddy <bharat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
> >
> > I2C clients which has 10 bit address=2C struct i2c_board_info=2C
> > member "flags =3D I2C_CLIENT_TEN" is needed.
> >
> > Signed-off-by: Bharat Kumar Reddy <bharat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
>=20
> Did you see my questions from yesterday?
>=20
> g.
>=20
> >
> > diff --git a/drivers/of/of_i2c.c b/drivers/of/of_i2c.c
> > index 3550f3b..28c5566 100644
> > --- a/drivers/of/of_i2c.c
> > +++ b/drivers/of/of_i2c.c
> > @@ -57=2C6 +57=2C10 @@ void of_i2c_register_devices(struct i2c_adapter =
*adap)
> >                         continue=3B
> >                 }
> >
> > +               /* Support for i2c 10 bit client address */
> > +               if ((info.addr > (1 << 7) - 1) && (info.addr <=3D (1 <<=
 10) - 1))
> > +                       info.flags =3D I2C_CLIENT_TEN=3B
> > +
> >                 info.irq =3D irq_of_parse_and_map(node=2C 0)=3B
> >                 info.of_node =3D of_node_get(node)=3B
> >                 info.archdata =3D &dev_ad=3B
> > --
> > 1.7.6
> >
> >
>=20
>=20
>=20
> --=20
> Grant Likely=2C B.Sc.=2C P.Eng.
> Secret Lab Technologies Ltd.
 		 	   		  =

--_53def906-b7ee-41e2-8294-c8212500a066_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<style><!--
.hmmessage P
{
margin:0px=3B
padding:0px
}
body.hmmessage
{
font-size: 12pt=3B
font-family:Calibri
}
--></style></head>
<body class=3D'hmmessage'><div dir=3D'ltr'>I guess the I2C spec does not re=
stricts.(A device to have an address that fits in the first 7 bits=2C but s=
till requires 10 bit address transactions)<br><br>But I don't think their w=
ill be any I2C slave doing this. <br><br>Why a 7 bit slave want to have ext=
ra byte for every transaction?<br><br>Note: I am on vacation with limited e=
-mail access. I will be back on Nov 26.<br><br>Thanks=2C<br>-Bharat<br><br>=
<br><div>&gt=3B From: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org<br>&gt=3B Date: Thu=2C 15 N=
ov 2012 16:53:59 +0000<br>&gt=3B Subject: Re: [PATCH] of_i2c: I2C child nod=
e 10-bit client addressing<br>&gt=3B To: bharat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org<br>&gt=3B C=
C: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org=3B jochen-NIgtFMG+Po8@public.gmane.org=3B jonsmirl@gmail=
.com<br>&gt=3B <br>&gt=3B On Thu=2C Nov 15=2C 2012 at 9:35 AM=2C  &lt=3Bbha=
rat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org&gt=3B wrote:<br>&gt=3B &gt=3B From: Bharat Kumar Reddy =
&lt=3Bbharat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org&gt=3B<br>&gt=3B &gt=3B<br>&gt=3B &gt=3B I2C cl=
ients which has 10 bit address=2C struct i2c_board_info=2C<br>&gt=3B &gt=3B=
 member "flags =3D I2C_CLIENT_TEN" is needed.<br>&gt=3B &gt=3B<br>&gt=3B &g=
t=3B Signed-off-by: Bharat Kumar Reddy &lt=3Bbharat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org&gt=3B<b=
r>&gt=3B <br>&gt=3B Did you see my questions from yesterday?<br>&gt=3B <br>=
&gt=3B g.<br>&gt=3B <br>&gt=3B &gt=3B<br>&gt=3B &gt=3B diff --git a/drivers=
/of/of_i2c.c b/drivers/of/of_i2c.c<br>&gt=3B &gt=3B index 3550f3b..28c5566 =
100644<br>&gt=3B &gt=3B --- a/drivers/of/of_i2c.c<br>&gt=3B &gt=3B +++ b/dr=
ivers/of/of_i2c.c<br>&gt=3B &gt=3B @@ -57=2C6 +57=2C10 @@ void of_i2c_regis=
ter_devices(struct i2c_adapter *adap)<br>&gt=3B &gt=3B                     =
    continue=3B<br>&gt=3B &gt=3B                 }<br>&gt=3B &gt=3B<br>&gt=
=3B &gt=3B +               /* Support for i2c 10 bit client address */<br>&=
gt=3B &gt=3B +               if ((info.addr &gt=3B (1 &lt=3B&lt=3B 7) - 1) =
&amp=3B&amp=3B (info.addr &lt=3B=3D (1 &lt=3B&lt=3B 10) - 1))<br>&gt=3B &gt=
=3B +                       info.flags =3D I2C_CLIENT_TEN=3B<br>&gt=3B &gt=
=3B +<br>&gt=3B &gt=3B                 info.irq =3D irq_of_parse_and_map(no=
de=2C 0)=3B<br>&gt=3B &gt=3B                 info.of_node =3D of_node_get(n=
ode)=3B<br>&gt=3B &gt=3B                 info.archdata =3D &amp=3Bdev_ad=3B=
<br>&gt=3B &gt=3B --<br>&gt=3B &gt=3B 1.7.6<br>&gt=3B &gt=3B<br>&gt=3B &gt=
=3B<br>&gt=3B <br>&gt=3B <br>&gt=3B <br>&gt=3B -- <br>&gt=3B Grant Likely=
=2C B.Sc.=2C P.Eng.<br>&gt=3B Secret Lab Technologies Ltd.<br></div> 		 	  =
 		  </div></body>
</html>=

--_53def906-b7ee-41e2-8294-c8212500a066_--

--===============5332544189086656570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5332544189086656570==--
