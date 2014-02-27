From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] checkpatch: fix spurious vendor compatible warnings
Date: Thu, 27 Feb 2014 15:53:49 -0800
Message-ID: <1393545229.24588.147.camel@joe-AO722>
References: <1393531019-25134-1-git-send-email-florian.vaussard@epfl.ch>
	 <1393531808.24588.119.camel@joe-AO722> <530F9F03.40803@epfl.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <530F9F03.40803-p8DiymsW2f8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: florian.vaussard-p8DiymsW2f8@public.gmane.org
Cc: Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2014-02-27 at 21:24 +0100, Florian Vaussard wrote:
> On 02/27/2014 09:10 PM, Joe Perches wrote:
> > On Thu, 2014-02-27 at 20:56 +0100, Florian Vaussard wrote:
> >> With a compatible string like
> >> compatible =3D "foo";
> >> checkpatch will currently try to find "foo" in  vendor-prefixes.tx=
t,
> >> which is wrong since the vendor prefix is empty in this specific c=
ase.
[]
> > Some vendor names have dashes.
> > I don't know if underscores are allowed.
> >=20
> > $ grep -rP --include=3D*.[ch] -oh "compatible\s*=3D\s*\"[^,]+,\w" *=
 | \
> >   sed -r -e 's/\s//g' -e 's/,.$//' | sort | uniq -c | grep "[_-]"
> >       1 compatible=3D"active-semi
> >       8 compatible=3D"asahi-kasei
[]
> In ePAPR v1.1, I could not find any strict requirement. It
> is just saying:
>=20
> The recommended format is =E2=80=9Cmanufacturer,model=E2=80=9D, where=
 manufacturer is a
> string describing the name of the manufacturer (such as a stock ticke=
r
> symbol), and model specifies the model number.

Should there also be a check in .c and .h files for
	.compatible =3D "somestring"
and
	OF_DEV_AUXDATA("somestring",,,,)

?

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
