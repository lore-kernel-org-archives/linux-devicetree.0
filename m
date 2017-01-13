From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 1/1] iio: adc: tlc4541: add support for TI tlc4541 adc
Date: Fri, 13 Jan 2017 11:39:37 -0600
Message-ID: <20170113173937.iytbqm4xmehy7jh7@rob-hp-laptop>
References: <1484117471-67082-1-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1484117471-67082-1-git-send-email-preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 11, 2017 at 02:51:11PM +0800, Phil Reid wrote:
> This adds TI's tlc4541 16-bit ADC driver. Which is a single channel
> ADC. Supports raw and trigger buffer access.
> Also supports the tlc3541 14-bit device, which has not been tested.
> Implementation of the tlc3541 is fairly straight forward thou.
> 
> Signed-off-by: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
> ---
> 
> Notes:
>     Changes from v1:
>     - Add tlc3541 support and chan spec.
>     - remove fields that where already 0 from TLC4541_V_CHAN macro
>     - Increase rx_buf size in tlc4541_state to avoid copy in tlc4541_trigger_handle
>     - Remove erroneous be16_to_cpu in tlc4541_trigger_handle
>     - Docs/binding: spi -> SPI & add ti,tlc3541
>     
>     I haven't add Rob's Ack due to adding a new compatible string.
>     
>     I tried to ".index = 1" from the spec as suggested by Peter, but that didn't
>     seem to work. Perhaps remove of .channel was the intended target.
>     
>     Example output from iio_readdev
>     
>     with ".index = 1"
>     root@cyclone5:~# mkdir /sys/kernel/config/iio/triggers/hrtimer/hr1
>     root@cyclone5:~# iio_readdev -t hr1 -b 32 -s 10 tlc4541 | hexdump
>     WARNING: High-speed mode not enabled
>     0000000 af00 0000 0000 0000 b922 ca99 93da 1492
>     0000010 a800 00ff 0000 0000 b246 cb30 93da 1492
>     0000020 a900 0000 0000 0000 4f9c cbc9 93da 1492
>     0000030 aa00 00ff 0000 0000 bd2c cc61 93da 1492
>     0000040 aa00 00ff 0000 0000 544c ccfa 93da 1492
>     0000050 ab00 00ff 0000 0000 e806 cd92 93da 1492
>     0000060 a900 00ff 0000 0000 846c ce2b 93da 1492
>     0000070 ab00 0000 0000 0000 2efc cec8 93da 1492
>     0000080 a800 00ff 0000 0000 b090 cf5c 93da 1492
>     0000090 a900 00ff 0000 0000 476a cff5 93da 1492
>     
>     without .index
>     root@cyclone5:~# mkdir /sys/kernel/config/iio/triggers/hrtimer/hr1
>     root@cyclone5:~# iio_readdev -t hr1 -b 32 -s 10 tlc4541 | hexdump
>     WARNING: High-speed mode not enabled
>     0000000 6db0 eeb6 93e3 1492 35e0 ef4f 93e3 1492
>     0000010 4b34 efe5 93e3 1492 e9f2 f07d 93e3 1492
>     0000020 6182 f116 93e3 1492 090a f1af 93e3 1492
>     0000030 409c f249 93e3 1492 6c1a f2e0 93e3 1492
>     0000040 cd02 f378 93e3 1492 9582 f411 93e3 1492
> 
>  .../devicetree/bindings/iio/adc/ti-tlc4541.txt     |  17 ++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/iio/adc/Kconfig                            |  11 +
>  drivers/iio/adc/Makefile                           |   1 +
>  drivers/iio/adc/ti-tlc4541.c                       | 276 +++++++++++++++++++++
>  4 files changed, 305 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/ti-tlc4541.txt
>  create mode 100644 drivers/iio/adc/ti-tlc4541.c
