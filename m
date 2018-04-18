From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v2 6/6] drm/atmel-hlcdc: fix broken release date
Date: Wed, 18 Apr 2018 10:09:12 +0200
Message-ID: <3de958e5-c63c-6935-d577-1be626661601@axentia.se>
References: <20180417131052.16336-1-peda@axentia.se>
 <20180417131052.16336-7-peda@axentia.se> <20180418094428.6db785dc@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180418094428.6db785dc@bbrezillon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Daniel Vetter <daniel.vetter@intel.com>, Gustavo Padovan <gustavo@padovan.org>, Sean Paul <seanpaul@chromium.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 2018-04-18 09:44, Boris Brezillon wrote:
> On Tue, 17 Apr 2018 15:10:52 +0200
> Peter Rosin <peda@axentia.se> wrote:
> 
>> Bump the minor version while at it.
>>
>> Signed-off-by: Peter Rosin <peda@axentia.se>
>> ---
>>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>> index 8523c40fac94..aa48f287b5ca 100644
>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>> @@ -763,9 +763,9 @@ static struct drm_driver atmel_hlcdc_dc_driver = {
>>  	.fops = &fops,
>>  	.name = "atmel-hlcdc",
>>  	.desc = "Atmel HLCD Controller DRM",
>> -	.date = "20141504",
> 
> I guess I used YYYYDDMM format :-).
> 
>> +	.date = "20180409",
>>  	.major = 1,
>> -	.minor = 0,
>> +	.minor = 1,
> 
> Don't know what the strategy is regarding date and minor version
> updates. I never had to update that before, so I guess it's not
> important to userspace anyway.

I have no clue what strategy should be employed. I assume it's
for easier communication when features are backported into stable
or distro kernels and users wonder what to expect or for easier
triage of bug reports or something?? Anyway, I don't really care,
the date just looked really odd. So feel free to only patch the
.date to 20140415 or whatever. I'll drop this patch.

Cheers,
Peter

>>  };
>>  
>>  static int atmel_hlcdc_dc_drm_init(struct platform_device *pdev)
> 
