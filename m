From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [Qemu-devel] [RFC PATCH 0/7] QEMU patches to generate FDT from
	qdevs
Date: Wed, 7 Apr 2010 14:57:35 -0600
Message-ID: <k2mfa686aa41004071357gb91f70a9pba67cdf6c00f84b9@mail.gmail.com>
References: <20100407040129.20274.44284.stgit@angua>
	<k2kf43fc5581004071210v810be251nf77b7ab469004e5c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <k2kf43fc5581004071210v810be251nf77b7ab469004e5c-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Blue Swirl <blauwirbel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Thanks for the comments.  Replies below...

On Wed, Apr 7, 2010 at 1:10 PM, Blue Swirl <blauwirbel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 4/7/10, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>> Hi everyone,
>>
>> =A0This is an experimental set of patches for populating the flattened
>> =A0device tree (fdt) data from the actual set of qdevs in the platform.
>> =A0I'm not expecting this to get merged anytime soon, but I wanted to get
>> =A0it out there to solicit comments. =A0My target for this is testing
>> =A0device tree support on ARM.
>>
>> =A0The approach is by no means final, and there are still a number of
>> =A0details to work out, but I've got it working well with the versatile
>> =A0platform and I've got the kernel using fdt data to bind against the
>> =A0smc91x device driver. =A0I'll be posting my associated kernel patches
>> =A0real-soon-now.
>
> It looks like the hook is only used to add some additional properties.
> I think a data driven approach (fields in qdev structure) would be
> simpler because the handling code would be only in qdev instead of all
> devices.

Hmmm, maybe.  I don't really have a good answer yet as I'm still
experimenting.  It is possible that I'll need more complex behaviour
as I add new kinds of devices or for handling different bus types.
For example, right now I've got code to change the node name for mmio
devices, and that cannot be filled in until the register base is
defined and the best name format may be different for different
busses/devices.  I'm not familiar enough with qemu to know how best to
handle this with properties.

> Something like:
> static SysBusDeviceInfo smc91c111_info =3D {
> =A0 =A0.init =3D smc91c111_init1,
> =A0 =A0.qdev.name =A0=3D "smc91c111",
> =A0 =A0.qdev.size =A0=3D sizeof(smc91c111_state),
> =A0 =A0.qdev.props =3D (Property[]) {
> =A0 =A0 =A0 =A0DEFINE_NIC_PROPERTIES(smc91c111_state, conf),
> =A0 =A0 =A0 =A0DEFINE_PROP_END_OF_LIST(),
> =A0 =A0},
> =A0 =A0.qdev.fdt_props =3D (FDTProperty[]) {
> =A0 =A0 =A0 =A0DEFINE_FDT_NIC_MACADDR("local-mac-address", smc91c111_stat=
e,
> conf.macaddr),
> =A0 =A0 =A0 =A0DEFINE_FDT_PROP_STR("compatible", "smc,91c111"),
> =A0 =A0 =A0 =A0DEFINE_FDT_PROP_END_OF_LIST(),
> =A0 =A0}
> };
>
> A separate question is whether the properties should be visible to
> user, for example shown by "info qdev". If yes, then the FDT
> properties should be a special case of qdev properties:
> =A0 =A0.qdev.props =3D (Property[]) {
> =A0 =A0 =A0 =A0DEFINE_NIC_PROPERTIES(smc91c111_state, conf),
> =A0 =A0 =A0 =A0DEFINE_FDT_NIC_MACADDR("local-mac-address", smc91c111_stat=
e,
> conf.macaddr),
> =A0 =A0 =A0 =A0DEFINE_FDT_PROP_STR("compatible", "smc,91c111"),
> =A0 =A0 =A0 =A0DEFINE_PROP_END_OF_LIST(),
> =A0 =A0}

It would certainly be useful to see the device node(s) associated with a qd=
ev.

g.
