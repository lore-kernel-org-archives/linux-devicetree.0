From: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/5] of: Add support for linking device tree blobs into
	vmlinux
Date: Tue, 16 Nov 2010 22:14:01 -0800
Message-ID: <4CE372A9.2050704@gmail.com>
References: <cover.1289943240.git.dirk.brandewie@gmail.com>
	<9129f0a21ea48fb2dcb89cea290e88f3e8c0d8a2.1289943240.git.dirk.brandewie@gmail.com>
	<4CE32453.2090403@caviumnetworks.com> <4CE33C14.9030503@gmail.com>
	<AANLkTi=T_bqEswe32dTAfL4++WAitc7+VHnyjqP2sQfi@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTi=T_bqEswe32dTAfL4++WAitc7+VHnyjqP2sQfi-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/16/2010 06:58 PM, Grant Likely wrote:
> On Tue, Nov 16, 2010 at 7:21 PM, Dirk Brandewie
> <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  wrote:
>>
>> On 11/16/2010 04:39 PM, David Daney wrote:
>>>
>>> Thanks for doing this. However I have a few comments...
>>>
>>> On 11/16/2010 02:41 PM, dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>>>>
>>>> From: Dirk Brandewie<dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>
>>>> /* .data section */
>>>> #define DATA_DATA \
>>>> *(.data) \
>>>> @@ -468,7 +482,8 @@
>>>> MCOUNT_REC() \
>>>> DEV_DISCARD(init.rodata) \
>>>> CPU_DISCARD(init.rodata) \
>>>> - MEM_DISCARD(init.rodata)
>>>> + MEM_DISCARD(init.rodata) \
>>>> + KERNEL_DTB()
>>>>
>>>
>>> I thought the init.rodata was only for data used by __init things.
>>> Although the
>>> current linker scripts do not put it in the section that gets recycled as
>>> usable
>>> memory.
>>>
>>> IIRC the unflattened version of the device tree has pointers to the
>>> flattened
>>> data. Since the device tree nodes are live for the entire kernel
>>> lifecycle,
>>> shouldn't the device tree blobs be in non-init memory?
>>>
>>
>> The contents of the blob get copied to allocated memory during
>> unflatten_device_tree() so the blob that is linked in is no longer needed
>> after init.
>
> Have you written a patch to add this behaviour?  The current code doesn't.  :-)
>

I misspoke, my blob gets copied to allocated memory during unflatten_device_tree.
my early_init_dt_alloc_memory_arch() returns the physical address of a kmalloc'd
buffer.

You would want copy the dtb that your platform is going to use to non-init memory.

--Dirk
