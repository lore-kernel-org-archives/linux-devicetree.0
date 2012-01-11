From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH v2 REPOST] dtc: Add support for named integer constants
Date: Wed, 11 Jan 2012 08:38:28 -0600
Message-ID: <E1RkzJs-000590-4s@jdl.com>
References: <1323720257-23847-1-git-send-email-swarren@nvidia.com>
 <CAPnjgZ3Rnbu6qZponnbQ8bRgABb-58HG-yYSxRu2FZfvwPnMJw@mail.gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF1751860874@HQMAIL01.nvidia.com>
 <CAPnjgZ19s-O2m3CnrfSNLhg4hA61kKiwFym7pOTZ=C7kG+SVbA@mail.gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF17761F17D5@HQMAIL01.nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF177EE3A52D@HQMAIL01.nvidia.com>
 <20120111130056.GK4935@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20120111130056.GK4935-MK4v0fQdeXQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> On Tue, Jan 10, 2012 at 01:54:30PM -0800, Stephen Warren wrote:
> > John, David,
> > 
> > What can we do to reach consensus on expanding dtc to handle named
> > constants, or in general any future direction to extend the syntax with
> > expressions etc.?
> 
> Hrm, so, I'm not at all keen to add a named constant syntax without at
> least having an outline of what a future macro/function syntax would
> look like.

Which is where I thought it was left earlier...? :-)
And it's not just what the macro/function syntax will look like,
but also how these will play into a more generalized expression
handling mechanism.  Defining something one-off now that doesn't
fit well into a long term plan is less than ideal.

Yes, I know that is tantamount to requiring the whole, larger
picture be solved first.  But Dave is right -- at least an outline
of the direction.  Seriously, the lexical problems can form some
of the nastiest gotchas if we're not careful from the onset.

> The latter is almost certain to permit the former as a subcase, and
> I'd really rather not end up with two different syntaxes for
> constants.

Exactly.

> Unfortunately, much as I'd like to get all these extended features
> into dtc,

Agreed....

> > Will either of you be attending Linaro Connect or ELC 2012 in February
> > by any chance? We could get together and talk this through in person if
> > you are...
> 
> Not for me, I'm afraid.

Only if they are in Austin. :-)  Which is to say "Sorry, no."

jdl
