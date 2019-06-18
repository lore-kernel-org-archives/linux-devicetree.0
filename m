From: Jean-Philippe Brucker <jean-philippe.brucker-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/8] iommu: Add I/O ASID allocator
Date: Tue, 18 Jun 2019 15:22:20 +0100
Message-ID: <13e19d8c-8918-a3bb-f398-2ac41c71d307@arm.com>
References: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
	<20190610184714.6786-2-jean-philippe.brucker@arm.com>
	<20190611103625.00001399@huawei.com>
	<62d1f310-0cba-4d55-0f16-68bba3c64927@arm.com>
	<20190611111333.425ce809@jacob-builder>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <20190611111333.425ce809@jacob-builder>
Content-Language: en-US
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Robin Murphy <Robin.Murphy-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/06/2019 19:13, Jacob Pan wrote:
>>>> +/**
>>>> + * ioasid_find - Find IOASID data
>>>> + * @set: the IOASID set
>>>> + * @ioasid: the IOASID to find
>>>> + * @getter: function to call on the found object
>>>> + *
>>>> + * The optional getter function allows to take a reference to the
>>>> found object
>>>> + * under the rcu lock. The function can also check if the object
>>>> is still valid:
>>>> + * if @getter returns false, then the object is invalid and NULL
>>>> is returned.
>>>> + *
>>>> + * If the IOASID has been allocated for this set, return the
>>>> private pointer
>>>> + * passed to ioasid_alloc. Private data can be NULL if not set.
>>>> Return an error
>>>> + * if the IOASID is not found or does not belong to the set.  
>>>
>>> Perhaps should make it clear that @set can be null.  
>>
>> Indeed. But I'm not sure allowing @set to be NULL is such a good idea,
>> because the data type associated to an ioasid depends on its set. For
>> example SVA will put an mm_struct in there, and auxiliary domains use
>> some structure private to the IOMMU domain.
>>
> I am not sure we need to count on @set to decipher data type. Whoever
> does the allocation and owns the IOASID should knows its own data type.
> My thought was that @set is only used to group IDs, permission check
> etc.
> 
>> Jacob, could me make @set mandatory, or do you see a use for a global
>> search? If @set is NULL, then callers can check if the return pointer
>> is NULL, but will run into trouble if they try to dereference it.
>>
> A global search use case can be for PRQ. IOMMU driver gets a IOASID
> (first interrupt then retrieve from a queue), it has no idea which
> @set it belongs to. But the data types are the same for all IOASIDs
> used by the IOMMU.

They aren't when we use a generic SVA handler. Following a call to
iommu_sva_bind_device(), iommu-sva.c allocates an IOASID and store an
mm_struct. If auxiliary domains are also enabled for the device,
following a call to iommu_aux_attach_device() the IOMMU driver allocates
an IOASID and stores some private object.

Now for example the IOMMU driver receives a PPR and calls ioasid_find()
with @set = NULL. ioasid_find() may return either an mm_struct or a
private object, and the driver cannot know which it is so the returned
value is unusable.

Thanks,
Jean
