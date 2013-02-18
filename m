From: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/2] Device Tree support for CMA (Contiguous Memory
 Allocator)
Date: Mon, 18 Feb 2013 23:25:03 +0100
Message-ID: <5122AA3F.8030001@gmail.com>
References: <1360845928-8107-1-git-send-email-m.szyprowski@samsung.com>
 <20130214213013.GG1906@pengutronix.de> <511D6076.9090503@gmail.com>
 <20130215083304.GK1906@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130215083304.GK1906-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Michal Nazarewicz <mina86-deATy8a+UHjQT0dZR+AlfA@public.gmane.org>, linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/15/2013 09:33 AM, Sascha Hauer wrote:
> On Thu, Feb 14, 2013 at 11:08:54PM +0100, Sylwester Nawrocki wrote:
>> On 02/14/2013 10:30 PM, Sascha Hauer wrote:
>>> On Thu, Feb 14, 2013 at 01:45:26PM +0100, Marek Szyprowski wrote:
>> ...
>>>> Here is my initial proposal for device tree integration for Contiguous
>>>> Memory Allocator. The code is quite straightforward, however I expect
>>>> that the memory bindings require some discussion.
>>>>
>>>> The proposed bindings allows to define contiguous memory regions of
>>>> specified base address and size. Then, the defined regions can be
>>>> assigned to the given device(s) by adding a property with a phanle to
>>>> the defined contiguous memory region. From the device tree perspective
>>>> that's all. Once the bindings are added, all the memory allocations from
>>>> dma-mapping subsystem will be served from the defined contiguous memory
>>>> regions.
>>>>
>>>
>>> I think CMA regions should not be described in the devicetre at all. The
>>> devicetree is about hardware description and it should be OS agnostic,
>>> but CMA is only a Linux specific implementation detail. It's not even
>>> specific to a particular board, it's specific to a particular usecase of
>>> a board.
>>
>> I disagree. For example, in a multiprocessor system describing the memory
>> regions this way allows to assign memory to each subsystem, e.g. shared
>> memory, so that the memory region constraints are satisfied.
>>
>> CMA just happens to be an implementation of a method of assigning memory
>> to each device in Linux. The constraints on the memory are real hardware
>> constraints, resulting from a particular subsystem architecture.
>
> If you are talking about DMA controllers which can only access a certain
> memory area, then yes, that's a hardware constraint, I'm not sure though
> if describing this as CMA in the devicetree is the way to go.

My context was a multiprocessor SoC, where one of the processors is somehow
application specific (e.g. camera ISP) and can be considered as a slave
subsystem, running it's firmware and sharing system memory with the main
processor.

The slave subsystem can have insane constraints on the memory region where
its firmware is located and which it also uses as its generic purpose RAM.

While the region assigned to such a slave device would also likely include
a memory for its DMA buffers, the main concern here was an allocation of
a working memory for the slave processor.

Perhaps the device tree is not a perfect place for defining exact memory
regions. If we happen to decide against it, then I guess some set of
properties would be needed, that would allow CMA to assign appropriate
memory region(s) to a device.

> If you are talking about 'on this board I want to have 128MiB for this
> device because I'm doing 1080p while on another board 64MiB are enough
> because I'm doing 720p', then this is not a hardware constraint.

No, that's not something I was referring to.

> There may be valid scenarios for putting CMA into the devicetrees, but
> doing this also opens the door for abuse of this binding. I for once
> don't want to find areas being allocated for CMA in the devicetree for
> devices I don't care about. I know I can always exchange a devicetree,
> but I think the device tree should be seen as firmware to a certain
> degree.

I agree. You're likely aware of it, I just want to remind that the CMA
memory can be used by the OS in a normal way, until a device driver
actually allocates and uses it.
