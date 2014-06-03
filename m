From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of/base: Replace alias if it already exists
Date: Tue, 03 Jun 2014 23:54:41 +0100
Message-ID: <20140603225441.0FA79C4154B@trevor.secretlab.ca>
References: <1401624083-30796-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
	<20140602145959.7E669C426F6@trevor.secretlab.ca>
	<538CA125.7090906@gmail.com>
	<20140603085325.490A1C4096E@trevor.secretlab.ca>
	<538D9C42.9040707@gmail.com> <538E0144.1050700@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <538E0144.1050700-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ivaylo Dimitrov <ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 03 Jun 2014 20:09:24 +0300, Ivaylo Dimitrov <ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
> 
> On  3.06.2014 12:58, Ivaylo Dimitrov wrote:
> >
> >
> > On  3.06.2014 11:53, Grant Likely wrote:
> >
> [...] Can you try putting the following into your board dts file
> >> and see if it works?
> >>
> >> aliases {
> >>     i2c0;        /* Deactivate the old alias by making it blank */
> >>     i2c1 = &i2c1;
> >>     i2c2 = &i2c2;
> >>     i2c3 = &i2c3;
> >>     i2c4 = &i2c4;
> >>     i2c5 = &i2c5;
> >> };
> >>
> >> g.
> >>
> >
> > Will do, as soon as I get back home.
> >
> > Thanks,
> > Ivo
> 
> Seems to fix the problem (tested it with qemu), will send a proper patch.

Great, I'm glad it worked.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
