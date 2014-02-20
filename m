From: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Subject: Re: devicetree repository separation/migration
Date: Thu, 20 Feb 2014 09:38:06 +0000
Message-ID: <1392889086.22494.24.camel@kazak.uk.xensource.com>
References: <20140217180544.GU7862@titan.lakedaemon.net>
	 <20140218155750.GS17250@pengutronix.de>
	 <20140218181854.GB7862@titan.lakedaemon.net>
	 <CAOesGMhvoB7vRf3H1kMaL5+MgZ2gJy=ZVNU0gsXVye9S4YGBOg@mail.gmail.com>
	 <CAOesGMi8zJXhfj46CLB-_Kk2s4MY9da46DhMoCtRj=zSUiuOGA@mail.gmail.com>
	 <CA+bK7J5+n2Se4cLv5WjR5B31ej7FdrGjPcjUULNrhb1UQ7=vmA@mail.gmail.com>
	 <20140219090854.GW17250@pengutronix.de> <53051102.8060801@gmail.com>
	 <CACxGe6uhA6FMR76WJGVEt44x6bQOC=woCkDr6ZUH30hTd8f2wA@mail.gmail.com>
	 <53058B69.4040502@gmail.com>
	 <CACxGe6ugF2_kzDPLdv-Z1LUnkX4DHq9R45o64kJHVBSQjWFiNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6ugF2_kzDPLdv-Z1LUnkX4DHq9R45o64kJHVBSQjWFiNg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Tim Bird <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2014-02-20 at 08:14 +0000, Grant Likely wrote:
> >> The other argument is shared source between
> >> BSD/U-Boot/Barebox/Linux/etc. Until we have a separate .dts repo there

                            ^/Xen ;-)

> >> is no good way to share the database of hardware descriptions.
> >
> > We could provide an easy export (see below).  What do you think?
> 
> Ian Campbell is already maintaining an export tree as a staging area
> for an eventual split. He's had it up and running for almost a year
> now:
> 
> http://xenbits.xen.org/gitweb/?p=people/ianc/device-tree-rebasing.git

NB, per the name it is potentially rebasing, effectively until if/when
it becomes the primary. In practice it hasn't been rebased since the
early days while I was sorting out the translations.

I've got an open action to move it somewhere other than xenbits,
probably git.kernel.org unless someone can supply a more neutral place.

WRT people wanting a more staged transition rather than a flag day: I
think I could tweaking things to rewrite each arch onto its own branch,
which could all be merged up into a single master branch. Then as $ARCH
moves over to using device.tree.git rather than linux.git as their
primary location for DTS we can simply drop the conversion for that
branch and start accepting patches onto master. I think doing anything
more fine-grained than per-arch would be tricky, at least to do
automagically.

Ian.



--
To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
