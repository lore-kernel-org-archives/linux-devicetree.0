From: Laura Abbott <labbott@redhat.com>
Subject: Re: [PATCH v5.1 2/2] staging: ion: Add ion-physmem documentation
Date: Tue, 30 Jun 2015 10:54:07 -0700
Message-ID: <5592D7BF.7070405@redhat.com>
References: <1435678490-7515-1-git-send-email-andrew@ncrmnt.org>
 <1435678490-7515-3-git-send-email-andrew@ncrmnt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1435678490-7515-3-git-send-email-andrew@ncrmnt.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Andrew Andrianov <andrew@ncrmnt.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org
Cc: pebolle@tiscali.nl, Chen Gang <gang.chen.5i5j@gmail.com>, =?UTF-8?B?QXJ2ZSBIau+/vW5uZXbvv71n?= <arve@android.com>, linux-kernel@vger.kernel.org, Fabian Frederick <fabf@skynet.be>, Riley Andrews <riandrews@android.com>, john.stultz@linaro.org, devel@linuxdriverproject.org, Android Kernel Team <kernel-team@android.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
List-Id: devicetree@vger.kernel.org

(adding devicetree mailing list since I didn't see it cc-ed)

Please also remember to cc the staging list since Ion is
still a staging framework.

On 06/30/2015 08:34 AM, Andrew Andrianov wrote:
> Signed-off-by: Andrew Andrianov <andrew@ncrmnt.org>
> ---
>   Documentation/devicetree/bindings/ion,physmem.txt | 98 +++++++++++++++++++++++

The proper place is bindings/staging/ since Ion is still a staging driver

>   1 file changed, 98 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/ion,physmem.txt
>
> diff --git a/Documentation/devicetree/bindings/ion,physmem.txt b/Documentation/devicetree/bindings/ion,physmem.txt
> new file mode 100644
> index 0000000..e8c64dd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ion,physmem.txt
> @@ -0,0 +1,98 @@
> +ION PhysMem Driver
> +#include <dt-bindings/ion,physmem.h>
> +
> +
> +ION PhysMem is a generic driver for ION Memory Manager that allows you to
> +define ION Memory Manager heaps using device tree. This is mostly useful if
> +your SoC has several 'special' regions (e.g. SRAM, dedicated memory banks,
> +etc) that are present in the physical memory map and you want to add them to
> +ION as heaps of memory.
> +

A good start of a description. This could use a bit more detail about what the
Ion memory framework actually does (i.e. tied really strongly to Android)

You are also missing a generic description of what all goes into the binding.
Based on what you have below you would get

(name) : ion@(base-address) {
	compatible = "ion,physmem";
	reg = <(baseaddr) (size)>;
	reg-names = "memory";
	ion-heap-id = <(int-value)>;
	ion-heap-type = <(int-value)>;
	ion-heap-align = <(int-value)>;
	ion-heap-name = "(string value");
};

and then you need to describe what each of those properties actually do.
Having all the examples is still really useful, especially for heaps such as the
system heaps which are independent of any memory map.

> +
> +Examples:
> +
> +1. 256KiB On-chip SRAM used as ION DMA heap. reg range is treated as a physical
> +   address range
> +
> +	ion_im0: ion@0x00100000 {
> +	     compatible = "ion,physmem";
> +	     reg = <0x00100000 0x40000>;
> +	     reg-names = "memory";
> +	     ion-heap-id   = <2>;
> +	     ion-heap-type = <ION_HEAP_TYPE_DMA>;
> +	     ion-heap-align = <0x10>;
> +	     ion-heap-name = "IM0";
> +	};
> +
> +2. The same, but using system DMA memory.
> +
> +	ion_dma: ion@0xdeadbeef {
> +	     compatible = "ion,physmem";
> +	     ion-heap-id   = <2>;
> +	     ion-heap-type = <ION_HEAP_TYPE_DMA>;
> +	     ion-heap-align = <0x10>;
> +	     ion-heap-name = "SYSDMA";
> +	};

CMA now has bindings upstream. I'd rather see Ion be a CMA client instead
of creating any other bindings.

> +
> +3. Carveout heap, 1MiB size, ion-physmem will alloc pages for it using
> +   alloc_pages_exact(). reg range is used for specifying size only.
> +
> +		ion_crv: ion@deadbeef {
> +		     compatible = "ion,physmem";
> +		     reg = <0x00000000 0x100000>;
> +		     reg-names = "memory";
> +		     ion-heap-id   = <3>;
> +		     ion-heap-type = <ION_HEAP_TYPE_CARVEOUT>;
> +		     ion-heap-align = <0x10>;
> +		     ion-heap-name = "carveout";
> +		};
> +

My understanding of DT binding rules was that for foo@X, your reg must
equal X. Maintainers can correct me if I'm wrong or if that restriction
is relaxed these days.

> +4. Chunk heap. 1MiB size, ion-physmem will alloc pages for it using
> +   alloc_pages_exact(). reg range is used for specifying size only.
> +
> +	ion_chunk: ion@0xdeadbeef {
> +	     compatible = "ion,physmem";
> +	     ion-heap-id   = <2>;
> +	     ion-heap-type = <ION_HEAP_TYPE_CHUNK>;
> +	     ion-heap-align = <0x10>;
> +	     ion-heap-name = "chunky";
> +	};
> +
> +
> +5. vmalloc();
> +
> +	ion_chunk: ion@0xdeadbeef {
> +	     compatible = "ion,physmem";
> +	     ion-heap-id   = <2>;
> +	     ion-heap-type = <ION_HEAP_TYPE_SYSTEM>;
> +	     ion-heap-align = <0x10>;
> +	     ion-heap-name = "sys";
> +	};
> +
> +6. kmalloc();
> +
> +	ion_chunk: ion@0xdeadbeef {
> +	     compatible = "ion,physmem";
> +	     ion-heap-id   = <2>;
> +	     ion-heap-type = <ION_HEAP_TYPE_SYSTEM_CONTIG>;
> +	     ion-heap-align = <0x10>;
> +	     ion-heap-name = "syscont";
> +	};
> +
> +If the underlying heap relies on some physical device that needs clock
> +gating, you may need to fill the clocks field in. E.g.:
> +
> +
> +	ion_im0: ion@0x00100000 {
> +	     compatible = "ion,physmem";
> +	     reg = <0x00100000 0x40000>;
> +	     reg-names = "memory";
> +	     ion-heap-id   = <2>;
> +	     ion-heap-type = <ION_HEAP_TYPE_DMA>;
> +	     ion-heap-align = <0x10>;
> +	     ion-heap-name = "IM0";
> +	     clocks = <&oscillator_27m>;
> +	     clock-names = "clk_27m";
> +	};
> +
> +ion-physmem will do everything required to enable and disable the clock.
>

I'm glad to see an attempt to get bindings submitted for Ion. There
exists other bindings out of tree already[1]. My one concern here is that
Ion is so 'experimental/staging' that trying to
shoot for an ABI is going to be difficult because of how far this has to
go. On the other hand, it's been out there long enough and it's in use
so establishing something for what there is at the present would be
beneficial. I also don't know the rules on DT bindings for staging drivers
so I'll let the maintainers comment.

Thanks,
Laura


[1] https://www.codeaurora.org/cgit/quic/la/kernel/msm-3.10/tree/Documentation/devicetree/bindings/arm/msm/msm_ion.txt?h=msm-3.10
