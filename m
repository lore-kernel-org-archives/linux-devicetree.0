From: "David VomLehn (dvomlehn)" <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Subject: RE: [PATCH v2 REPOST] dtc: Add support for named integer constants
Date: Wed, 11 Jan 2012 16:10:52 -0600
Message-ID: <7A9214B0DEB2074FBCA688B30B04400D03AD6CD4@XMB-RCD-208.cisco.com>
References: <1323720257-23847-1-git-send-email-swarren@nvidia.com>
 <CAPnjgZ3Rnbu6qZponnbQ8bRgABb-58HG-yYSxRu2FZfvwPnMJw@mail.gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF1751860874@HQMAIL01.nvidia.com>
 <CAPnjgZ19s-O2m3CnrfSNLhg4hA61kKiwFym7pOTZ=C7kG+SVbA@mail.gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF17761F17D5@HQMAIL01.nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF177EE3A52D@HQMAIL01.nvidia.com>
 <20120111130056.GK4935@truffala.fritz.box> <E1RkzJs-000590-4s@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-class: urn:content-classes:message
In-Reply-To: <E1RkzJs-000590-4s-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Even if everyone can't make it, how about a BoF session at ELC 2012? I
haven't had any time to contribute recently, but am tremendously
interested in moving this forward.

> -----Original Message-----
> From: devicetree-discuss-bounces+dvomlehn=cisco.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>
[mailto:devicetree-discuss-bounces+dvomlehn=cisco.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org]
> On Behalf Of Jon Loeliger
> Sent: Wednesday, January 11, 2012 6:38 AM
> To: David Gibson
> Cc: Devicetree Discuss
> Subject: Re: [PATCH v2 REPOST] dtc: Add support for named integer
> constants
> 
> > On Tue, Jan 10, 2012 at 01:54:30PM -0800, Stephen Warren wrote:
> > > John, David,
> > >
> > > What can we do to reach consensus on expanding dtc to handle named
> > > constants, or in general any future direction to extend the syntax
> with
> > > expressions etc.?
> >
> > Hrm, so, I'm not at all keen to add a named constant syntax without
> at
> > least having an outline of what a future macro/function syntax would
> > look like.
> 
> Which is where I thought it was left earlier...? :-)
> And it's not just what the macro/function syntax will look like,
> but also how these will play into a more generalized expression
> handling mechanism.  Defining something one-off now that doesn't
> fit well into a long term plan is less than ideal.
> 
> Yes, I know that is tantamount to requiring the whole, larger
> picture be solved first.  But Dave is right -- at least an outline
> of the direction.  Seriously, the lexical problems can form some
> of the nastiest gotchas if we're not careful from the onset.
> 
> > The latter is almost certain to permit the former as a subcase, and
> > I'd really rather not end up with two different syntaxes for
> > constants.
> 
> Exactly.
> 
> > Unfortunately, much as I'd like to get all these extended features
> > into dtc,
> 
> Agreed....
> 
> > > Will either of you be attending Linaro Connect or ELC 2012 in
> February
> > > by any chance? We could get together and talk this through in
> person if
> > > you are...
> >
> > Not for me, I'm afraid.
> 
> Only if they are in Austin. :-)  Which is to say "Sorry, no."
> 
> jdl
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
