From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] iio: health: max30100: add config for LED current
Date: Sun, 3 Jan 2016 18:00:39 +0000
Message-ID: <568961C7.1060503@kernel.org>
References: <1451454288-9945-1-git-send-email-mranostay@gmail.com>
 <20151231221731.GA4445@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151231221731.GA4445@rob-hp-laptop>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 31/12/15 22:17, Rob Herring wrote:
> On Tue, Dec 29, 2015 at 09:44:48PM -0800, Matt Ranostay wrote:
>> Allow the current for both RED and IR LEDs to be set via an device tree
>> property setting.
>>
>> This is an optional setting that is useful for applications that have a
>> known glass attenuation factor.
>>
>> Signed-off-by: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> Changes from v2:
>> * change to use microamp property name from LED class
>> * updated documentation for new format
>> * added allowed current index map
>>
>> .../devicetree/bindings/iio/health/max30100.txt    |  8 +++
>>  drivers/iio/health/max30100.c                      | 81 ++++++++++++++++++++--
>>  2 files changed, 83 insertions(+), 6 deletions(-)
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Looks good to me as well. Applied to the togreg branch of iio.git - initially
pushed out as testing for the autobuilders to play with it.

Thanks,

Jonathan
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
