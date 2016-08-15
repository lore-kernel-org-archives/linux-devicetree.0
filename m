From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] iio: accel: Add support for Domintech DMARD06
 accelerometer
Date: Mon, 15 Aug 2016 18:56:00 +0100
Message-ID: <856a6531-9a19-6382-838a-f3c6b83259f6@kernel.org>
References: <1469460078-6460-1-git-send-email-mamlinav@gmail.com>
 <1469460078-6460-3-git-send-email-mamlinav@gmail.com>
 <20160727145740.GA23467@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160727145740.GA23467@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 27/07/16 15:57, Rob Herring wrote:
> On Mon, Jul 25, 2016 at 06:21:18PM +0300, Aleksei Mamlin wrote:
>> This patch add support for Domintech DMARD05, DMARD06 and DMARD07
>> accelerometers.
>>
>> Signed-off-by: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  .../devicetree/bindings/iio/accel/dmard06.txt      |  19 ++
> 
> This could go into trivial-devices.txt, but this is fine too:
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Applied to the togreg branch of iio.git - initially pushed out as
test for the autobuilders to play with it.

Nice compact little driver.

Thanks,

Jonathan
> 
>>  drivers/iio/accel/Kconfig                          |  11 +
>>  drivers/iio/accel/Makefile                         |   1 +
>>  drivers/iio/accel/dmard06.c                        | 241 +++++++++++++++++++++
>>  4 files changed, 272 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/iio/accel/dmard06.txt
>>  create mode 100644 drivers/iio/accel/dmard06.c
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
