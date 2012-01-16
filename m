From: Stuart Yoder <b08248-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: multiple drivers for same hardware
Date: Mon, 16 Jan 2012 10:21:48 -0600
Message-ID: <CALRxmdDfL8L8BC2eJ89kuKRpoAhZVxbWLawgu37KQCakC+BrYQ@mail.gmail.com>
References: <316952FA-B163-46F8-B4B5-8CC0B97EAEB9@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <316952FA-B163-46F8-B4B5-8CC0B97EAEB9-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org Discuss" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 13, 2012 at 12:52 PM, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> We have some scenarios in which we might have 2 different drivers (one in kernel or one user space as an example) and wanted to see how we'd convey in the device tree which driver should "claim" the specific device instance.
>

I don't think we want to use the device tree for this, as this is
really configuration information.

The vfio user space driver model should solve this when it is implemented.

The basic approach with vfio will be something like:
    -a new kernel argument specifies a list of devices that the kernel
should leave alone and not bind to
    -in user space, you bind desired devices to vfio through sysfs
    -the vfio subsystem makes the bound devices available through /dev/vfio
    -user space can then mmap the devices, hook their interrupts, do
     iommu config,etc through file description operations

Stuart
