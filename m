From: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/2] Device Tree support for CMA (Contiguous Memory
 Allocator)
Date: Thu, 14 Feb 2013 23:08:54 +0100
Message-ID: <511D6076.9090503@gmail.com>
References: <1360845928-8107-1-git-send-email-m.szyprowski@samsung.com>
 <20130214213013.GG1906@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130214213013.GG1906-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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

Hi,

On 02/14/2013 10:30 PM, Sascha Hauer wrote:
> On Thu, Feb 14, 2013 at 01:45:26PM +0100, Marek Szyprowski wrote:
...
>> Here is my initial proposal for device tree integration for Contiguous
>> Memory Allocator. The code is quite straightforward, however I expect
>> that the memory bindings require some discussion.
>>
>> The proposed bindings allows to define contiguous memory regions of
>> specified base address and size. Then, the defined regions can be
>> assigned to the given device(s) by adding a property with a phanle to
>> the defined contiguous memory region. From the device tree perspective
>> that's all. Once the bindings are added, all the memory allocations from
>> dma-mapping subsystem will be served from the defined contiguous memory
>> regions.
>>
>
> I think CMA regions should not be described in the devicetre at all. The
> devicetree is about hardware description and it should be OS agnostic,
> but CMA is only a Linux specific implementation detail. It's not even
> specific to a particular board, it's specific to a particular usecase of
> a board.

I disagree. For example, in a multiprocessor system describing the memory
regions this way allows to assign memory to each subsystem, e.g. shared
memory, so that the memory region constraints are satisfied.

CMA just happens to be an implementation of a method of assigning memory
to each device in Linux. The constraints on the memory are real hardware
constraints, resulting from a particular subsystem architecture.

---

Thanks,
Sylwester
