From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 2/3] dtc: Support character literals in cell lists
Date: Tue, 20 Sep 2011 10:59:31 +1000
Message-ID: <20110920005931.GB29197@yookeroo.fritz.box>
References: <1315595791-25793-1-git-send-email-robotboy@chromium.org>
	<1315595791-25793-3-git-send-email-robotboy@chromium.org>
	<20110912004437.GG9025@yookeroo.fritz.box>
	<E1R4y4v-0000Nf-5A@jdl.com>
	<20110919020034.GJ9025@yookeroo.fritz.box>
	<CAF6FioU5_uEh0fLyRBnD7DkPyo_UfjAaWxNONXSxDukpg3QPeg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAF6FioU5_uEh0fLyRBnD7DkPyo_UfjAaWxNONXSxDukpg3QPeg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anton Staaf <robotboy-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 19, 2011 at 09:45:34AM -0700, Anton Staaf wrote:
> On Sun, Sep 18, 2011 at 7:00 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Sat, Sep 17, 2011 at 11:49:21AM -0500, Jon Loeliger wrote:
> >> > On Fri, Sep 09, 2011 at 12:16:30PM -0700, Anton Staaf wrote:
> >> > > With this patch the following property assignment:
> >> > >
> >> > > =A0 =A0 property =3D <0x12345678 'a' '\r' 100>;
> >> > >
> >> > > is equivalent to:
> >> > >
> >> > > =A0 =A0 property =3D <0x12345678 0x00000061 0x0000000D 0x00000064>
> >> > >
> >> > > Signed-off-by: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> >
> >> > Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> >>
> >> So, I *think* we want to wait until the question of size
> >> is resolved some more, right? =A0Or, take this in any event
> >> as "without a type indicator they are all 32-bit values"?
> >
> > No this patch is fine to take without changing the cell size
> > semantics. =A0It's just that it becomes a lot more useful when we do get
> > those.
> =

> Yup, I'm working on a size patch by the way.  Any comments on my
> previous post about it would be helpful.  But in the mean time I'm
> going ahead with a solution where the current cell size is stored in
> the "struct data" type references are not allowed in cell lists of
> size other than 32 bits.

Ah, sorry, I meant to give comments on that earlier but got
sidetracked.

Storing the cell size in struct data doesn't really work - a single
property could be assembled from several cell lists of different
sizes.  By the time the reference substitution happens, they will have
been all merged into a single struct data.

I think prohibiting cell references anywhere but 32-bit cell lists is
the right approach, but we need to work out a way to do the check
during the parse phase.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
