From: Blue Swirl <blauwirbel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Qemu-devel] [RFC PATCH 0/7] QEMU patches to generate FDT from
	qdevs
Date: Wed, 7 Apr 2010 22:10:28 +0300
Message-ID: <k2kf43fc5581004071210v810be251nf77b7ab469004e5c@mail.gmail.com>
References: <20100407040129.20274.44284.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100407040129.20274.44284.stgit@angua>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 4/7/10, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> Hi everyone,
>
>  This is an experimental set of patches for populating the flattened
>  device tree (fdt) data from the actual set of qdevs in the platform.
>  I'm not expecting this to get merged anytime soon, but I wanted to get
>  it out there to solicit comments.  My target for this is testing
>  device tree support on ARM.
>
>  The approach is by no means final, and there are still a number of
>  details to work out, but I've got it working well with the versatile
>  platform and I've got the kernel using fdt data to bind against the
>  smc91x device driver.  I'll be posting my associated kernel patches
>  real-soon-now.

It looks like the hook is only used to add some additional properties.
I think a data driven approach (fields in qdev structure) would be
simpler because the handling code would be only in qdev instead of all
devices.

Something like:
static SysBusDeviceInfo smc91c111_info = {
    .init = smc91c111_init1,
    .qdev.name  = "smc91c111",
    .qdev.size  = sizeof(smc91c111_state),
    .qdev.props = (Property[]) {
        DEFINE_NIC_PROPERTIES(smc91c111_state, conf),
        DEFINE_PROP_END_OF_LIST(),
    },
    .qdev.fdt_props = (FDTProperty[]) {
        DEFINE_FDT_NIC_MACADDR("local-mac-address", smc91c111_state,
conf.macaddr),
        DEFINE_FDT_PROP_STR("compatible", "smc,91c111"),
        DEFINE_FDT_PROP_END_OF_LIST(),
    }
};

A separate question is whether the properties should be visible to
user, for example shown by "info qdev". If yes, then the FDT
properties should be a special case of qdev properties:
    .qdev.props = (Property[]) {
        DEFINE_NIC_PROPERTIES(smc91c111_state, conf),
        DEFINE_FDT_NIC_MACADDR("local-mac-address", smc91c111_state,
conf.macaddr),
        DEFINE_FDT_PROP_STR("compatible", "smc,91c111"),
        DEFINE_PROP_END_OF_LIST(),
    }
