From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 2/4] gpio: davinci: DT changes for driver
Date: Thu, 20 Jun 2013 16:06:19 +0530
Message-ID: <51C2DB23.9070705@ti.com>
References: <1371203020-15092-1-git-send-email-avinashphilip@ti.com>
	<1371205241-17205-3-git-send-email-avinashphilipk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <1371205241-17205-3-git-send-email-avinashphilipk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Philip Avinash <avinashphilipk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, avinashphilip-l0cyMroinI0@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 6/14/2013 3:50 PM, Philip Avinash wrote:
> From: KV Sujith <sujithkv-l0cyMroinI0@public.gmane.org>
> 
> - Add of_device_id for Davinci GPIO driver.
> - Add function to populate data from DT.
> - Modify the probe to read from DT if DT match is found.
> - Add DT binding documentation for Davinci GPIO properties in a new file
>   gpio-davinci.txt located at Documentation/devicetree/bindings/gpio/.
> 
> Signed-off-by: KV Sujith <sujithkv-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Philip Avinash <avinashphilip-l0cyMroinI0@public.gmane.org>
> ---
> Changes since v1:
> 	- description for interrupts changed to reflecti
> 	   interrupt array usage.
> 
>  .../devicetree/bindings/gpio/gpio-davinci.txt      |   32 +++++++++++
>  drivers/gpio/gpio-davinci.c                        |   57 ++++++++++++++++++--
>  2 files changed, 86 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
> new file mode 100644
> index 0000000..1c31638
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
> @@ -0,0 +1,32 @@
> +Davinci GPIO controller bindings
> +
> +Required Properties:
> +- compatible:"ti,da830-gpio"

"ti,dm6441-gpio" instead since this came first on DM6441?

> +
> +- reg: Physical base address of the controller and length of memory mapped
> +	region.
> +
> +- interrupts: Array of GPIO interrupt number.
> +
> +- ngpio: The number of GPIO pins supported

Is this a generic GPIO property? I could not find it in documentation.
Looks like Marvell GPIO uses a similar property too, but even there it
is not marked as Marvell specific. Should this be added as a generic
GPIO property?

> +- intc_irq_num: The number of IRQs supported by the Interrupt Controller

You are not actually looking at the number of IRQs interrupt controller
on the SoC supports (which is quite unrelated to GPIO module). What you
are actually looking for is the base from where GPIO interrupt numbering
can start. So "ti,davinci-gpio-irq-base" is more meaningful.

That said, this property is probably not required if irqdomains are used
(I myself have to read about that). Not sure if it is okay to add this
property now waiting for irqdomain conversion. I will let Linus take a call.

> +
> +- gpio_unbanked: The number of GPIOs that have an individual interrupt
> +		line to processor.

This is also a TI specific property so it should be
"ti,davinci-gpio-unbanked".

Thanks,
Sekhar
