From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 03/12] bus: mvebu-mbus: Add static window allocation to
 the DT binding
Date: Tue, 18 Jun 2013 19:16:41 +0200
Message-ID: <201306181916.41378.arnd@arndb.de>
References: <1371554737-25319-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <201306181814.33941.arnd@arndb.de> <20130618191255.178d2f42@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130618191255.178d2f42@skate>
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
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 18 June 2013, Thomas Petazzoni wrote:
> Dear Arnd Bergmann,
> 
> On Tue, 18 Jun 2013 18:14:33 +0200, Arnd Bergmann wrote:
> 
> > Using 0xffff0002 as a placeholder for the pcie translation is definitely
> > better than 0xffff0000 as you had before, but let me ask again in case
> > you missed it the last time (and sorry if I missed the answer):
> > 
> > Why not just put the actual translation here the way it happens for each
> > of the PCIe ports? With the definition here, the PCIe driver actually has no
> > way to figure out what settings the windows need to use!
> 
> Come on Arnd, this is something we have already discussed countless
> times with you.
> 
> We cannot define translations for each PCIe port because we don't
> know in advance how much I/O and memory space each PCIe device will
> request. This is the reason why we have one global range for I/O
> space and one global space for memory space, that are given to the
> Linux PCI core, which then dynamically assigns sub-ranges for each
> PCIe device into those two global ranges.

Could you just stop assuming that I'm an idiot and read my suggestion?

The information that this puts into the device-tree is not where things
are mapped by how things are connected in hardware. The mbus mapping
is the part that is variable, while the PCI mapping is actually fixed
in hardware.

	Arnd
