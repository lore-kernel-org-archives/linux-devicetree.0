From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of/base: Replace alias if it already exists
Date: Tue, 03 Jun 2014 09:53:25 +0100
Message-ID: <20140603085325.490A1C4096E@trevor.secretlab.ca>
References: <1401624083-30796-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
	<20140602145959.7E669C426F6@trevor.secretlab.ca>
	<538CA125.7090906@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <538CA125.7090906-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ivaylo Dimitrov <ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 02 Jun 2014 19:07:01 +0300, Ivaylo Dimitrov <ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
> 
> On  2.06.2014 17:59, Grant Likely wrote:
> > On Sun,  1 Jun 2014 15:01:23 +0300, Ivaylo Dimitrov <ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> The current code unconditionally adds aliases without check if it already
> >> exists, so it is not possible to alter an alias, from board DT file for
> >> example. Fix that by replacing an alias if it already exists
> >>
> >
> > Can you describe a more detailed use-case for altering an alias?
> >
> > g.
> >
> 
> That one http://www.spinics.net/lists/linux-omap/msg107869.html

So, if I understand correctly, the .dtsi file sets up aliases like so:

aliases {
	i2c0 = &i2c1;
	i2c1 = &i2c2;
	i2c2 = &i2c3;
	i2c3 = &i2c4;
	i2c4 = &i2c5;
};

and the board file does this:


aliases {
	i2c1 = &i2c1;
	i2c2 = &i2c2;
	i2c3 = &i2c3;
	i2c4 = &i2c4;
	i2c5 = &i2c5;
};

Which results in a dtb that looks like this:

aliases {
	i2c0 = &i2c1;
	i2c1 = &i2c1;
	i2c2 = &i2c2;
	i2c3 = &i2c3;
	i2c4 = &i2c4;
	i2c5 = &i2c5;
};

Do I understand correctly?

The way aliases works, it is completely valid to have multiple aliases
pointing at the same node. There are also no ordering guarantees about
which comes first, so though this patch might work for you at the
moment, there is no guarantee that it will continue to do so. If the
i2c0 alias is invalid for that platform, then it must be removed.

Unfortunately, the overlays have no mechanism for removing properties at
this time. Can you try putting the following into your board dts file
and see if it works?

aliases {
	i2c0;		/* Deactivate the old alias by making it blank */
	i2c1 = &i2c1;
	i2c2 = &i2c2;
	i2c3 = &i2c3;
	i2c4 = &i2c4;
	i2c5 = &i2c5;
};

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
