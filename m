From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCHv3] gpio-generic: add support for device tree probing
Date: Sun, 31 Jul 2011 16:22:14 +0100
Message-ID: <20110731151642.GA7094@pulham.picochip.com>
References: <1311936301-19942-1-git-send-email-jamie@jamieiles.com>
	<20110729162453.GH11164@ponder.secretlab.ca>
	<20110729164940.GB5585@pulham.picochip.com>
	<20110731030611.GC24334@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110731030611.GC24334-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jul 30, 2011 at 09:06:11PM -0600, Grant Likely wrote:
> On Fri, Jul 29, 2011 at 05:49:40PM +0100, Jamie Iles wrote:
> > On Fri, Jul 29, 2011 at 10:24:53AM -0600, Grant Likely wrote:
> > > I really do think that the compatible property can be dropped from the
> > > child nodes... although thinking further.  It doesn't have much value
> > > for specifying the exact controller, but maybe it should be used to
> > > specify the specific type of bank.  Right now the generic code uses a
> > > heuristic to figure out which set of accessor ops to use which strikes
> > > me as rather fragile.  I think it would be better to identify the
> > > major types of gpio controllers and name them.
> > 
> > I did think of doing this originally but I felt it could get a bit too 
> > unwieldy to describe all of the combinations (both in the compatible 
> > string and parsing code).  I guess in the driver we could have a list of 
> > templates that have a mask of the required registers for a given 
> > compatible string.
> 
> Yes, I was thinking along those lines.  The devil is in the
> implementation details of course.

OK.  I'll try prototyping something over the next couple of days but 
initially I was thinking something along the lines of a bitmask for all 
required registers for a given compatible string.  Then at probe time, 
for now just check that we have all of the required regoffset-* 
properties (and none that we shouldn't have).  We could still use the 
heuristics for working out the accessors for now but add accessors to 
the templates later if needed.

Jamie
