From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] dt-bindings: reset: meson-g12a: Add missing USB2 PHY resets
Date: Fri, 22 Mar 2019 15:53:40 -0700
Message-ID: <7hbm2234i3.fsf@baylibre.com>
References: <20190304104916.3937-1-narmstrong@baylibre.com> <1553078122.7071.6.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553078122.7071.6.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Philip,

Philipp Zabel <p.zabel@pengutronix.de> writes:

> On Mon, 2019-03-04 at 11:49 +0100, Neil Armstrong wrote:
>> The G12A Documentation lacked these 2 reset lines, but they are present and
>> used for each USB 2 PHYs.
>> 
>> Add them to the dt-bindings for the upcoming USB support.
>> 
>> Fixes: dbfc54534dfc ("dt-bindings: reset: meson: add g12a bindings")
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  include/dt-bindings/reset/amlogic,meson-g12a-reset.h | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>> 
>> diff --git a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
>> index 8063e8314eef..6d487c5eba2c 100644
>> --- a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
>> +++ b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
>> @@ -51,7 +51,10 @@
>>  #define RESET_SD_EMMC_A			44
>>  #define RESET_SD_EMMC_B			45
>>  #define RESET_SD_EMMC_C			46
>> -/*					47-60 */
>> +/*					47	*/
>> +#define RESET_USB_PHY20			48
>> +#define RESET_USB_PHY21			49
>> +/*					50-60	*/
>>  #define RESET_AUDIO_CODEC		61
>>  /*					62-63	*/
>>  /*	RESET2					*/
>
> Thank you, applied to reset/fixes with Martin's review tag.

Could ou make a immtable tag for this in your tree?  This is needed for
some upcoming DT users we'd like to queue for the next cycle.

Thanks,

Kevin
