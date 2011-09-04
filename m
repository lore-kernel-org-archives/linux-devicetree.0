From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/9] Add dtget utility to read property values from
	device tree
Date: Sun, 4 Sep 2011 21:14:48 +1000
Message-ID: <20110904111448.GA30278@yookeroo.fritz.box>
References: <1309892577-23828-1-git-send-email-sjg@chromium.org>
	<1309892577-23828-3-git-send-email-sjg@chromium.org>
	<20110719033437.GB6399@yookeroo.fritz.box>
	<CAPnjgZ3GgOx-Sja2Lq2WzYy+FYv3oyUF9vzdZ8RPYE-Hsmjf0Q@mail.gmail.com>
	<CAPnjgZ1mSifP1rSSCZgDCDQvd-PR3Q++Qr_TovJVPW_BrH3fgA@mail.gmail.com>
	<20110903143355.GB12965@yookeroo.fritz.box>
	<CAPnjgZ3hB_nfGqVA_4+wQfxuanUn7nhVQMboEFSODK0UvsNqmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPnjgZ3hB_nfGqVA_4+wQfxuanUn7nhVQMboEFSODK0UvsNqmg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Sep 03, 2011 at 08:18:08PM -0700, Simon Glass wrote:
> Hi David,
> =

> On Sat, Sep 3, 2011 at 7:33 AM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Fri, Sep 02, 2011 at 10:54:28AM -0700, Simon Glass wrote:
[snip]
> >> >> This is wrong. =A0properties do not have paths - they exist in a
> >> >> separate namespace to nodes. =A0The node path and property name sho=
uld
> >> >> be supplied as separate parameters. =A0As well as being actually ri=
ght,
> >> >> it will greatly simplify this function's convoluted logic.
> >> >
> >> > Well yes, but I feel that it makes it harder to use also. My thinking
> >> > with this was to try to make it easy to extract information. In my
> >> > view:
> >> >
> >> > /lcd/width
> >> >
> >> > is better than
> >> >
> >> > /lcd width
> >> >
> >> > But this is the kind of discussion / feedback I was hoping to get as=
 I
> >> > am new to device trees. My thoughts:
> >> >
> >> > 1. / is not generally used in property names so there is no conflict
> >> > 2. Neither is there any ambiguity
> >
> > Yes there is. =A0Real device trees exist where a node has both a
> > property and a subnode with the same name.
> =

> Er, ok. How about something like:
> =

> /path/to/node/.property
> =

> as a compromise? It removes the ambiguity I think, and still lets me

That's not a compromise, that's worse!

> avoid having 3 parameters in fdtput per assignment.

For pete's sake, just add the extra parameter.  It's the right way to
do it.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
