From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 0/3] Add fdt_unflatten_tree
Date: Wed, 17 Nov 2010 14:08:51 -0600
Message-ID: <C0C124ED-5091-4AEE-8D2A-F6E84F8678A8@kernel.crashing.org>
References: <5ca1cf50-4bc4-45ce-87d2-c499d981449b@VA3EHSMHS008.ehs.local>
Mime-Version: 1.0 (Apple Message framework v1081)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5ca1cf50-4bc4-45ce-87d2-c499d981449b-+Ck8Kgl/v0+siP+nND6G/7jjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Nov 17, 2010, at 1:15 PM, Stephen Neuendorffer wrote:

> 	Currently, fdt blobs are handled solely at boot time.  However,
> it may be useful to parse blobs into device trees after boot time.  For
> instance, a PCIe device may have an FPGA which includes a device
> tree.  This set of patches locally refactors the existing code to enable
> this.   The code has been compile-tested on X86 but has not been run in this
> version.  However, the patch is rather straightforward.
> 
> Stephen Neuendorffer (3):
>  fdt.c: Add non-boottime device tree functions
>  fdt.c: Refactor unflatten_dt_node
>  fdt.c: Refactor unflatten_device_tree and add fdt_unflatten_tree
> 
> drivers/of/fdt.c       |  393 +++++++++++++++++++++++++++++-------------------
> include/linux/of_fdt.h |   11 ++
> 2 files changed, 251 insertions(+), 153 deletions(-)

It would be really nice if we could factor some of the live tree code into a library.  I have some need for this in another context.

Not sure if we could actually build libfdt and link it into the kernel directly rather than what we do today.

- k
