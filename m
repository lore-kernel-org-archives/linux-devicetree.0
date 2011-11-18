From: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Best practice for compatible strings?
Date: Fri, 18 Nov 2011 10:23:44 +0000
Message-ID: <20111118102320.GA2071@localhost.localdomain>
References: <20111117182543.GD3044@localhost.localdomain>
 <4EC5566C.4030508@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4EC5566C.4030508-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 17, 2011 at 08:46:04AM -1000, Mitch Bradley wrote:
> As the original instigator of the generic names scheme, I can tell
> you what I had in mind.  That may not be the way things have
> evolved, but at least it's a data point.
> 
> The idea is that there are devices for which there are preexisting
> drivers.  Hardware designers often design new hardware that is
> compatible with older hardware so that the old driver can be used.
> The new hardware often has additional features that can be used with
> new drivers, but at least the device is basically functional with
> the old driver.
> 
> The point of a non-specific fallback entry in a compatible property
> is to match an old driver that is known to be present in some
> important extant version of an OS.
> 
> In the absence of a preexisting legacy programming model and the
> corresponding old driver, there isn't much point in trying to
> "invent" a non-specific name.  I suppose that, theoretically, it
> might be possible to come up with a least-common-denominator
> programming model across a family of newly-designed devices, but
> that's not the way it usually works in practice, except in the case
> of a programming model defined by a standards committee.  More
> typically, a particular device gets some traction in the market, and
> then people copy that.
> 
> This model of driver evolution is more compelling for operating
> systems with a different development and distribution model than
> Linux's.  In the Linux world, it is hard to point to a specific
> shipping version and say "we must be compatible with that because it
> is what is already out there".
> 
> The bottom line:  In my opinion, if there is no preexisting driver
> that you can't change, there is little need for a non-specific name
> in the compatible list.

I think that answers my question -- in the absence of preexisting
drivers, a DT node would list the one compatible string exactly
identifying the device, and drivers list the compatible strings for
the devices they are known to support.

More generic compatible strings may be useful sometimes, but we
probably shouldn't have them by default when defining new bindings,
unless there's a compelling reason for it.

Does anyone feel uncomfortable with that?

Cheers
---Dave
