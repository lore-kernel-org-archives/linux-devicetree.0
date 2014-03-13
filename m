From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 5/6] ARM: mvebu: Enable NAND controller in Armada
 385-DB
Date: Thu, 13 Mar 2014 17:04:10 -0300
Message-ID: <20140313200410.GA30590@arch.cereza>
References: <1394739542-30017-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1394739542-30017-6-git-send-email-ezequiel@vanguardiasur.com.ar>
 <53221AD4.3090002@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53221AD4.3090002-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Seif Mazareeb <seif-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mar 13, Sergei Shtylyov wrote:
> On 03/13/2014 10:39 PM, Ezequiel Garcia wrote:
>=20
> >From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>=20
> >The Armada 385-DB board has a NAND flash, so enable it in the
> >devicetree and add the partitions as prepared in the factory images.
>=20
> >Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >---
> >  arch/arm/boot/dts/armada-385-db.dts | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
>=20
> >diff --git a/arch/arm/boot/dts/armada-385-db.dts b/arch/arm/boot/dts=
/armada-385-db.dts
> >index 9a13642..edcf7ff 100644
> >--- a/arch/arm/boot/dts/armada-385-db.dts
> >+++ b/arch/arm/boot/dts/armada-385-db.dts
> >@@ -80,6 +80,27 @@
> >  					reg =3D <1>;
> >  				};
> >  			};
> >+
> >+			flash: flash@d0000 {
>=20
>    Note that you don't have to label your device the same way as it's=
 named,
> i.e. you could have labelled it "nand" if it would make things cleare=
r.

Right.

>    Although I don't readily see the value of labeling nodes in the bo=
ard's
> .dts file. Do you really expect to refer to it somewhere?
>=20

Yeah, I was thinking the same thing just after I sent this. No, I don't=
 think
we need the label.

--=20
Ezequiel Garc=EDa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
