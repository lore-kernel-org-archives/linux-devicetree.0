From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RESEND][PATCHv2 1/3] ion: Devicetree bindings for Ion
Date: Mon, 11 Jan 2016 17:28:23 -0600
Message-ID: <CAL_JsqLBk1TAa2bKnA6TpEfrXxVZ7JYojOgmszEKoWC0+Huuug@mail.gmail.com>
References: <1452548364-9522-1-git-send-email-laura@labbott.name>
 <1452548364-9522-2-git-send-email-laura@labbott.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1452548364-9522-2-git-send-email-laura@labbott.name>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Laura Abbott <laura@labbott.name>
Cc: devel@driverdev.osuosl.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Andrew Andrianov <andrew@ncrmnt.org>, Tom Gall <tom.gall@linaro.org>, Rom Lemarchand <romlem@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, arve@android.com, Colin Cross <ccross@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Riley Andrews <riandrews@android.com>, John Stultz <john.stultz@linaro.org>, Feng Tang <feng.tang@intel.com>, Grant Likely <grant.likely@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 11, 2016 at 3:39 PM, Laura Abbott <laura@labbott.name> wrote:
>
> This adds a base set of devicetree bindings for the Ion memory
> manager. This supports setting up the generic set of heaps and
> their properties.
>
> Signed-off-by: Laura Abbott <laura@labbott.name>
> ---
>  drivers/staging/android/ion/devicetree.txt | 50 ++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 drivers/staging/android/ion/devicetree.txt
>
> diff --git a/drivers/staging/android/ion/devicetree.txt b/drivers/staging/android/ion/devicetree.txt
> new file mode 100644
> index 0000000..e1ea537
> --- /dev/null
> +++ b/drivers/staging/android/ion/devicetree.txt
> @@ -0,0 +1,50 @@
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
> +- compatible: "linux,ion" PLUS a compatible property for the device
> +
> +All child nodes of a linux,ion node are interpreted as heaps
> +
> +required properties for heaps
> +
> +- compatible: compatible string for a heap type PLUS a compatible property
> +for the specific instance of the heap. Current heap types
> +-- linux,ion-heap-system
> +-- linux,ion-heap-system-contig
> +-- linux,ion-heap-carveout
> +-- linux,ion-heap-chunk
> +-- linux,ion-heap-dma
> +-- linux,ion-heap-custom
> +
> +Optional properties
> +- memory-region: A phandle to a memory region. Required for DMA heap type
> +(see reserved-memory.txt for details on the reservation)

Why would all of them not require a memory region other than system heap?

> +
> +Example:
> +
> +       ion {
> +               compatbile = "qcom,msm8916-ion", "linux,ion";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               ion-system-heap {
> +                       compatbile = "qcom,system-heap", "linux,ion-heap-system"
> +               };

What is the purpose of this in DT? Don't we always want/need a system
heap? How does it vary by platform?

> +               ion-camera-region {
> +                       compatible = "qcom,camera-heap", "linux,ion-heap-dma"
> +                       memory-region = <&camera_region>;

Why not just add a property (or properties) to the camera_region node
that ION drivers can search for?

Rob
