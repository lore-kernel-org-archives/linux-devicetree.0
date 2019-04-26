Return-Path: <SRS0=xoM5=S4=labundy.com=jeff@kernel.org>
Date: Thu, 25 Apr 2019 19:08:00 -0500
From: Jeff LaBundy <jeff@labundy.com>
Subject: Re: [PATCH v8 2/2] input: touchscreen: Add support for Azoteq
 IQS550/572/525
Message-ID: <20190426000800.GA2241@labundy.com>
References: <1554613272-10757-1-git-send-email-jeff@labundy.com>
 <1554613272-10757-2-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554613272-10757-2-git-send-email-jeff@labundy.com>
To: dmitry.torokhov@gmail.com, devicetree@vger.kernel.org
Cc: linux-input@vger.kernel.org, rydberg@bitmath.org, robh+dt@kernel.org, mark.rutland@arm.com
List-ID: <devicetree@vger.kernel.org>

Hi Dmitry,

Just wanted to check in and see if you're satisfied with this patch
set based on my solutions to your feedback from February (v7) as well
as some final fortifications I opted to make earlier this month (v8).

On Sun, Apr 07, 2019 at 12:01:12AM -0500, Jeff LaBundy wrote:
> This patch adds support for the Azoteq IQS550/572/525 family of
> trackpad/touchscreen controllers.
> 
> The driver has been tested with an IQS550EV02 evaluation board. A
> demonstration of the driver's capabilities is available here:
> 
> https://youtu.be/sRNNx4XZBts
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
> Changes in v8:
>   - Updated iqs5xx_fw_file_write to disable the interrupt before resetting the
>     device, and reset the device into normal mode if the firmware update fails
>   - Updated iqs5xx_dev_init to validate the device's bootloader status
>   - Updated iqs5xx_irq to return IRQ_NONE instead of IRQ_HANDLED if the device
>     unexpectedly asserts the RDY output during bootloader mode
> 
> Changes in v7:
>   - Changed the 'val' pointer type in iqs5xx_read_burst and iqs5xx_write_burst
>     to void * and const void *, respectively so that callers need not cast
>   - Overhauled the device initialization process to simply enter the bootloader
>     (for subsequent firmware updates from user space) rather than automatically
>     updating firmware in response to version mismatches
>   - Withheld input device allocation and registration until the device has been
>     successfully identified (or corrected firmware pushed from user space)
>   - Added comments in iqs5xx_fw_file_parse to explain why request_ihex_firmware
>     is not used
>   - Delayed the return from iqs5xx_irq until the device releases its RDY output
>     to allow the use of level-sensitive interrupts
>   - Removed IRQF_TRIGGER_RISING to preserve the type specified by device tree

Thanks,
Jeff L.
