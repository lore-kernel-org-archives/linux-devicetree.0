From: Rob Herring <robherring2@gmail.com>
Subject: Re: [RFC][PATCH 1/2] WIP: Devicetree bindings for Ion
Date: Tue, 6 Oct 2015 17:35:41 -0500
Message-ID: <CAL_JsqJ+i3zC7UJ3BcdtOhdmQd8YnRC7bs3D2Ei5JD-4-C+A0g@mail.gmail.com>
References: <1444164433-9107-1-git-send-email-labbott@fedoraproject.org>
 <1444164433-9107-2-git-send-email-labbott@fedoraproject.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1444164433-9107-2-git-send-email-labbott@fedoraproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Laura Abbott <labbott@fedoraproject.org>
Cc: devel@driverdev.osuosl.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Andrew Andrianov <andrew@ncrmnt.org>, Tom Gall <tom.gall@linaro.org>, romlem@google.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, arve@android.com, Colin Cross <ccross@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Riley Andrews <riandrews@android.com>, Rob Herring <robh+dt@kernel.org>, John Stultz <john.stultz@linaro.org>, Feng Tang <feng.tang@intel.com>, Grant Likely <grant.likely@linaro.org>, Laura Abbott <laura@labbott.name>, Frank Rowand <frowand.list@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 6, 2015 at 3:47 PM, Laura Abbott <labbott@fedoraproject.org> wrote:
> From: Laura Abbott <laura@labbott.name>
>
>
> This adds a base set of devicetree bindings for the Ion memory
> manager. This supports setting up the generic set of heaps and
> their properties.
>
> Signed-off-by: Laura Abbott <laura@labbott.name>
> Signed-off-by: Andrew Andrianov <andrew@ncrmnt.org>
> ---
>  drivers/staging/android/ion/devicetree.txt | 53 ++++++++++++++++++++++++++++++

I have no issue with this going in here, but I do have lots of issues
with this binding.

>  1 file changed, 53 insertions(+)
>  create mode 100644 drivers/staging/android/ion/devicetree.txt
>
> diff --git a/drivers/staging/android/ion/devicetree.txt b/drivers/staging/android/ion/devicetree.txt
> new file mode 100644
> index 0000000..4a0c941
> --- /dev/null
> +++ b/drivers/staging/android/ion/devicetree.txt
> @@ -0,0 +1,53 @@
> +Ion Memory Manager
> +
> +Ion is a memory manager that allows for sharing of buffers via dma-buf.
> +Ion allows for different types of allocation via an abstraction called
> +a 'heap'. A heap represents a specific type of memory. Each heap has
> +a different type. There can be multiple instances of the same heap
> +type.
> +
> +Required properties for Ion
> +
> +- compatible: "linux,ion"
> +
> +All child nodes of a linux,ion node are interpreted as heaps
> +
> +required properties for heaps
> +
> +- linux,ion-heap-id: The Ion heap id used for allocation selection
> +- linux,ion-heap-type: Ion heap type defined in ion.h
> +- linux,ion-heap-name: Human readble name of the heap
> +
> +
> +Optional properties
> +- memory-region: A phandle to a memory region. Required for DMA heap type
> +(see reserved-memory.txt for details on the reservation)
> +- linux,ion-heap-align: Alignment for the heap.
> +
> +Example:
> +
> +       ion {
> +               compatbile = "linux,ion";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               ion-system-heap {
> +                       linux,ion-heap-id = <0>;
> +                       linux,ion-heap-type = <ION_SYSTEM_HEAP_TYPE>;
> +                       linux,ion-heap-name = "system";

How does this vary across platforms? Is all of this being pushed down
to DT, because there is no coordination of this at the kernel ABI
level across platforms. In other words, why can't heap 0 be hardcoded
as system heap in the driver. It seems to me any 1 of these 3
properties could be used to derive the other 2.


> +               };
> +
> +               ion-camera-region {
> +                       linux,ion-heap-id = <1>;
> +                       linux,ion-heap-type = <ION_DMA_HEAP_TYPE>;
> +                       linux,ion-heap-name = "camera"
> +                       memory-region = <&camera_region>;

Couldn't the memory-region node with addition properties or some
standardization of existing ones provide enough information for ION's
needs?

> +               };
> +
> +               ion-fb-region {
> +                       linux,ion-heap-id = <2>;
> +                       linux,ion-heap-type = <ION_DMA_HEAP_TYPE>;
> +                       linux,ion-heap-name = "fb"
> +                       memory-region = <&fb_region>;
> +               };
> +       }
> --
> 2.4.3
>
