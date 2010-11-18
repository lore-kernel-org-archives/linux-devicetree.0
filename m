From: Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>
Subject: Re: [PATCH 3/3] x86: OLPC: speed up device tree creation during boot
	(v2)
Date: Thu, 18 Nov 2010 09:34:20 +0100
Message-ID: <20101118083420.GC26398@elte.hu>
References: <20101111214546.4e573cad@queued.net> <reply-olpc-3-v2@mdm.bga.com>
	<20101112002704.50c629e2@queued.net>
	<20101114095013.GB24206@elte.hu> <4CE0B54E.6000101@zytor.com>
	<20101115070254.GA25243@elte.hu> <4CE17133.2050101@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4CE17133.2050101-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Milton Miller <miltonm-ogEGBHC/i9Y@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


* H. Peter Anvin <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org> wrote:

> On 11/14/2010 11:02 PM, Ingo Molnar wrote:
> > 
> > * H. Peter Anvin <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org> wrote:
> > 
> >> What?  What is wrong with static variables in functions?  It really doesn't seem 
> >> to be a good idea to make them file-scope if they don't need to be.
> > 
> > They are very easy to overlook and mix up with regular stack variables and i've seen 
> > (and introduced myself) a number of bugs due to them.
> > 
> > They also often are used in buggy ways (with SMP not taken into consideration), so 
> > overlooking them during review compounds their negative effects. Putting them in 
> > front of the function isnt a big deal in exchange.
> > 
> > There are people who never overlook them (like yourself), but my brain is wired up 
> > differently.
> > 
> 
> However, I have to vehemently object to putting them in a wider scope
> than is otherwise necessary.  I agree that static variables should be
> used sparsely if at all (there really are vary few uses of them that are
> valid), but putting them in a larger scope screams "I'm used in more
> than one function", and that is *not* a good thing.

That's why we sometimes use the (imperfect) compromise to put them in front of that 
function, not at the top of the file.

Look at the general balance of hardship: very little harm is done (it's not a big 
deal if a variable is only used in a single function) but having it with local 
variables can be _really_ harmful - for example i overlooked them when i reviewed 
this patch. I dont like important details obscured - i like them to be apparent. 
Again, this is something that some people can parse immediately on the visual level 
- me and many others cannot.

Thanks,

	Ingo
