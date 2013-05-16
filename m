From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCHv9 7/9] pci: PCIe driver for Marvell Armada 370/XP systems
Date: Thu, 16 May 2013 16:18:27 -0400
Message-ID: <20130516201827.GA11137@titan.lakedaemon.net>
References: <1368624323-24311-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1368624323-24311-8-git-send-email-thomas.petazzoni@free-electrons.com>
 <20130516093312.GB2459@localhost>
 <20130516154031.GF6563@titan.lakedaemon.net>
 <20130516174903.3a7a07ef@skate>
 <20130516155617.GH6563@titan.lakedaemon.net>
 <20130516180850.3622e1a8@skate>
 <20130516161201.GI6563@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130516161201.GI6563-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
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
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Michael Opdenacker <michael.opdenacker-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 16, 2013 at 12:12:02PM -0400, Jason Cooper wrote:
> On Thu, May 16, 2013 at 06:08:50PM +0200, Thomas Petazzoni wrote:
> > Dear Jason Cooper,
> > 
> > On Thu, 16 May 2013 11:56:17 -0400, Jason Cooper wrote:
> > 
> > > > > > Building this showed a warning here. It seems you forgot
> > > > > > to mark this one as __init.
> > > > > 
> > > > > Thomas, I'll fix this up when I pull this in, no need to resend. :)
> > > > 
> > > > I'll resend, because beyond this function pointed by Ezequiel, there
> > > > are two other functions that can be marked __init. The one pointed by
> > > > Ezequiel is important because it causes a section mismatch
> > > > when !CONFIG_MODULES, because in this case platform_driver_probe() is
> > > > __init (and this explains what I wasn't seeing the warning, since I'm
> > > > building CONFIG_MODULES=y). The two other functions are more cosmetic,
> > > > but good to have as well.
> > > > 
> > > > It would already been sent if git hadn't decided to do a 'git gc' right
> > > > after my rebase. It's been gc-ing for quite some time now...
> > > 
> > > Dear boss,
> > > 
> > > I am in desperate need of a 500GB SSD on which to do my kernel work.
> > > 
> > > Thanks,
> > > 
> > > Kranky Kernel Developer
> > > 
> > > hehehe...
> > 
> > Adding boss in the Cc list :-)
> 
> Hey, whatever works for you.  Good luck!

Ok, you motivated me, I just ordered this one:

http://www.amazon.com/Crucial-512GB-2-5-Inch-9-5mm-CT512M4SSD2/dp/B004W2JL3Y

I'd've gone with Intel, but it ships in 2 to 5 weeks, and it costs 20%
more with comparable capacity.

thx,

Jason.
