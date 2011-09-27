From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 3/3] dtc: Add support for variable sized cells
Date: Tue, 27 Sep 2011 10:58:21 +1000
Message-ID: <20110927005821.GB5361@yookeroo.fritz.box>
References: <1316800974-30129-1-git-send-email-robotboy@chromium.org>
	<1316800974-30129-4-git-send-email-robotboy@chromium.org>
	<20110925110454.GP12286@yookeroo.fritz.box>
	<CAF6FioUGZV4P10Z9A1U65bdue9Tqr5DyAV++z8ZyJDeLMXGWgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAF6FioUGZV4P10Z9A1U65bdue9Tqr5DyAV++z8ZyJDeLMXGWgA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 26, 2011 at 01:48:31PM -0700, Anton Staaf wrote:
> On Sun, Sep 25, 2011 at 4:04 AM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Fri, Sep 23, 2011 at 11:02:54AM -0700, Anton Staaf wrote:
> > =A0 =A0 =A0 =A01) Exactly what to call the keyword. =A0/bits/ is better=
 than
> > /size/, but I'd still like to stew a bit on it to see if we can come
> > up with anything better.
> =

> Sounds good.  I have a slight preference for /bits/ over something like
> /element-bits/ or /elementbits/.  But could be convinced if that was
> preferred.

I'm certainly leaning towards /bits/ in preference to those
alternatives, for the time being at least.

> > =A0 =A0 =A0 =A02) In the documentation and internal naming, we're using
> > the term "cell" ambiguously. =A0In the discussion of this extension
> > we've been using "cell" to mean one array element, which is fair
> > enough since it's more-or-less standard CS terminology. =A0However, in
> > previous FDT and OF terminology "cell" refers to an exactly 32-bit
> > quantity [well, to be exact OF old-timers say this isn't strictly
> > right in old OF-ese, but it's close enough to meaning that for most
> > purposes].
> > =A0 =A0 =A0 =A0So, I think we need to find a different name for array c=
ells
> > to clarify the terminology. =A0"elements" maybe?
> =

> The documentation all talks about arrays of cells.  Where as the source c=
ode
> always calls them lists of cells.  I agree that calling them cells once t=
hey are
> no longer fixed to 32-bits should be avoided.  One solution would be to r=
ename
> the non-terminal and semantic variables in the parser from celllistprefix=
 and
> celllist to arrayprefix and array respectively.  I would also change the =
error
> message about the size not being one of the supported sizes to say "eleme=
nt"
> instead of "cell".

That sounds good.

> I could likewise clean up the documentation so that the only mentions of =
the
> cell type were consistent with 32-bit cells.  In fact, reading over the
> documentation, it looks like a lot of the references to "cell array"
> can be turned
> into just "array", and the remaining references to "cell" can become "ele=
ment".
> =

> How does this sound?

Sounds good.  I'd perhaps add a explanatory note in there saying that
an array with element size 32-bits is a "list of cells", since many
existing bindings describe things in terms of x cells of this, y cells
of that and so forth.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
