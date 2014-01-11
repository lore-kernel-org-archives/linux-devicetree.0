From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: DT include files
Date: Sat, 11 Jan 2014 11:12:16 +0800
Message-ID: <20140111031214.GK21717@S2101-09.ap.freescale.net>
References: <20140103023211.GA25079@S2101-09.ap.freescale.net>
 <CAOesGMheei8YgzfRp9pmQ0rT9zhJ2_hF56j5Y+jLSy5TadPZ-g@mail.gmail.com>
 <20140103030455.GB25079@S2101-09.ap.freescale.net>
 <CAOesGMihX-pLva-aBCHJ6TYfsN57MzRWiYFTnfKCXOKeja0uUg@mail.gmail.com>
 <20140104011056.GA3282@S2101-09.ap.freescale.net>
 <20140110024124.GA6844@S2101-09.ap.freescale.net>
 <CAOesGMh3HBCYut2hfub3svrJT5JJzoWq8mU=VU0grZbg-JqqbA@mail.gmail.com>
 <52CFF57D.8060808@samsung.com>
 <CAL_JsqKHr6v+6kNXrAdnzH0gpoFCPAjPSnX8iBDgRSMh9JgxvA@mail.gmail.com>
 <CAOesGMhP5t=QHj7TdDY9Nq+=WHeQXv1V0n9TGmmEnqSG9SaFKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMhP5t=QHj7TdDY9Nq+=WHeQXv1V0n9TGmmEnqSG9SaFKg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 10, 2014 at 10:37:01AM -0800, Olof Johansson wrote:
> > On a side note, I'm not really a fan of this pattern:
> >
> > #define FOO1 1 2 3
> >
> > #define BAR FOO1 FOO2 FOO3
> >
> > While it definitely simplifies the dts files, it would never be used
> > in C and obfuscates what the actual property size is. Reading a dts
> > file, I would naturally assume the define was a single value while in
> > fact it could expand to a very large property size.
> 
> Hmm. Shawn?

What I read from Rob is that he does not like it but he does not hate it
so much either.  And that's probably why I did not get either ACK or
NACK from him when the usage was firstly introduced :)

While I agree such macro usage should be avoided or limited, it really
helps IMX pinctrl case to improve the readability and make the handwriting
of these pinctrl entries less error prone.  Isn't it the whole point of
introducing macro support for DTC?

Shawn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
