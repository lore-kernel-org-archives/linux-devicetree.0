From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: question about dma-ranges
Date: Wed, 27 Oct 2010 08:51:16 +0800
Message-ID: <4CC77784.2070701@firmworks.com>
References: <9696D7A991D0824DBA8DFAC74A9C5FA306911C5F@az33exm25.fsl.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <9696D7A991D0824DBA8DFAC74A9C5FA306911C5F-ofAVchDyotYzzZk0BCvKg5jmvxFtTJ+o0e7PPNI6Mm0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

  It's probably unnecessary on modern machines, but old PCs were fairly restrictive about DMA addresses due to short 
counters.  The buses on which such restrictions applied are no longer at the root level, but they were once there...

On 10/27/2010 8:48 AM, Yoder Stuart-B08248 wrote:
> Mitch,
>
> In the dma-ranges proposal:
>
> http://playground.sun.com/1275/proposals/Closed/Accepted/410-it.txt
>
> ...there is the following special case described:
>
>     As a special case, a "dma-ranges" property may be present in the
>     root node of the device tree.  In this case, the property value
>     describes the ranges of DMA addresses that the system bus can
>     accept.  In this case, the length of the parent-address portion
>     of each entry in the property value is 0 (because the root node
>     has no parent), so the format reduces to...
>
> A few of us in the ePAPR committee were discussing this and
> were wondering what the use case for a dma-ranges on the
> root is.   Is this special case really needed?
>
> Thanks,
> Stuart Yoder
>
>
>
