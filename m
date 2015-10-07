From: Andrew <andrew-g16cbSVCqPUdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC][PATCH 1/2] WIP: Devicetree bindings for Ion
Date: Wed, 07 Oct 2015 13:36:37 +0300
Message-ID: <f486f9f4f23c697f72e5ddcf49e38c9b@mail.ncrmnt.org>
References: <1444164433-9107-1-git-send-email-labbott@fedoraproject.org>
 <1444164433-9107-2-git-send-email-labbott@fedoraproject.org>
 <CAL_JsqJ+i3zC7UJ3BcdtOhdmQd8YnRC7bs3D2Ei5JD-4-C+A0g@mail.gmail.com>
 <561452D9.90605@labbott.name>
Reply-To: andrew-g16cbSVCqPUdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <561452D9.90605-0PSzFVTn/CLa5EbDDlwbIw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laura Abbott <laura-0PSzFVTn/CLa5EbDDlwbIw@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laura Abbott <labbott-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sumit Semwal <sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, arve-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Riley Andrews <riandrews-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tom Gall <tom.gall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, romlem-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Mitchel Humpherys <mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Feng Tang <feng.tang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, a.makarov-Y45fg4mVyCyHXe+LvDLADg@public.gmane.org, a.bogdanova-Y45fg4mVyCyHXe+LvDLADg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2015-10-07 02:01, Laura Abbott wrote:
> On 10/6/15 3:35 PM, Rob Herring wrote:
>> On Tue, Oct 6, 2015 at 3:47 PM, Laura Abbott 
>> <labbott-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org> wrote:
>>> From: Laura Abbott <laura-0PSzFVTn/CLa5EbDDlwbIw@public.gmane.org>
>>> 
>>> 
>>> This adds a base set of devicetree bindings for the Ion memory
>>> manager. This supports setting up the generic set of heaps and
>>> their properties.
>>> 
>>> Signed-off-by: Laura Abbott <laura-0PSzFVTn/CLa5EbDDlwbIw@public.gmane.org>
>>> Signed-off-by: Andrew Andrianov <andrew-g16cbSVCqPUdnm+yROfE0A@public.gmane.org>
>>> ---
>>>   drivers/staging/android/ion/devicetree.txt | 53 
>>> ++++++++++++++++++++++++++++++
>> 
>> I have no issue with this going in here, but I do have lots of issues
>> with this binding.
>> 
>>>   1 file changed, 53 insertions(+)
>>>   create mode 100644 drivers/staging/android/ion/devicetree.txt
>>> 
>>> diff --git a/drivers/staging/android/ion/devicetree.txt 
>>> b/drivers/staging/android/ion/devicetree.txt
>>> new file mode 100644
>>> index 0000000..4a0c941
>>> --- /dev/null
>>> +++ b/drivers/staging/android/ion/devicetree.txt
>>> @@ -0,0 +1,53 @@
>>> +Ion Memory Manager
>>> +
>>> +Ion is a memory manager that allows for sharing of buffers via 
>>> dma-buf.
>>> +Ion allows for different types of allocation via an abstraction 
>>> called
>>> +a 'heap'. A heap represents a specific type of memory. Each heap has
>>> +a different type. There can be multiple instances of the same heap
>>> +type.
>>> +
>>> +Required properties for Ion
>>> +
>>> +- compatible: "linux,ion"
>>> +
>>> +All child nodes of a linux,ion node are interpreted as heaps
>>> +
>>> +required properties for heaps
>>> +
>>> +- linux,ion-heap-id: The Ion heap id used for allocation selection
>>> +- linux,ion-heap-type: Ion heap type defined in ion.h
>>> +- linux,ion-heap-name: Human readble name of the heap
>>> +
>>> +
>>> +Optional properties
>>> +- memory-region: A phandle to a memory region. Required for DMA heap 
>>> type
>>> +(see reserved-memory.txt for details on the reservation)
>>> +- linux,ion-heap-align: Alignment for the heap.
>>> +
>>> +Example:
>>> +
>>> +       ion {
>>> +               compatbile = "linux,ion";
>>> +               #address-cells = <1>;
>>> +               #size-cells = <0>;
>>> +
>>> +               ion-system-heap {
>>> +                       linux,ion-heap-id = <0>;
>>> +                       linux,ion-heap-type = <ION_SYSTEM_HEAP_TYPE>;
>>> +                       linux,ion-heap-name = "system";
>> 
>> How does this vary across platforms? Is all of this being pushed down
>> to DT, because there is no coordination of this at the kernel ABI
>> level across platforms. In other words, why can't heap 0 be hardcoded
>> as system heap in the driver. It seems to me any 1 of these 3
>> properties could be used to derive the other 2.
>> 
> 
> Right now there is no guarantee heap IDs will be the same across
> platforms. The heap IDs are currently part of the userspace ABI
> as well since userspace clients must pass in a mask of the heap
> IDs to allocate from. If we assume all existing clients could change,
> heaps such as the system heap could be mandated to have the same
> heap ID but we'd still run into problems if you have multiple
> heaps of the same type (e.g. multiple carveouts)

I don't really like the idea of enforcing any IDs here. As of now
heap ids are generally something VERY platform-specific
(or even product-specific). Personally I'd prefer something like this
for userspace apps:

int id1 = ion_get_heap_id("camera");
if (id1 < 0) {
       fprintf(stderr, "Invalid heap id");
       exit(1);
}

int id2 = ion_get_heap_id("backup-heap");
if (id2 < 0) {
       fprintf(stderr, "Invalid heap id");
       exit(1);
}

...

int ret = ion_alloc(fd, 0x100, 0x4,
               (id1 | id2),
               0, &handle);


What concerns kernel stuff, things are simpler - we may just pass the 
heap to use
by a reference in devicetree node for that driver. Something like that:

...
                ion-decoder-region : region_ddr {
                        linux,ion-heap-id = <1>;
                        linux,ion-heap-type = <ION_DMA_HEAP_TYPE>;
                        linux,ion-heap-name = "decoder_mem"
                        memory-region = <&camera_region>;
                 };
...
                 video_decoder@80180000 {
                         compatible = "acme,h266dec";
                         reg = <0x80180000 0x20000>,
                         reg-names = "registers";
                         interrupts = <12>;
                         interrupt-parent = <&vic1>;
                         ion-heaps-for-buffers = <&ion-decoder-region>
                 };



> 
> An alternative might be to have each heap just be a compatible string
> and pull everything (id, type etc.) into C files for setup. I debated
> doing that but decided to try putting everything in DT for my first
> pass.
> 
>> 
>>> +               };
>>> +
>>> +               ion-camera-region {
>>> +                       linux,ion-heap-id = <1>;
>>> +                       linux,ion-heap-type = <ION_DMA_HEAP_TYPE>;
>>> +                       linux,ion-heap-name = "camera"
>>> +                       memory-region = <&camera_region>;
>> 
>> Couldn't the memory-region node with addition properties or some
>> standardization of existing ones provide enough information for ION's
>> needs?
>> 
> 
> I think we could probably derive most of it from the memory-region 
> right
> now. If it's reusable, it's DMA, if not it goes to a carveout. Name can
> come from the node name. heap ID and whether or not a region is a chunk
> heap could be added as properties.
> 
> We'd still need to be able to get the same information for heaps that
> don't correspond to a specific region like the system heap.
> 
>>> +               };
>>> +
>>> +               ion-fb-region {
>>> +                       linux,ion-heap-id = <2>;
>>> +                       linux,ion-heap-type = <ION_DMA_HEAP_TYPE>;
>>> +                       linux,ion-heap-name = "fb"
>>> +                       memory-region = <&fb_region>;
>>> +               };
>>> +       }
>>> --
>>> 2.4.3
>>> 

-- 
Regards,
Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
