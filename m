From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 6/6] of/device: populate platform_device (of_device)
	resource table on allocation
Date: Tue, 8 Jun 2010 10:02:49 -0600
Message-ID: <AANLkTinZT4z93SWxjce5oRZzmaQHtVnO96zsXO9OX2UZ@mail.gmail.com>
References: <20100608142152.26088.1108.stgit@angua>
	<20100608142643.26088.61366.stgit@angua>
	<20100608155702.GA5419@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100608155702.GA5419-wnGakbxT3iijyJ0x5qLZdcN33GVbZNy3@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ben-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 8, 2010 at 9:57 AM, Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
> On Tue, Jun 08, 2010 at 08:26:43AM -0600, Grant Likely wrote:
> [...]
>> + =A0 =A0 dev =3D kzalloc(sizeof(*dev) + (sizeof(struct resource) * i), =
GFP_KERNEL);
>> =A0 =A0 =A0 if (!dev)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
>> -
>> =A0 =A0 =A0 dev->dev.of_node =3D of_node_get(np);
>> =A0 =A0 =A0 dev->dev.dma_mask =3D &dev->archdata.dma_mask;
>> =A0 =A0 =A0 dev->dev.parent =3D parent;
>> =A0 =A0 =A0 dev->dev.release =3D of_release_dev;
>>
>> + =A0 =A0 /* Populate the resource table */
>> + =A0 =A0 if (num_irq || num_reg) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev->resource =3D (void*)&dev[1];
>
> This is ugly. Why not allocate the memory specifically for
> dev->resource? Is this because you plan to get rid of
> of_release_dev(), and the generic release_dev() won't
> know if it should free the dev->resource? There must
> be a better way to handle this.

Allocating in one big block means less potential memory fragmentation,
and the kernel can free it all at once.  This is a common pattern.

> p.s.
>
> Just wonder what happened to of_gpio stuff? You blocked it
> in 2.6.34 for no reason saying "I'll pick it into my OF
> tree before the 2.6.35 merge window" and it's 2.6.36 merge
> window quite soon.

It's in my test-devicetree branch.  I'll be posting for 2nd review in
the next few days and then adding to my devicetree-next branch
probably before the end of the week.

g.
