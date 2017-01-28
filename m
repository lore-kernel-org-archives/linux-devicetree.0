From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/3] Documentation: dt-bindings: add the Amlogic Meson
 SAR ADC documentation
Date: Sat, 28 Jan 2017 12:30:11 +0000
Message-ID: <4611e3bf-8e25-9f7c-7c34-6eca85ffc3d6@kernel.org>
References: <20170122181714.6259-1-martin.blumenstingl@googlemail.com>
 <20170122181714.6259-2-martin.blumenstingl@googlemail.com>
 <20170123204432.2lkh3zlgzmwye3hj@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170123204432.2lkh3zlgzmwye3hj@rob-hp-laptop>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 23/01/17 20:44, Rob Herring wrote:
> On Sun, Jan 22, 2017 at 07:17:12PM +0100, Martin Blumenstingl wrote:
>> This adds the devicetree binding documentation for the SAR ADC found in
>> Amlogic Meson SoCs.
>> Currently only the GXBB, GXL and GXM SoCs are supported.
>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>> Tested-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>> Reviewed-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
>> ---
>>  .../bindings/iio/adc/amlogic,meson-saradc.txt      | 32 ++++++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
Applied to the togreg branch of iio.git - initially pushed out as testing.

Thanks,

Jonathan
