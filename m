From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCHv10 2/9] of/pci: Provide support for parsing PCI DT
 ranges property
Date: Sun, 19 May 2013 16:31:56 -0400
Message-ID: <20130519203156.GO11137@titan.lakedaemon.net>
References: <1368719725-21265-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1368719725-21265-3-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1368719725-21265-3-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
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
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Murray <Andrew.Murray-5wv7dgnIgG8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, May 16, 2013 at 05:55:17PM +0200, Thomas Petazzoni wrote:
> From: Andrew Murray <Andrew.Murray-5wv7dgnIgG8@public.gmane.org>
> 
> This patch factors out common implementation patterns to reduce overall kernel
> code and provide a means for host bridge drivers to directly obtain struct
> resources from the DT's ranges property without relying on architecture specific
> DT handling. This will make it easier to write archiecture independent host bridge
> drivers and mitigate against further duplication of DT parsing code.
> 
> This patch can be used in the following way:
> 
> 	struct of_pci_range_parser parser;
> 	struct of_pci_range range;
> 
> 	if (of_pci_range_parser_init(&parser, np))
> 		; //no ranges property
> 
> 	for_each_of_pci_range(&parser, &range) {
> 
> 		/*
> 			directly access properties of the address range, e.g.:
> 			range.pci_space, range.pci_addr, range.cpu_addr,
> 			range.size, range.flags
> 
> 			alternatively obtain a struct resource, e.g.:
> 			struct resource res;
> 			of_pci_range_to_resource(&range, np, &res);
> 		*/
> 	}
> 
> Additionally the implementation takes care of adjacent ranges and merges them
> into a single range (as was the case with powerpc and microblaze).
> 
> Signed-off-by: Andrew Murray <Andrew.Murray-5wv7dgnIgG8@public.gmane.org>
> Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Reviewed-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Tested-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Tested-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Tested-by: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> ---
>  drivers/of/address.c       |   67 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/of_address.h |   48 +++++++++++++++++++++++++++++++
>  2 files changed, 115 insertions(+)

patches 2, 3, and 4 applied to mvebu/of_pci to facilitate others
(LinusW) basing their work off of it.

thx,

Jason.
