From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 0/3] Add fdt_unflatten_tree
Date: Wed, 17 Nov 2010 13:19:53 -0700
Message-ID: <AANLkTi=n-Un4KAmZp1wdYm4_8PMABMnP4cNYF_Ua+Q1V@mail.gmail.com>
References: <5ca1cf50-4bc4-45ce-87d2-c499d981449b@VA3EHSMHS008.ehs.local>
	<C0C124ED-5091-4AEE-8D2A-F6E84F8678A8@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <C0C124ED-5091-4AEE-8D2A-F6E84F8678A8-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 17, 2010 at 1:08 PM, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wro=
te:
>
> On Nov 17, 2010, at 1:15 PM, Stephen Neuendorffer wrote:
>
>> =A0 =A0 =A0 Currently, fdt blobs are handled solely at boot time. =A0How=
ever,
>> it may be useful to parse blobs into device trees after boot time. =A0For
>> instance, a PCIe device may have an FPGA which includes a device
>> tree. =A0This set of patches locally refactors the existing code to enab=
le
>> this. =A0 The code has been compile-tested on X86 but has not been run i=
n this
>> version. =A0However, the patch is rather straightforward.
>>
>> Stephen Neuendorffer (3):
>> =A0fdt.c: Add non-boottime device tree functions
>> =A0fdt.c: Refactor unflatten_dt_node
>> =A0fdt.c: Refactor unflatten_device_tree and add fdt_unflatten_tree
>>
>> drivers/of/fdt.c =A0 =A0 =A0 | =A0393 +++++++++++++++++++++++++++++-----=
--------------
>> include/linux/of_fdt.h | =A0 11 ++
>> 2 files changed, 251 insertions(+), 153 deletions(-)
>
> It would be really nice if we could factor some of the live tree code int=
o a library. =A0I have some need for this in another context.

I've got no problem with that if someone wants to do the legwork

> Not sure if we could actually build libfdt and link it into the kernel di=
rectly rather than what we do today.

No reason why not, but it would mean refactoring all of the early init stuf=
f.

g.
