From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] dtc: Optionally sort nodes and properties
Date: Wed, 8 Sep 2010 22:49:25 -0600
Message-ID: <20100909044925.GB11833@angua.secretlab.ca>
References: <20100901024718.GA4828@yookeroo>
	<20100908202530.GH7065@angua.secretlab.ca>
	<20100908153952.43fbc856@schlenkerla.am.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100908153952.43fbc856-1MYqz8GpK7RekFaExTCHk1jVikpgYyvb5NbjCUgZEJk@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 08, 2010 at 03:39:52PM -0500, Scott Wood wrote:
> On Wed, 8 Sep 2010 14:25:30 -0600
> Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> 
> > On Wed, Sep 01, 2010 at 12:47:18PM +1000, David Gibson wrote:
> > > Hi folks,
> > > 
> > > Here's a patch I made for dtc a little while ago, and I'm not sure if
> > > it's something that sensibly ought to be merged into mainline dtc.
> > > 
> > > The patch adds a '-s' option to dtc, which causes it to "sort" the
> > > tree before output.  That is, it sorts the reserve entries, it sorts
> > > the properties within each node by name, and it sorts nodes by name
> > > within their parent.
> > > 
> > > The main use for this is when looking at the differences between two
> > > device trees which are similar, except for semantically null internal
> > > rearrangements.  Directly diffing the dts files will give a lot of
> > > noise due to the order changes, but running both trees through dtc -s
> > > then diffing will usually give a pretty sensible summary of the
> > > changes (it can still be confused by node name changes, of course).
> > 
> > As discussed on IRC, I'm not thrilled with adding this as a
> > user-visible option because sorted trees aren't actually useful or
> > desirable (and in some cases undesireable) except for the use-case of
> > comparing trees.  However, being able to compare unsorted trees is
> > still a use case that is very much needed, so I'm okay with this patch
> > until we come up with something better.
> > 
> > Although maybe the -s option should remain undocumented; or at least
> > warn people away from using it.
> 
> If it's undocumented, how would people find out how to compare device
> trees?

Comparing trees should be its own documented command.  If it happens
to be implemented as a shell script using this option, then that is
just fine by me.

What I don't want is people thinking that sorting their trees by
default is a good idea.  (Although the idea of randomly sorting trees
is vaguely interesting.  It would certainly expose all kinds of weird
bugs in the kernel where we depend on the natural sorting for driver
probe order)

> Maybe just add a "(for comparing trees)" note in the help text to
> clarify the intended purpose?

That's fine too.  It's not something worth debating a long time over.

g.
