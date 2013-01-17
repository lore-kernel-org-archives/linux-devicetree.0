From: Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>
Subject: Re: [U-Boot] [PATCH 1/5] treewide: include libfdt_env.h before fdt.h
Date: Thu, 17 Jan 2013 13:32:45 -0500
Message-ID: <50F843CD.1030309@cideas.com>
References: <20130116175904.47ee25bd2596f28796698759@freescale.com>
 <1358382963.18317.17@snotra>
 <20130117115456.71a38e3275230cdbb175bfe4@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130117115456.71a38e3275230cdbb175bfe4-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
To: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Scott, Kim, David,

On 01/17/2013 12:54 PM, Kim Phillips wrote:
> On Wed, 16 Jan 2013 18:36:03 -0600
> Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>
>> On 01/16/2013 05:59:04 PM, Kim Phillips wrote:
>>> and, if including libfdt.h which includes libfdt_env.h in
>>> the correct order, don't include fdt.h before libfdt.h.
>>>
>>> this is needed to get the fdt type definitions set from
>>> the project environment before fdt.h uses them.
>>>
>>> Signed-off-by: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>>> Cc: Jerry Van Baren <gvb.uboot-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> Maybe fdt.h should include libfdt_env.h?
>>
>> Or just always use libfdt.h as the public header.
>
> Was just following along the same lines as the dtc commits 38ad79d3
> "dtc/tests: don't include fdt.h prior to libfdt.h" and 20b866a7
> "dtc/fdtdump: include libfdt_env.h prior to fdt.h", acked by David
> G.  I don't know why some only include fdt.h.
>
> devicetree-discuss/David: is there a prescribed way to go here?
> Change all fdt.h includers to just always include libfdt.h instead
> of libfdt_env.h prior to fdt.h?

I started applying Kim's "sparse" patches to the u-boot source and ran 
into this issue pretty hard.

In u-boot, there is an added complexity that the "tools" (host-based 
u-boot support tools) support flattened device trees, but explicitly 
include the u-boot version of libfdt declarations so they don't fall out 
of sync if the host has a non-compatible libfdt version.  Having them 
out of sync would be a *horrible* situation to sort out - everything 
would build OK but nothing would work right, probably with no useful 
diagnostic information.  This originated in 2008, so life may be better 
nowadays.  Or maybe not.

I would be in favor of explicitly including all the *fdt* headers in the 
sources.  Alternately, Scott's suggestion of just including libfdt.h as 
the public header seems good, but I'm pretty sure it will mess me up 
with the explicit #including in the host-based "tools" build, leaving us 
with nasty work-arounds or a risk of hard to identify incompatible host 
vs. u-boot fdt versions.

Who Includes Who

fdt.h - no includes

fdt_support.h - (u-boot only file)
   29 #include <fdt.h>

libfdt.h
   54 #include <libfdt_env.h>
   55 #include <fdt.h>

libfdt_env.h
  - u-boot version is minimal, uses pre-existing macros for byte swapping
  - dtc version implements byte swapping, includes:
    4 #include <stddef.h>
    5 #include <stdint.h>
    6 #include <string.h>

libfdt_env.h is where Kim typedef'ed fdt16_t, fdt32_t, fdt64_t

I suspect the original intent was to have <libfdt.h> be the file that 
people #included.  For whatever reason, most includes are (picking on 
fdt_ro.c arbitrarily):
   51 #include "libfdt_env.h"
   53 #include <fdt.h>
   54 #include <libfdt.h>
Since libfdt.h #includes fdt.h and libfdt_env.h, lines 51 and 53 (above) 
are redundant.  It sorts out OK in dtc because libfdt_env.h includes 
stdint.h and defines fdt*_t, but it messes me up in u-boot where 
(currently) libfdt_env.h does *not* include stdint.h... and then things 
get really wonky in the u-boot "tools" directory due to the need to use 
the u-boot version of the *fdt*.h headers, not random stuff installed on 
the computer.

HTH,
gvb
