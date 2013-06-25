From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] early init and DT platform devices allocation/registration
Date: Tue, 25 Jun 2013 12:45:25 +0100
Message-ID: <CACxGe6sPaV-sBz=SF46KdUexjAhWKGrMpG_ty+K26f6ZU5iKdg@mail.gmail.com>
References: <20130624163340.GB26084@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130624163340.GB26084-7AyDDHkRsp3ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
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
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: "nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 24, 2013 at 5:33 PM, Lorenzo Pieralisi
<lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
> Hi all,
>
> I am dealing with a lingering problem related to init and probing of platform
> devices early (before initcalls) in the kernel boot process. The problem,
> which is nothing new, is related to how platform devices are created in the
> kernel from DT and when they become available. Platform devices are created
> through (assuming any legacy static initialization is removed from the kernel)
>
> of_platform_populate()
>
> at arch_initcall time on ARM. This is a problem for drivers that need to be
> probed and initialized before arch_initcall (ie early_initcall) because
> the corresponding platform_device has not been created yet.
>
> To work around this awkward situation, a driver, instead of relying on
> platform driver probing mechanism, can get initialized using early_initcall
> mechanism and rely on DT helpers (ie of_iomap() and company) to initialize
> resources. The problem comes when the driver functions must rely on an API
> (eg regmap) that requires a struct device to function properly; since the
> platform_device has not been created yet at early_initcall time, the
> driver cannot rely on it. The only solution consists in allocating a
> platform_device on the fly at driver init through
>
> of_platform_device_create()
>
> and use that device to initialize the (eg regmap) API. There is an issue
> with this solution, basically a platform device is allocated twice for
> a given device node - compatible property (because of_platform_populate()
> allocates a platform device for a node containing a compatible string even if
> a platform device has already been allocated for that device node).
>
> The second solution relies on early platform devices. Early platform devices
> are added by mach code and driver probing is carried out using the early
> platform device probing mechanism
>
> early_platform_driver_probe()
>
> The drawback with this solution is, AFAIK, it does not play well with DT,
> since the platform device duplication issue is still there (ie
> of_platform_populate() will allocate a platform device which is a duplicate
> of the one allocated at early boot to make the early platform device
> initialization possible).
>
> Please correct me if I am wrong, just trying to untangle a problem that does
> not look easy to solve.
>
> How this problem is supposed to be solved in the kernel ?
>
> 1- drivers that are to be up and running at early_initcall time must not
>    rely on the device/driver model (but then they cannot use any API that
>    requires a struct device to function (eg regmap))
> 2- the driver should allocate a platform device at early initcall from
>    a DT compatible node. Do not know how to deal with platform device
>    duplication though, since of_platform_populate() will create another
>    platform device when the node is parsed

While I've resisted it in the past, I would be okay with adding struct
device pointer in the device_node structure. I've resisted because I
don't want drivers following the device_node pointer and making an
assumption about what /kind/ of device is pointed to by it. However,
this is an important use case and it makes it feasible to use an early
platform device with of_platform_populate.

Alternately, if others chime in and think it is too risky to have the
device pointer in the device node, we could simply add a flag to the
device_node which indicates the node has been parsed by
of_platform_populate.

There would need to be some careful coding to make sure that any call
to early platform device creation sets the pointer in the device node
correctly.

I would also make it a requirement that any early platform device
*must* be converted into a 'real' platform device during initcall
time. That includes being possible to be freed correctly. Static early
platform device definitions should not be allowed, otherwise there
needs to be a special case for the platform device release hook. I
really don't want that.

Something else that needs to be investigated is how the device
hierarchy will be affected by using early_platform_device. We still
want the platform_device to appear in the same place in the hierarchy
regardless of whether or not it was created 'early'. the question is
how to make sure that actually happens.

> 3- driver should rely on early platform device/driver, but this does not
>    solve (?) the platform device duplication problem either, it will happen
>    when of_platform_populate() parses the DT and creates devices on the fly
>
> In theory there are other solutions such as:
>
> (a) declaring the platform device statically in arm/mach-* code and do not
>     define the device node in dts, basically going back in time to ARM legacy
>     kernel mechanism for this kind of devices

As stated above, no. Static device definitions are not a good idea,
and it doesn't scale in a multiplatform kernel world.

> (b) add a way to of_platform_populate() to exclude some compatible strings
>     from being matched

This method will probably be too error prone. It would be better to
add the check in of_platform_populate to skip nodes that have already
been populated. I can't think of any use-cases where we would want
of_platform_populate to process a single node more than once.

>
> Honestly there is not a solution I can say I like and maybe I am trying to
> solve a problem that has already been solved, apologies if so, that's why
> I am asking on the list to people with more knowledge than me on the subject.

No, it hasn't been solved yet, but it is worth solving. Either that or
figure out how to do of_platform_populate much earlier.

g.
