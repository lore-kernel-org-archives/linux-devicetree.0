From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 01/17] of/pci: Provide support for parsing PCI DT
 ranges property
Date: Fri, 22 Mar 2013 11:20:59 +0100
Message-ID: <20130322112059.35675858@skate>
References: <1363887025-19931-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1363887025-19931-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20130322101238.GA22929@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130322101238.GA22929-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
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
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Fri, 22 Mar 2013 11:12:39 +0100, Thierry Reding wrote:

> This sounds like you're trying to do too much within the for loop. When
> we discussed this previously I had a vague idea that this functionality
> could be wrapped into something a bit more object-like.
> 
> What I had in mind was something like:
> 
> 	struct of_pci_range_parser;
> 	struct of_pci_range;
> 
> 	struct of_pci_range_parser parser;
> 	struct of_pci_range range;
> 
> 	err = of_pci_range_parser(&parser, np);
> 	if (err < 0)
> 		return err;
> 
> 	for_each_of_pci_range(range, parser) {
> 		struct resource res;
> 
> 		...
> 		usage of range similar to iterator
> 		...
> 
> 		of_pci_range_to_resource(&res, &range);
> 	}
> 
> In the above the of_pci_range structure pretty much replaces the
> iterator and the whole is wrapped up within a parser structure to give
> some extra flexibility and provides for easier (or more structured)
> setup compared to doing all of it within the loop statement.
> 
> But aside from the (perceived?) increased robustness there's not a lot
> of technical benefit over your implementation, so it isn't a very hard
> objection. I find it to be a little more encapsulated and therefore
> easier to work with, but that's possibly just a matter of taste.

I don't have a strong opinion on this. Andrew, what do you think?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
