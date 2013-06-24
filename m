From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC] early init and DT platform devices allocation/registration
Date: Mon, 24 Jun 2013 17:33:40 +0100
Message-ID: <20130624163340.GB26084@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

I am dealing with a lingering problem related to init and probing of platform
devices early (before initcalls) in the kernel boot process. The problem,
which is nothing new, is related to how platform devices are created in the
kernel from DT and when they become available. Platform devices are created
through (assuming any legacy static initialization is removed from the kernel)

of_platform_populate()

at arch_initcall time on ARM. This is a problem for drivers that need to be
probed and initialized before arch_initcall (ie early_initcall) because
the corresponding platform_device has not been created yet.

To work around this awkward situation, a driver, instead of relying on
platform driver probing mechanism, can get initialized using early_initcall
mechanism and rely on DT helpers (ie of_iomap() and company) to initialize
resources. The problem comes when the driver functions must rely on an API
(eg regmap) that requires a struct device to function properly; since the
platform_device has not been created yet at early_initcall time, the
driver cannot rely on it. The only solution consists in allocating a
platform_device on the fly at driver init through

of_platform_device_create()

and use that device to initialize the (eg regmap) API. There is an issue
with this solution, basically a platform device is allocated twice for
a given device node - compatible property (because of_platform_populate()
allocates a platform device for a node containing a compatible string even if
a platform device has already been allocated for that device node).

The second solution relies on early platform devices. Early platform devices
are added by mach code and driver probing is carried out using the early
platform device probing mechanism

early_platform_driver_probe()

The drawback with this solution is, AFAIK, it does not play well with DT,
since the platform device duplication issue is still there (ie
of_platform_populate() will allocate a platform device which is a duplicate
of the one allocated at early boot to make the early platform device
initialization possible).

Please correct me if I am wrong, just trying to untangle a problem that does
not look easy to solve.

How this problem is supposed to be solved in the kernel ?

1- drivers that are to be up and running at early_initcall time must not
   rely on the device/driver model (but then they cannot use any API that
   requires a struct device to function (eg regmap))
2- the driver should allocate a platform device at early initcall from
   a DT compatible node. Do not know how to deal with platform device
   duplication though, since of_platform_populate() will create another
   platform device when the node is parsed
3- driver should rely on early platform device/driver, but this does not
   solve (?) the platform device duplication problem either, it will happen
   when of_platform_populate() parses the DT and creates devices on the fly

In theory there are other solutions such as:

(a) declaring the platform device statically in arm/mach-* code and do not
    define the device node in dts, basically going back in time to ARM legacy
    kernel mechanism for this kind of devices
(b) add a way to of_platform_populate() to exclude some compatible strings
    from being matched

Honestly there is not a solution I can say I like and maybe I am trying to
solve a problem that has already been solved, apologies if so, that's why
I am asking on the list to people with more knowledge than me on the subject.

Comments are really really welcome, thank you !
Lorenzo
