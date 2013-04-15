From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [U-Boot] dtb vs. kernel command line arguments
Date: Mon, 15 Apr 2013 14:37:18 +0100
Message-ID: <20130415133718.E5DEB3E0AA8@localhost>
References: <5134E855.7070908@cumulusnetworks.com>
 <20130304180323.80ef2597c60455f3a358bd79@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130304180323.80ef2597c60455f3a358bd79-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
To: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Curt Brune <curt-qUQiAmfTcIp+XZJcv9eMoEEOCMrvLtNR@public.gmane.org>
Cc: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 4 Mar 2013 18:03:23 -0600, Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> On Mon, 4 Mar 2013 10:30:45 -0800
> Curt Brune <curt-qUQiAmfTcIp+XZJcv9eMoEEOCMrvLtNR@public.gmane.org> wrote:
> 
> > Hello -
> > 
> > I want to pass a number of arguments from u-boot to the booted kernel. 
> > The arguments are needed by user space applications, not the kernel.
> > 
> > I can think of two ways:
> > 
> > 1. append args by setting "bootargs".
> > 2. add nodes to the dtb before booting.
> > 
> > Is there a preferred way to pass information like this?
> > 
> > Like I said the arguments are not needed by the kernel device drivers, 
> > but by user space applications.
> > 
> > I like the structure of nodes in the dtb.
> 
> please don't dual-purpose device trees as a mechanism of getting
> arguments through the kernel into userspace - device trees strictly
> describe the hardware.

Why not? The chosen node in particular is for software configuration. I
don't have any problem with passing U-Boot extra data through the chosen
node. Just don't go crazy and please document it.

g.
