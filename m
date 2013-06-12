From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 04/14] bus: mvebu-mbus: Add static window allocation to
 the DT binding
Date: Wed, 12 Jun 2013 12:14:41 +0100
Message-ID: <20130612111441.E6D603E0A56@localhost>
References: <1370623671-7748-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20835253.Agl4DfuI3k@wuerfel> <20130611215023.GA12649@obsidianresearch.com>
 <4160363.LWJuHATm2F@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4160363.LWJuHATm2F@wuerfel>
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
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 12 Jun 2013 00:34:14 +0200, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Tuesday 11 June 2013 15:50:23 Jason Gunthorpe wrote:
> > So, I think we can/have agree that the ranges in the FDT should
> > reflect the bootloader's settings, and if the ranges is missing an
> > element it means the bootloader didn't set it up.
> > 
> > A compatible bootloader should dump the entire mbus register table
> > into the ranges. The address encoding is such that we can represent
> > every mbus window entry in ranges. If no bootloader support is present
> > then the ranges value is forced into the mbus windows anyhow.
> > 
> > If there isn't a ranges entry, but there is a child that requires it
> > (how do we figure this out?)
> 
> I think we have to walk the entire tree of devices underneath mbus,
> at least any device node that has a 'reg' property, following children
> of any device node with a 'ranges' property. We might need to
> add a variant of of_get_address() that does a partial translation
> up to a given node (the mbus) instead of all the way to the root.

I think we should have almost everything needed already to do this.
of_bus allows arbitrary mapping code to be used at any stage in the
translation. We might need to add some glue so that of_busses[] can
be assembled by the linker to allow an mbus of_bus stanza to live
outside of drivers/of/address.c
