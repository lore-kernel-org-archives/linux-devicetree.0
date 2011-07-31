From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCHv3] gpio-generic: add support for device tree probing
Date: Sat, 30 Jul 2011 21:06:11 -0600
Message-ID: <20110731030611.GC24334@ponder.secretlab.ca>
References: <1311936301-19942-1-git-send-email-jamie@jamieiles.com>
	<20110729162453.GH11164@ponder.secretlab.ca>
	<20110729164940.GB5585@pulham.picochip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110729164940.GB5585-apL1N+EY0C9YtYNIL7UdTEEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 29, 2011 at 05:49:40PM +0100, Jamie Iles wrote:
> On Fri, Jul 29, 2011 at 10:24:53AM -0600, Grant Likely wrote:
> > I really do think that the compatible property can be dropped from the
> > child nodes... although thinking further.  It doesn't have much value
> > for specifying the exact controller, but maybe it should be used to
> > specify the specific type of bank.  Right now the generic code uses a
> > heuristic to figure out which set of accessor ops to use which strikes
> > me as rather fragile.  I think it would be better to identify the
> > major types of gpio controllers and name them.
> 
> I did think of doing this originally but I felt it could get a bit too 
> unwieldy to describe all of the combinations (both in the compatible 
> string and parsing code).  I guess in the driver we could have a list of 
> templates that have a mask of the required registers for a given 
> compatible string.

Yes, I was thinking along those lines.  The devil is in the
implementation details of course.

> 
> > > +- gpio-controller : Marks the node as a GPIO controller.
> > > +- #gpio-cells : Should be two.  The first cell is the pin number and the
> > > +  second cell encodes optional flags (currently unused).
> > 
> > I'm not /opposed/ to this binding, but there is an issue that I think
> > is worth raising.  From an engineer's perspective, multi-bank gpio
> > controllers are often documented as a single range of N gpios, even if
> > it is composed of M banks of x gpios (where N = M * x).  This means
> > that the documentation will specify an 'N' value for a gpio pin, but
> > the device tree will be a set of 'x' values against sub nodes.  I
> > think this will cause a lot of confusion.
> 
> and for controllers such as the Synopsys one, each bank may have a 
> different number of GPIO pins!

Heh.

> > Perhaps the gpio-controller property and #gpio-cells should be part of
> > the parent node.  The current Linux implementation doesn't easily
> > support doing it that way, but we can change the driver if it means a
> > better binding.
> > 
> > I'm not sure though.  Thoughts?
> 
> Personally I prefer it on a per-bank basis and that's how some of the 
> powerpc bindings do it so there's a precedent for doing it this way.  
> For controllers like the Synopsys one where banks can be different sizes 
> it makes it more explicit.  Otherwise one could make a sane (but 
> invalid) assumption that all banks are the width of the registers up to 
> the number of GPIO's.

True. If it is kept to be per-bank, then it also means that for each
controller, it will need to be well documented (ie. easy to find) how
gpio bindings line up with SoC documentation.

g.
