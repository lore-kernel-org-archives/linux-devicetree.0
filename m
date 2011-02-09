From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC PATCH] ARM: pmu: add OF match support
Date: Wed, 9 Feb 2011 10:10:58 -0700
Message-ID: <AANLkTinbPb6knNkhufXOc_LA8rX+bpGjuZvj1fr9Y4cU@mail.gmail.com>
References: <1297223617-19173-1-git-send-email-robherring2@gmail.com>
	<4D529E82.1000102@gmail.com> <4D52C6EA.1030600@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4D52C6EA.1030600-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 9, 2011 at 9:55 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Grant,
>
> On 02/09/2011 08:02 AM, Rob Herring wrote:
>>
>> Will,
>>
>> On 02/09/2011 03:51 AM, Will Deacon wrote:
>>>
>>> Hi Rob,
>>>
>>>> Add OF match table to enable OF style driver binding. The dts entry
>>>> is like
>>>> this:
>>>>
>>>> pmu {
>>>> compatible =3D "arm,pmu";
>>>> interrupts =3D<100 101>;
>>>> };
>>>>
>>>> The use of pdev->id as an index breaks with OF device binding. Change
>>>> to use
>>>> a counter instead. If more than 1 pmu device is ever really supported,=
 a
>>>> better solution to match users with particular pmu is probably needed.
>>>
>>> We will want to support multiple PMU devices in the near future but
>>> this is currently blocked on userspace issues. One such device would
>>> be the event counters on the PL310, which could be used to complement
>>> the CPU PMU on the Cortex-A9.
>>>
>>> I don't like the idea of a counter as it forces platforms to register
>>> their devices in a specific order. Is it possible to separate different
>>> types of PMU in the device tree and then have pmu.c work out what to do
>>> with them?
>>
>> Yes, they are easily distinguished by the compatible strings. Adding a
>> pmu_get function which returns the device based on a string or
>> capabilities may be a better solution. If you had 2 pmu's of the same
>> type, the current code would break.
>>
>> In any case, how about this:
>>
>> static int __devinit pmu_device_probe(struct platform_device *pdev)
>> {
>> enum arm_pmu_type type =3D pdev->id;
>>
>> if (of_device_is_compatible(pdev->dev.of_node, "arm,pmu"))
>> type =3D ARM_PMU_DEVICE_CPU;
>
> Actually, this needs to be:
>
> #ifdef CONFIG_OF
> =A0 =A0 =A0 =A0if (of_device_is_compatible(pdev->dev.of_node, "arm,pmu"))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0type =3D ARM_PMU_DEVICE_CPU;
> #endif
>
> Seems fixing the struct device conditional is just the tip of the iceberg.
> Should we do empty functions for all driver accessed OF functions?

Usually all of the dt parsing code can be shuffled off into another
function that can be #ifdef/#else/#endif away, but there is always a
few functions that need to have empty implementations when CONFIG_OF
is disabled.  I prefer to take it on a case-by-case basis.

The #ifdef around dev->of_node is going away in 2.6.39

g.
