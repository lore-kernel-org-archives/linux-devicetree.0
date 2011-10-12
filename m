From: Kumar Gala <kumar.gala-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] [v3] powerpc/85xx: clean up FPGA device tree nodes for
 Freecsale QorIQ boards
Date: Tue, 11 Oct 2011 23:53:15 -0500
Message-ID: <A52503AA-0708-4314-B8A1-3168EF963252@freescale.com>
References: <1316109853-6665-1-git-send-email-timur@freescale.com>
Mime-Version: 1.0 (Apple Message framework v1244.3)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1316109853-6665-1-git-send-email-timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Sep 15, 2011, at 1:04 PM, Timur Tabi wrote:

> Standarize and document the FPGA nodes used on Freescale QorIQ reference
> boards.  There are different kinds of FPGAs used on the boards, but
> only two are currently standard: "pixis", "ngpixis", and "qixis".  Although
> there are minor differences among the boards that have one kind of FPGA, most
> of the functionality is the same, so it makes sense to create common
> compatibility strings.
> 
> We also need to update the P1022DS platform file, because the compatible
> string for its PIXIS node has changed.  This means that older kernels are
> not compatible with newer device trees.  This is not a real problem, however,
> since that particular function doesn't work anyway.  When the DIU is active,
> the PIXIS is in "indirect mode", and so cannot be accessed as a memory-mapped
> device.
> 
> Signed-off-by: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> 
> v3: added "ngpixis" to list
> 
> v2: removed references to the CPLD
> 
> This patch only adds "ngpixis" nodes, because that's the easiest.  The
> P3060QDS device tree already has a qixis node.  Support for older boards
> with the old "pixis" will be added later.

applied

- k
