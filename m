From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: RFC: ARM Boot standard for passing device tree blob
Date: Thu, 25 Mar 2010 21:24:53 -0600
Message-ID: <fa686aa41003252024x30e3c041pf32fcb8b746f1faa@mail.gmail.com>
References: <fa686aa41003240811l6f40c8cfs6fdad496facdc089@mail.gmail.com>
	<20100325210409.GH24984@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100325210409.GH24984-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Philippe Robin <Philippe.Robin-5wv7dgnIgG8@public.gmane.org>, David Rusling <David.Rusling-5wv7dgnIgG8@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Dave P Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 25, 2010 at 3:04 PM, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Wed, Mar 24, 2010 at 09:11:56AM -0600, Grant Likely wrote:
>> =3D=3D=3DRequired System State=3D=3D=3D
>> *Quiesce all DMA
>> *CPU register contents
>> **r0 =3D 0
>> **r1 =3D Linux machine number (as defined in the ARM Linux machine datab=
ase) or 0
>
> 0 is a valid machine number. =A0What is your purpose of passing 0?

Heh, I forgot to go back and check if 0 was assigned or not.  I just
wanted something that wasn't going to conflict.  How about 0xffffffff
like Jeremy has been using?

>> **r2 =3D physical address of tagged parameter list in system RAM
>> *IRQs disabled
>> *MMU off
>> *Instruction cache either on or off
>> *Data cache turned off
>
> Would recommend saying "Data cache(s) turned off" so that L2 cache is
> included.

done.

>> =3D=3D=3DMinimal state for Flattened Device Tree Boot=3D=3D=3D
>> For FDT booting, the tagged list only needs to contain a single device
>> tree tag, and the device tree blob could be appended to the end of the
>> tagged list so that everything resides in the same region of memory.
>
> That's a bad idea. =A0Sometimes the tagged list can be extended by wrappe=
rs
> around the kernel, and data placed at the end of the list would be
> overwritten.

Fair enough, I hadn't considered that.

Currently I'm handling the tree blob the same way ramdisks are handled
and waiting until after bootmem_init() to actually access the tree.
That works for the device registration code, but I still rely on the
machine id for probing platform code.  Jeremy has patches that can do
platform probing from device tree data, but last I talked to him it
required the blob to be in the same section of memory as the atags.
ie. between PHYS_BASE and PHYS_BASE+0x4000 IIRC.

> As the tagged list can encode arbitarily sized data chunks, there's no
> reason to use a pointer in the tagged list. =A0However, there is a proble=
m:
> what do you do with a large chunk of data in the tagged list? =A0You can't
> allocate memory to copy it in the kernel because no memory allocators
> are up and running...
>
> That's always been the catch-22 with passing binary data blobs to the
> kernel.

Indeed.  Another option I suppose is to extract the needed data from
the tree as part of the wrapper and squirt it into atags.  Then there
would be no problem in waiting until bootmem_init() to reserve the
devicetree memory.

Cheers,
g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
