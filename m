From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Is registration of IRQ resources dependent on nodes order?
Date: Mon, 04 Mar 2013 12:30:37 +0800
Message-ID: <20130304043038.0ABBC3E17F8@localhost>
References: <5106C858.6090308@sysgo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5106C858.6090308-uSbOeAmDUekAvxtiuMwx3w@public.gmane.org>
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
To: Alexander Sverdlin <asv-uSbOeAmDUekAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 28 Jan 2013 19:50:00 +0100, Alexander Sverdlin <asv-uSbOeAmDUekAvxtiuMwx3w@public.gmane.org> wrote:
> Hello!
> 
> In our custom MIPS64 based project we are experiencing a problem with
> of_platform_populate() and in particular, how IRQ resources are added
> to the populated devices. In our device tree we have a chain of
> cascaded interrupt-controllers. Following Linux device-driver model we
> are trying to pair a driver of interrupt-controller with a
> platform_device that should be registered in of_platform_populate().
> This works fine, but unfortunately interrupt-generating devices that
> have this controller as interrupt-parent do not properly receive their
> IRQ resources in corresponding platform_device structures.

Hmm, yes that would be a problem.

> The unsuccessful sequence is as following:
> of_platform_populate() ->
> ...
> of_device_alloc() ->
> of_irq_to_resource_table() ->
> of_irq_to_resource() ->
> irq_of_parse_and_map() ->
> of_irq_map_one() -- this one seems to be ok, because operate only on
> device-tree, but the next one is irq_create_of_mapping(), which does
> the following:
> 
> 	domain = controller ? irq_find_host(controller) : irq_default_domain;
> 	if (!domain) {
> 		...
> 
> It might be (and in our case it is so), that there is no domain
> registered yet at this point, it was not populated yet by
> of_platform_populate() and therefore controller driver probe()
> function was not called.

Yes, that would be true. of_platform_populate() creates the
platform_devices (before initcalls), but probing happens much later at
initcall time. The interrupt controllers still need to be initialized
before the IRQ resources can be populated into creating platform
devices.

> Both ePAPR 1.1 and "Open Firmware Recommended Practice: Interrupt
> Mapping" do not specify the order how IRQ controller and those nodes
> that have it as interrupt-parent should follow each other.
> 
> DTB unflattening code can be changed and the order how nodes appear in
> the lists can change. of_platform_populate() must not depend on this
> order.
> 
> Am I missing something there? Or this is really a flaw in current
> irq_domains - of_* coupling code?  > Any ideas on the possible patch?
> Should irq_of_parse_and_map() or of_irq_map_one() first check if the
> corresponding controller node is already populated as platform_device
> and if not, do it?

DT order does not at all appear to be the problem here.  It really is a
matter that Linux currently expects all the irq numbers to be available
when registering platform devices, but when using DT the irq numbers are
unknown until an irq controller is registered. If the irq controller is
a platform_device, then initialization won't happen until way after
of_platform_populate() has completed.

Right now we work around this by using of_irq_init() which finds all the
irq controllers in the tree, sorts them by dependency order and
initializes as many of them as possible. However, this isn't the most
elegant solution and it completely fails any kind of hotplug for irq
controllers (a bit of a theoretical problem at the moment).

Ideally, I'd like to push DT resource resolution out to driver->probe()
time. We could do this by hooking into the platform_get_*() apis to
call out to DT irq and reg parse functions when the device does not have
a matching resource in the resources table. The only problem with this
is that there are a lot of drivers directly accessing the resources
structure instead of using the accessors. Those would need to be fixed
which is potentially a lot of work.

> Why it works for some existing code in Linux (everything abowe and
> below is from Linux 3.7):
> - some IRQ controller drivers register their irq_domain not in the
> probe function of the drivers, but in some platform init code (before
> device tree is populated)
> - many .dts files within Linux source tree have IRQ generating devices
> described before the controller thanks to some internal dtb-processing
> code properties, they appear in reverse order in resulting unflattened
> device tree, so that controller is populated before it's users

Population order really has no bearing on initialization order. In fact,
the bigest factor in determining probe order of devices is the link
order of drivers into the kernel.  :-)

g.

-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies, Ltd.
