From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of: Have of_device_add call platform_device_add rather
 than device_add
Date: Thu, 22 Nov 2012 15:36:21 +0000
Message-ID: <20121122153621.452CA3E129E@localhost>
References: <20121121072448.GG19837@obsidianresearch.com>
 <20121121155104.726B83E0AE2@localhost>
 <20121121174453.GD6406@obsidianresearch.com>
 <CACxGe6u2Kfm+x5KsFzNPt7voyeD0x_4V6EO4add=tBwMKJ6VWQ@mail.gmail.com>
 <20121121181430.GE6406@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121121181430.GE6406-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
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
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 21 Nov 2012 11:14:30 -0700, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org> wrote:
> On Wed, Nov 21, 2012 at 06:07:46PM +0000, Grant Likely wrote:
> 
> > > Which is nesting the generic gpio driver under a larger region..
> > 
> > Try two sibling nodes with overlapping addresses. There are powerpc
> > device trees doing that even though it isn't legal by the ofw and
> > epapr specs.
> 
> Both my examples were using sibling nodes in the OF tree.
> 
> 	pex@e0000000 {
> 		device_type = "pci";
> 		ranges = <0x02000000 0x00000000 0x00000000  0xe0000000  0x0 0x8000000>;
> 		bus-range = <0x0 0xFF>;
> 		chip@0 {
> 			ranges = <0x02000000 0x00000000 0x00000000  0x02000000 0x00000000 0x00000000  0x0 0x8000000>;
> 			chip_control@0 {
> 				compatible = "orc,chip,control";
> 				assigned-addresses = <0x02000000 0x0 0x0  0x0 4096>;
> 			};
> 
> 			gpio3: chip_gpio@8 {
> 			        #gpio-cells = <2>;
> 				compatible = "linux,basic-mmio-gpio";
> 				gpio-controller;
> 				reg-names = "dat", "set", "dirin";
> 				assigned-addresses = <0x02000000 0x0 0x8  0x0 4>,
> 				                     <0x02000000 0x0 0xc  0x0 4>,
> 				                     <0x02000000 0x0 0x10  0x0 4>;
> 			};
> 
> Non-conformant yes, but it is the simplest way to get linux to bind
> two drivers to the same memory space.

Hmm... I've not tried it with assigned-address. I tried with two sibling
platform devices using just the 'reg' property. That the kernel will
complain about. For powerpc-only, the patch I posted allows the device
to get registered anyway even though the range incorrectly overlaps.

g.
