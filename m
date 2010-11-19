From: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 3/3] x86: OLPC: speed up device tree creation during
	boot (v2)
Date: Fri, 19 Nov 2010 12:24:12 -0800
Message-ID: <20101119122412.630da426@queued.net>
References: <20101111214546.4e573cad@queued.net> <reply-olpc-3-v2@mdm.bga.com>
	<20101112002704.50c629e2@queued.net>
	<20101114095013.GB24206@elte.hu> <4CE0B54E.6000101@zytor.com>
	<20101115070254.GA25243@elte.hu> <4CE17133.2050101@zytor.com>
	<20101118083420.GC26398@elte.hu>
	<1290078135.22575.4.camel@concordia> <4CE54064.6010702@zytor.com>
	<20101118094153.4515cbc2@queued.net> <4CE5670B.1060300@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4CE5670B.1060300-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Milton Miller <miltonm-ogEGBHC/i9Y@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 18 Nov 2010 09:48:59 -0800
"H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org> wrote:

> On 11/18/2010 09:41 AM, Andres Salomon wrote:
> >>
> >> No, sorry, this sounds like a personal preference that is well out
> >> of line with the vast majority of C programmers I've ever come
> >> across, not just in the Linux kernel world but outside of it.
> > 
> > 
> > This is actually one of the reasons I specifically like initialized
> > static variables (inside of functions).  Take the following code:
> > 
> > int foo(void)
> > {
> > 	static char *frob = NULL;
> > 	int p;
> > 
> > 	if (frob) {
> > 		...
> > 	}
> > 
> > 
> > Upon seeing that and thinking "whoa, how could frob be
> > initialized and then checked?", I realize that it's either a bug or
> > I look back at the initialization and realize that frob is static.
> > It's less obvious (to me) with non-explicit initialization.
> 
> I have to agree with this one.  In general I dislike relying on an
> implicit (even well-defined) initialized value; unfortunately we
> ripped out explicit initializations across the Linux kernel, not due
> to readability but due to the fact that long-since-obsolete versions
> of gcc would put explicitly-initialized variables in data rather than
> bss even if the initial value is zero.
> 
> 	-hpa
> 
> 

Note that I sent another update for this patch the other day
(Tuesday).  It uses implicit initialization.  Some Acks would be
awesome if folks are happy w/ the way I've done things..  ;)
