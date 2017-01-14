From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4] iio:temperature: Add support for TI TMP007 sensor
Date: Sat, 14 Jan 2017 10:48:19 +0000
Message-ID: <e4e7129b-94b8-1f38-ee53-c447ab041b80@kernel.org>
References: <20170109025526.GA9601@gmail.com>
 <20170110053603.n6ihrg3r6z4244g5@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170110053603.n6ihrg3r6z4244g5@rob-hp-laptop>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Manivannan Sadhasivam <manivannanece23-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/01/17 05:36, Rob Herring wrote:
> On Mon, Jan 09, 2017 at 08:25:26AM +0530, Manivannan Sadhasivam wrote:
>> This patch adds support for TI TMP007 - 16 bit IR thermopile sensor with integrated Math engine.
>> Sensor takes care of calculating the object temperature with the help of calibrated constants stored in non-volatile memory,
>> thereby reducing the calculation overhead.
>>
>> Signed-off-by: Manivannan Sadhasivam <manivannanece23-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>
>> Changes since v3:
>>
>> 1. Removed caching of status register
>> 2. Modified comments for data validity
>> 3. Added possible address combinations in dTree bindings file
>>
>>  .../devicetree/bindings/iio/temperature/tmp007.txt |  27 ++
> 
> This could be documented under trivial-devices.txt, but doesn't hurt to 
> have it here.
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Thanks as ever Rob - I don't say that often enough!

Anyhow, nice little driver. Applied to the togreg branch of iio.git and
pushed out as testing for the autobuilders to see if they can find anything
we missed.

Was a bit messy going in with some fuzz, but superficially looks fine.

Thanks,

Jonathan
> 
>>  drivers/iio/temperature/Kconfig                    |  10 +
>>  drivers/iio/temperature/Makefile                   |   1 +
>>  drivers/iio/temperature/tmp007.c                   | 345 +++++++++++++++++++++
>>  4 files changed, 383 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/iio/temperature/tmp007.txt
>>  create mode 100644 drivers/iio/temperature/tmp007.c
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
