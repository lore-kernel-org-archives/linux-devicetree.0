From: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6] MIPS: NI 169445 board support
Date: Mon, 7 Aug 2017 10:24:05 -0700
Message-ID: <11583742.zienCqJRO5@np-p-burton>
References: <1500402549-12090-1-git-send-email-nathan.sullivan@ni.com> <20170807152648.GA13214@linux-mips.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart10043099.6gJe9OrT0o";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170807152648.GA13214-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: Nathan Sullivan <nathan.sullivan-acOepvfBmUk@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--nextPart10043099.6gJe9OrT0o
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ralf,

On Monday, 7 August 2017 08:26:48 PDT Ralf Baechle wrote:
> On Tue, Jul 18, 2017 at 01:29:09PM -0500, Nathan Sullivan wrote:
> > diff --git a/arch/mips/generic/vmlinux.its.S
> > b/arch/mips/generic/vmlinux.its.S index f67fbf1..de851f7 100644
> > --- a/arch/mips/generic/vmlinux.its.S
> > +++ b/arch/mips/generic/vmlinux.its.S
> > @@ -29,3 +29,28 @@
> > 
> >  		};
> >  	
> >  	};
> >  
> >  };
> > 
> > +
> > +#ifdef CONFIG_FIT_IMAGE_FDT_NI169445
> > +/ {
> > +	images {
> 
> [...]
> 
> > +	};
> > +};
> > +#endif
> 
> There's been a reject on this file because of a Boston #ifdefed section.
> I've fixed that up but we need a cleaner solution.  Paul, any suggestions?
> 
>   Ralf

One possibility would be for us to split the board portions of vmlinux.its.S 
out into a file per-board, perhaps board-boston.its.S, board-ni169445.its.S 
etc. The build process would then have to concatenate the right files to 
generate the full image tree source.

Does that sound good to you?

Thanks,
    Paul
--nextPart10043099.6gJe9OrT0o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEELIGR03D5+Fg+69wPgiDZ+mk8HGUFAlmIojUACgkQgiDZ+mk8
HGVg3w/9Gucp7naDPxM6pNazBbP7jbzfMYX4UV5M6FiXifgLZxD4+C8jDBAnoMwM
zdv+UeaOsYmIfdrJyKIDQuALXXV/T8+BJ4nIXOkQUUVdhKaTzNWKd7XHFRwkn1sO
6RxvayxXtOVGgEv+HrsIFEEybA1DgY+SHp1sqMiA+VI2ms+p3tCaE5qtjPF7rVDL
XW7FX1HtQK3RqHg2Pt0jN8BH2bcy6hwvPBt1i7ke1EfoDXLAOZML4oVc8pjyWmV0
O1ppDavAXICy9BIsDAeLZxvyBOom9klXv3s+riHrGbOmiON9uqLFVezUiS4/zpgJ
UQjlyY1IEUBxVqlruOl9iJzTw33PWBod2MPlDtfc9CbhKRvzlX+19C2ePHp+GVxl
WQYuZ1kf9jhsLedF3XKEGbHYFR3CmEvIUfMo1oEZQtWmFQVUuqM9RdmCZm4r4QUw
+7vR7za4B2V1cOdbVxz8idBwFMJWLV+hP4GPvZFtfKzX6n/N8L4wKroomCO4kPw9
quVpYC2XmeKiQFryJCbq2Wgcsdv3XUiKsEUDBtcp6rewub4dLzL1spJZmcqU48lS
KlXnFY1ZQrQWDGurayimJ8kcS68FDur7eruw6KiI+d+wMdO7a3WwcCk1LVktjoEB
EACE87X74TnlfFqPDVwQZiwkHu5jzMf+yWiw2V0CIrpKn8OAQ68=
=gnJ0
-----END PGP SIGNATURE-----

--nextPart10043099.6gJe9OrT0o--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
