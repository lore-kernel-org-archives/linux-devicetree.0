From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v4 06/12] memory: mvebu-devbus: Remove address decoding
 window workaround
Date: Wed, 19 Jun 2013 15:16:11 -0700
Message-ID: <20130619221611.GC9518@kroah.com>
References: <1371672446-21583-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1371672446-21583-7-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130619201805.GJ31667@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130619201805.GJ31667-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
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
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 19, 2013 at 04:18:05PM -0400, Jason Cooper wrote:
> On Wed, Jun 19, 2013 at 05:07:20PM -0300, Ezequiel Garcia wrote:
> > Now that mbus device tree binding has been introduced, remove the address
> > decoding window management from this driver.
> > A suitable 'ranges' entry should be added to the devbus-compatible node in
> > the device tree, as described by the mbus binding documentation.
> > 
> > Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> > Greg,
> > 
> > I'm Ccing you, since you're carrying the mvebu-devbus driver in your trees.
> > This patch should be applied only after the MBus DT binding is accepted
> > and/or merged; although I doubt we will see that happening any time soon.
> > 
> >  drivers/memory/mvebu-devbus.c | 64 ++-----------------------------------------
> >  1 file changed, 2 insertions(+), 62 deletions(-)
> 
> Since this MBus series is most likely for v3.12, Greg's tree will be
> merged by then.  At which time, we can decide if it's best to keep the
> series together or continue to send devbus changes through him.  I'm
> fine either way, and but I have a preference for keeping the series
> together.

Ok, I'll ignore this then, as it shouldn't go into 3.11, and I don't
have trees that go beyond that at this point in time.

thanks,

greg k-h
