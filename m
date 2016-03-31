From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH 03/18] ARM: dts: vf610-colibri: GPIO wakeup key
Date: Thu, 31 Mar 2016 10:55:13 -0700
Message-ID: <fa5e44e044a2fd8056886c72db2f8483@agner.ch>
References: <1457576219-7971-1-git-send-email-stefan@agner.ch>
 <1457576219-7971-4-git-send-email-stefan@agner.ch>
 <20160331081908.GV28207@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160331081908.GV28207@tiger>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, kernel@pengutronix.de, sergeimir@emcraft.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2016-03-31 01:19, Shawn Guo wrote:
> On Wed, Mar 09, 2016 at 06:16:44PM -0800, Stefan Agner wrote:
>> Enable GPIO wakeup key on Vybrid PAD 41 which is routed to the
>> Colibri default wakeup pin SO-DIMM 45.
>>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
> 
> I think this one can be merged independently, right?  One small comment
> below though.
> 

Yes, shouldn't cause any trouble even if wakeup/suspend is not yet
implemented.

>> ---
>>  arch/arm/boot/dts/vf-colibri-eval-v3.dtsi | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi b/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
>> index 4d8b7f6..936ece6 100644
>> --- a/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
>> +++ b/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
>> @@ -39,6 +39,8 @@
>>   *     OTHER DEALINGS IN THE SOFTWARE.
>>   */
>>
>> +#include <dt-bindings/input/input.h>
>> +
>>  / {
>>  	chosen {
>>  		stdout-path = "serial0:115200n8";
>> @@ -74,6 +76,20 @@
>>  		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>; /* USBH_PEN resp. USBH_P_EN */
>>  		vin-supply = <&reg_5v0>;
>>  	};
>> +
>> +	gpio-keys {
>> +		compatible = "gpio-keys";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&pinctrl_gpiokeys>;
>> +
>> +		power {
>> +			label = "Wake-Up";
>> +			gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
>> +			linux,code = <KEY_WAKEUP>;
>> +			debounce-interval = <10>;
>> +			gpio-key,wakeup;
> 
> Please use generic 'wakeup-source' instead.  See the following document
> for details.
> 
> Documentation/devicetree/bindings/power/wakeup-source.txt

Will do.
