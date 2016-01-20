From: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] MIPS: dts: tl_wr1043nd_v1: fix "aliases" node name
Date: Wed, 20 Jan 2016 18:22:59 +0300
Message-ID: <20160120182259.914f0e9be896bd2576391e3b@gmail.com>
References: <1452759657-7114-1-git-send-email-antonynpavlov@gmail.com>
	<56993EF5.9040008@gmail.com>
	<20160116080205.0b6e84c9e531b0cfd845b67b@gmail.com>
	<20160120004336.2b89a5f6@tock>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160120004336.2b89a5f6@tock>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban <albeu-GANU6spQydw@public.gmane.org>
Cc: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 20 Jan 2016 00:43:36 +0100
Alban <albeu-GANU6spQydw@public.gmane.org> wrote:

> On Sat, 16 Jan 2016 08:02:05 +0300
> Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>=20
> > On Fri, 15 Jan 2016 10:48:21 -0800
> > David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >=20
> > > On 01/14/2016 12:20 AM, Antony Pavlov wrote:
> > > > The correct name for aliases node is "aliases" not "alias".
> > > >
> > > > An overview of the "aliases" node usage can be found
> > > > on the device tree usage page at devicetree.org [1].
> > > >
> > > > Also please see chapter 3.3 ("Aliases node") of the ePAPR 1.1 [=
2].
> > > >
> > > > [1] http://devicetree.org/Device_Tree_Usage#aliases_Node
> > > > [2] https://www.power.org/documentation/epapr-version-1-1/
> > > >
> > > > Signed-off-by: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > > Cc: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
> > > > Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
> > > > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > > > ---
> > > >   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
> > > > b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts index
> > > > 003015a..4b6d38c 100644 ---
> > > > a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts +++
> > > > b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts @@ -9,7 +9,7=
 @@
> > > >   	compatible =3D "tplink,tl-wr1043nd-v1", "qca,ar9132";
> > > >   	model =3D "TP-Link TL-WR1043ND Version 1";
> > > >
> > > > -	alias {
> > > > +	aliases {
> > > >   		serial0 =3D "/ahb/apb/uart@18020000";
> > > >   	};
> > >=20
> > > What uses this alias?  If the answer is nothing (likely, as it wa=
s=20
> > > broken and nobody seems to have noticed), just remove the whole
> > > thing.
> >=20
> > I have used ar9132_tl_wr1043nd_v1.dts as a template for AR9331-base=
d
> > board dts-file. AR9331 uses it's own very special UART implementati=
on
> > (the ar933x_uart.c driver is used). ar933x_uart.c relies on alias a=
nd
> > does not work if alias is not set. I have not yet runned linux on
> > TL-WR1034ND, but I suppose that uart alias is not actually used for
> > TL-WR1034ND and this aliases node can be safely removed.
> >=20
> > Alban, have you any comments?
>=20
> David is right, we should just remove it.

Ok.

Several days ago I have got one TP-Link WR1043ND v1.8, so I can prepare
the patch, check it on my real hardware and then send it to the maillis=
t.

--=A0
Best regards,
=A0 Antony Pavlov
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
