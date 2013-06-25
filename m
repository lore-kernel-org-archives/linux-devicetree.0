From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC] early init and DT platform devices allocation/registration
Date: Tue, 25 Jun 2013 08:56:22 -0600
Message-ID: <51C9AF96.3040107@wwwdotorg.org>
References: <20130624163340.GB26084@e102568-lin.cambridge.arm.com>
 <CACxGe6sPaV-sBz=SF46KdUexjAhWKGrMpG_ty+K26f6ZU5iKdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACxGe6sPaV-sBz=SF46KdUexjAhWKGrMpG_ty+K26f6ZU5iKdg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/25/2013 05:45 AM, Grant Likely wrote:
> On Mon, Jun 24, 2013 at 5:33 PM, Lorenzo Pieralisi
> <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
>> Hi all,
>>
>> I am dealing with a lingering problem related to init and probing of platform
>> devices early (before initcalls) in the kernel boot process. The problem,
>> which is nothing new, is related to how platform devices are created in the
>> kernel from DT and when they become available. Platform devices are created
>> through (assuming any legacy static initialization is removed from the kernel)
>>
>> of_platform_populate()
>>
>> at arch_initcall time on ARM. This is a problem for drivers that need to be
>> probed and initialized before arch_initcall (ie early_initcall) because
>> the corresponding platform_device has not been created yet.

What's the use-case here; why does the driver /have/ to be
allocated/probed so early? Can't drivers all be allocated from DT in the
usual fashion, and any dependencies resolved using deferred probe? In
almost all cases, that should work.

...
>> How this problem is supposed to be solved in the kernel ?
>>
>> 1- drivers that are to be up and running at early_initcall time must not
>>    rely on the device/driver model (but then they cannot use any API that
>>    requires a struct device to function (eg regmap))
>> 2- the driver should allocate a platform device at early initcall from
>>    a DT compatible node. Do not know how to deal with platform device
>>    duplication though, since of_platform_populate() will create another
>>    platform device when the node is parsed
> 
> While I've resisted it in the past, I would be okay with adding struct
> device pointer in the device_node structure. I've resisted because I
> don't want drivers following the device_node pointer and making an
> assumption about what /kind/ of device is pointed to by it. However,
> this is an important use case and it makes it feasible to use an early
> platform device with of_platform_populate.

Hiroshi (who I have CC'd here) has also been asking about this same
issue downstream. The issue for us is that we need to initialize an SMMU
driver before any devices that are translated by the SMMU. One option is
to force the register/probe of the SMMU driver explicitly, early in the
machine's .init_machine() callback, before of_platform_populate(), to
ensure the ordering. Then, we run into the same duplicate device issue,
and the change Grant mentions above would help solve this.
