From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/8] drivers/of: Make device tree code work on any arch.
Date: Fri, 16 Jul 2010 12:55:22 -0600
Message-ID: <AANLkTinfYfqmN70pUGIP7ji74okw1px3g9S78CSJyo9i@mail.gmail.com>
References: <1279304021-22216-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<592c6c35-556d-4874-8b75-2ebf0acf00e9@VA3EHSMHS011.ehs.local>
	<AANLkTimW3tsllx82F-cKtAEHGxVXwG4ESbtYWBzS17Wb@mail.gmail.com>
	<686f0008-74c9-4ee5-bfb3-b4920835b765@SG2EHSMHS005.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <686f0008-74c9-4ee5-bfb3-b4920835b765-RaUQJvECHitEus+KprP3J7jjLBE8jN/0@public.gmane.org>
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

On Fri, Jul 16, 2010 at 12:34 PM, Stephen Neuendorffer
<stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>
>
>> -----Original Message-----
>> From: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of Gr=
ant Likely
>> Sent: Friday, July 16, 2010 11:32 AM
>> To: Stephen Neuendorffer
>> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> Subject: Re: [PATCH 2/8] drivers/of: Make device tree code work on any a=
rch.
>>
>> On Fri, Jul 16, 2010 at 12:13 PM, Stephen Neuendorffer
>> <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>> > Signed-off-by: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>> >
>> > ---
>> >
>> > I'm not sure what the right way to abstract these functions is.
>> > of_node_to_nid seems specific to those platforms which have a root
>> > device tree. =A0pci_address_to_pio seems to probably have a useful
>> > implementation, but I'm not sure what it's trying to do. =A0Perhaps
>> > someone can shed some light?
>>
>> Right now I'm making each arch implement the pci_address_to_pio() and
>> of_node_to_nid() hooks. =A0Not sure if I'll retain that in the long
>> term. =A0pci_address_to_pio() will probably become common code
>> eventually.
>
> One thought that I had was to factor those archs/platforms that have a ro=
ot device tree
> (and probably have a useful of_node_to_nid), from those that don't. =A0Th=
is would also simplify
> some of the #ifdefs in drivers/of/fdt.c which pick out MICROBLAZE, POWERP=
C and SPARC for
> the early_device_tree stuff.

And what about the platforms that have both root and non-root device
trees?  This includes x86 by the way.  I've received patches to add
OLPC device tree support.  OLPC is currently x86, but the 1.75
hardware will be ARM.  Both run open firmware.

g.
