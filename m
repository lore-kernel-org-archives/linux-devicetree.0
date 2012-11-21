From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Device tree node to major/minor?
Date: Wed, 21 Nov 2012 23:07:06 +0000
Message-ID: <CACxGe6tm_7wwZDNexUCJhLsKMM12iYQJ2Yi0=M7fU1z5YLhvRA@mail.gmail.com>
References: <CAPnjgZ0+8MbjmW7XKsSW0O0n2ob7XcUZokLd8b=1LkSUJ+tQEA@mail.gmail.com>
 <CACxGe6t-ROJe+KXZh-nah50M2buM4yjncs=7musv39=C+73_FQ@mail.gmail.com>
 <CAPnjgZ3jF7bdwqDCNzJXvSrwoP0PZVjcFO+nGOiLACLDX07Z7A@mail.gmail.com>
 <20121121154758.93CE43E0AE2@localhost>
 <CAPnjgZ3W3YfJLwfmg41oM4HvM+JnH2qiwmDN6Yhf3G8KnBFRhw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPnjgZ3W3YfJLwfmg41oM4HvM+JnH2qiwmDN6Yhf3G8KnBFRhw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, lk <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Che-liang Chiou <clchiou-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 21, 2012 at 8:48 PM, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> Hi Grant,
>
> On Wed, Nov 21, 2012 at 7:47 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>> On Tue, 20 Nov 2012 15:48:24 -0800, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>>> Hi Grant,
>>>
>>> On Tue, Nov 20, 2012 at 2:32 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>>> > On Tue, Nov 20, 2012 at 10:23 PM, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>>> >> Hi,
>>> >>
>>> >> I hope this is a stupid question with an easy answer, but I cannot find it.
>>> >>
>>> >> I have a device tree node for an mmc block device and I want to use
>>> >> that block device from another driver. I have a phandle which lets me
>>> >> get the node of the mmc device, but I am not sure how to convert that
>>> >> into a block_device. In order to do so, I think I need a major/minor
>>> >> number. Of course the phandle might in fact point to a SCSI driver and
>>> >> I want that to work correctly also.
>>> >>
>>> >> I imagine I might be able to search through the wonders of sysfs in
>>> >> user space, but is there a better way?
>>> >
>>> > Do you /want/ to do it from userspace? What is your use case? Mounting
>>> > the rootfs?
>>>
>>> The use case is storing some raw data on a block device from within a
>>> driver in the kernel. It is used to keep track of the verified boot
>>> state.
>>>
>>> >
>>> > Regardless, userspace can monitor the uevents when devices are added
>>> > (that's what udev does) and watch for the full path of the node you
>>> > want in the uevent attribute. Then you can look for the child device
>>> > with the block major/minor numbers in it.
>>>
>>> So is there a way to do this entirely in the kernel ex post? It might
>>> need to happen during kernel boot, before user space.
>>
>> Yes, it is certainly doable within the kernel. First, you'll need to use
>> a notifier to get called back whenever a new device is created. Then
>> you'll need to look at the dev->of_node(->full_name) to see if it is the
>> node you actually want. You might need/want to resolve it from an alias
>> or something, but I presume you already have a way to find the
>> device_node before seaching for a struct device.
>
> OK thank you. Was hoping to find a simple way to find a block device
> from a device tree node (yes I know the right one) but I suppose in
> general this is impossible, since nodes may create more than one
> device, and each has its own data structures leading to the block
> device.
>
> So it seems like a notifier is the best way. Thanks for looking at this Grant.

It's certainly the least invasive way. Otherwise you need to hook into
the DT device creation code.

g.


--
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
