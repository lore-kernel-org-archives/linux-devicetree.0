From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH V3 4/5] arm: mm: Added support for PJ4B cpu and init
 routines
Date: Mon, 19 Nov 2012 04:23:41 -0500
Message-ID: <20121119092341.GB22106@titan.lakedaemon.net>
References: <1352931637-3405-1-git-send-email-gregory.clement@free-electrons.com>
 <1352931637-3405-5-git-send-email-gregory.clement@free-electrons.com>
 <50A41BD3.9040509@free-electrons.com>
 <50A6B427.9080807@free-electrons.com>
 <20121119031210.GD22106@titan.lakedaemon.net>
 <20121119091912.GC3290@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121119091912.GC3290-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Ike Pan <ike.pan-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ian Molton <ian.molton-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, David Marlin <dmarlin-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jani Monoses <jani.monoses-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Dan Frazier <dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Eran Ben-Avi <benavi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Leif Lindholm <leif.lindholm-5wv7dgnIgG8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chris Van Hoof <vanhoof@canonica>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 19, 2012 at 09:19:12AM +0000, Russell King - ARM Linux wrote:
> On Sun, Nov 18, 2012 at 10:12:10PM -0500, Jason Cooper wrote:
> > On Fri, Nov 16, 2012 at 10:46:15PM +0100, Gregory CLEMENT wrote:
> > > On 11/14/2012 11:31 PM, Gregory CLEMENT wrote:
> > > > Hello Russell,
> > > > 
> > > > With the 2 changes I have done on according your comments
> > > > do you think you can give your acked-by for this patch?
> > > > 
> > > 
> > > Hello Russell,
> > > 
> > > I didn't have any feedback from you for this version.
> > > If you are fine with this, could you give your Acked-by?
> > > 
> > > 
> > 
> > Gregory,
> > 
> > >From the looks of things, Russell has his head wrapped around buggy
> > sound driver code for the CuBox.  Perhaps Will Deacon or Catalin Marinas
> > would care to weigh in?  I'm reluctant to take the series without an
> > Acked-By from at least one of them.
> 
> Well, I would like to say - it should go through my tree, as it's generic
> ARM changes, and as very little (even generic stuff) seems to come through
> my tree anymore.  But that's going to make the remainder of your patches
> difficult to merge.

We'd really appreciate it if we could take it with your Ack.  This
series and one more that depends on it are my only hold overs for v3.8.

thx,

Jason.
