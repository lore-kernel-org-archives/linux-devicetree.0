From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Device tree flattening code not copying properties from blob
Date: Wed, 12 Jun 2013 17:02:40 +0100
Message-ID: <CACxGe6sdsXp0g9MJ2npupQedXpnge7kp_v=BqnErf+J6oXnyeg@mail.gmail.com>
References: <8BE8E6569B96CE4AA5EDE9F8314B7FB1EEF696@corpatsmail4.corp.sensis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <8BE8E6569B96CE4AA5EDE9F8314B7FB1EEF696-gEjpXB0kThW1wM3WIAwN2vV4jgPAACGKVpNB7YpNyf8@public.gmane.org>
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
To: "Collins, Rod" <Rod.Collins-eu1g02Y2shuDvotElmWtJA@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 12, 2013 at 3:32 PM, Collins, Rod
<Rod.Collins-eu1g02Y2shuDvotElmWtJA@public.gmane.org> wrote:
>
> I have been chasing a problem where a module device driver that uses the device tree I install, cannot find a compatible match when I know the device tree has the match for my driver.
>
> So I wrote a small module device driver that dumps the device tree information. I add it to the device driver list using insmod dtdump.ko. If I add the insmod to the start of the rc (using uCLinux distribution) file then I get the proper contents. If I add insmod at the end of the rc file then the device tree is bad.
>
> The problem is in the file fdt.c and the function unflatten_dt_node.
>
> When the unflattened tree is created the memory is allocated for the nodes and the property structures, however the pointers are just inserted into the property structure. The pointers are pointing in the memory area freed after initialization. This will work if the embedded __init memory is not freed but freeing this memory ends up with tree nodes that have invalid properties and thus the device tree is no good.

If your fdt blob is getting freed, then you've got a bug. How are you
loading the device tree? Normally the device tree is passed in from
the bootloader and the kernel marks the whole region as reserved.

> I am working on a fix to the unflatten_dt_node function. Allocate space for the property name and value and copy them in also as the node name is done.

unflatten_dt_node is actually doing the right thing. If the dt blob is
in an __init section, then it needs to be copied into non-init memory
before unflattening.

g.
