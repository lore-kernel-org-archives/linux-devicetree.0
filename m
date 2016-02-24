From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/2] iio: dac: vf610_dac: Add IIO DAC driver for Vybrid
 SoC
Date: Wed, 24 Feb 2016 20:55:08 +0000
Message-ID: <56CE18AC.6020603@kernel.org>
References: <cover.1456121233.git.maitysanchayan@gmail.com>
 <1a70acdd3ffae273bbfe2f80c5e3952d152921df.1456121233.git.maitysanchayan@gmail.com>
 <20160223205437.GA27366@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160223205437.GA27366@rob-hp-laptop>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 23/02/16 20:54, Rob Herring wrote:
> On Mon, Feb 22, 2016 at 11:48:37AM +0530, Sanchayan Maity wrote:
>> Add driver support for DAC peripheral on Vybrid SoC.
>>
>> Signed-off-by: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  Documentation/ABI/testing/sysfs-bus-iio-vf610      |   9 +
>>  .../devicetree/bindings/iio/dac/vf610-dac.txt      |  20 ++
> 
> For the binding:
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Applied to the togreg branch of iio.git - initially pushed out as testing
for the autobuilders to play with it.

Note the dts change probably wants to go via the relevant arch trees.
I can take it with an appropriate ack if not.

Jonathan
> 
>>  drivers/iio/dac/Kconfig                            |  10 +
>>  drivers/iio/dac/Makefile                           |   1 +
>>  drivers/iio/dac/vf610_dac.c                        | 298 +++++++++++++++++++++
>>  5 files changed, 338 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/iio/dac/vf610-dac.txt
>>  create mode 100644 drivers/iio/dac/vf610_dac.c
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
