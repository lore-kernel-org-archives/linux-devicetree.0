From: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 1/8] iommu: Add I/O ASID allocator
Date: Tue, 18 Jun 2019 10:05:08 -0700
Message-ID: <20190618100508.7835780f@jacob-builder>
References: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
	<20190610184714.6786-2-jean-philippe.brucker@arm.com>
	<20190611103625.00001399@huawei.com>
	<62d1f310-0cba-4d55-0f16-68bba3c64927@arm.com>
	<20190611111333.425ce809@jacob-builder>
	<13e19d8c-8918-a3bb-f398-2ac41c71d307@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <13e19d8c-8918-a3bb-f398-2ac41c71d307-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: Jean-Philippe Brucker <jean-philippe.brucker-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Robin Murphy <Robin.Murphy-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 18 Jun 2019 15:22:20 +0100
Jean-Philippe Brucker <jean-philippe.brucker-5wv7dgnIgG8@public.gmane.org> wrote:

> On 11/06/2019 19:13, Jacob Pan wrote:
> >>>> +/**
> >>>> + * ioasid_find - Find IOASID data
> >>>> + * @set: the IOASID set
> >>>> + * @ioasid: the IOASID to find
> >>>> + * @getter: function to call on the found object
> >>>> + *
> >>>> + * The optional getter function allows to take a reference to
> >>>> the found object
> >>>> + * under the rcu lock. The function can also check if the object
> >>>> is still valid:
> >>>> + * if @getter returns false, then the object is invalid and NULL
> >>>> is returned.
> >>>> + *
> >>>> + * If the IOASID has been allocated for this set, return the
> >>>> private pointer
> >>>> + * passed to ioasid_alloc. Private data can be NULL if not set.
> >>>> Return an error
> >>>> + * if the IOASID is not found or does not belong to the set.    
> >>>
> >>> Perhaps should make it clear that @set can be null.    
> >>
> >> Indeed. But I'm not sure allowing @set to be NULL is such a good
> >> idea, because the data type associated to an ioasid depends on its
> >> set. For example SVA will put an mm_struct in there, and auxiliary
> >> domains use some structure private to the IOMMU domain.
> >>  
> > I am not sure we need to count on @set to decipher data type.
> > Whoever does the allocation and owns the IOASID should knows its
> > own data type. My thought was that @set is only used to group IDs,
> > permission check etc.
> >   
> >> Jacob, could me make @set mandatory, or do you see a use for a
> >> global search? If @set is NULL, then callers can check if the
> >> return pointer is NULL, but will run into trouble if they try to
> >> dereference it. 
> > A global search use case can be for PRQ. IOMMU driver gets a IOASID
> > (first interrupt then retrieve from a queue), it has no idea which
> > @set it belongs to. But the data types are the same for all IOASIDs
> > used by the IOMMU.  
> 
> They aren't when we use a generic SVA handler. Following a call to
> iommu_sva_bind_device(), iommu-sva.c allocates an IOASID and store an
> mm_struct. If auxiliary domains are also enabled for the device,
> following a call to iommu_aux_attach_device() the IOMMU driver
> allocates an IOASID and stores some private object.
> 
> Now for example the IOMMU driver receives a PPR and calls
> ioasid_find() with @set = NULL. ioasid_find() may return either an
> mm_struct or a private object, and the driver cannot know which it is
> so the returned value is unusable.
I think we might have a misunderstanding of what ioasid_set is. Or i
have misused your original intention for it:) So my understanding of an
ioasid_set is to identify a sub set of IOASIDs that
1. shares the same data type
2. belongs to the same permission group, owner.

Our usage is #2., we put a mm_struct as the set to do permission
check. E.g VFIO can check guest PASID ownership based on QEMU process
mm. This will make sure IOASID allocated by one guest can only be used
by the same guest.

For IOASID used for sva bind, let it be native or guest sva, we always
have the same data type. Therefore, when page request handler gets
called to search with ioasid_find(), it knows its data type. An
additional flag will tell if it is a guest bind or native bind.

I was under the assumption that aux domain and its IOASID is a 1:1
mapping, there is no need for a search. Or even it needs to search, it
will be searched by the same caller that did the allocation, therefore
it knows what private data type is.

In addition, aux domain is used for request w/o PASID. And PPR for
request w/o PASID is not to be supported. So there would not be a need
to search from page request handler.

Now if we take the above assumption away, and use ioasid_set strictly
to differentiate the data types (Usage #1). Then I agree we can get
rid of NULL set and global search.

That would require we converge on the generic sva_bind for both
native and guest. The additional implication is that VFIO layer has to
be SVA struct aware in order to sanitize the mm_struct for guest bind.
i.e. check guest ownership by using QEMU process mm. Whereas we have
today, VFIO just use IOASID set as mm to check ownership, no need to
know the type.

Can we keep the NULL set for now and remove it __after__ we converge on
the sva bind flows?

Thanks,

Jacob
