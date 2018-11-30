From: Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH] ARM: dts: pxa3xx: Add Raumfeld DTS files
Date: Fri, 30 Nov 2018 18:49:23 +0100
Message-ID: <7aee6a27-1897-304d-4d1c-e8c31d960159@zonque.org>
References: <20181105194040.25406-1-daniel@zonque.org>
 <CAL_JsqJ9_nUu_iNOn7Eu91tcGO1xqFv-fYn4zEjLGim+kK4tXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqJ9_nUu_iNOn7Eu91tcGO1xqFv-fYn4zEjLGim+kK4tXQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Haojian Zhuang <haojian.zhuang@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thanks a lot for the review!

On 30/11/2018 3:51 PM, Rob Herring wrote:
> On Mon, Nov 5, 2018 at 1:41 PM Daniel Mack <daniel@zonque.org> wrote:

>> +               compatible = "spi-gpio";
>> +               #address-cells = <0x1>;
>> +               #size-cells = <0>;
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&spi_pins>;
>> +               gpio-sck = <&gpio 95 GPIO_ACTIVE_HIGH>;
>> +               gpio-miso = <&gpio 98 GPIO_ACTIVE_HIGH>;
>> +               gpio-mosi = <&gpio 97 GPIO_ACTIVE_HIGH>;
>> +               cs-gpios = <
>> +                       &gpio 34 GPIO_ACTIVE_HIGH
>> +                       &gpio 125 GPIO_ACTIVE_HIGH
>> +                       &gpio 96 GPIO_ACTIVE_HIGH
>> +               >;
>> +               num-chipselects = <3>;
> 
> Why do we have this when we can just get the length of cs-gpios?

That's a good question, but for now, the driver requires the node to be 
there. It can probably be cleaned up by a separate series.

>> +&pwri2c {
>> +       status = "okay";
>> +
>> +       max8660: regulator@34 {
>> +               compatible = "maxim,max8660";
>> +               reg = <0x34>;
>> +
>> +               regulators {
>> +                       regulator@0 {
> 
> Drop the unit-address as there is no reg property. Build your DT with
> W=12 and fix any new warnings these new files add (probably some are
> from the SoC dtsi).

This hint helped a lot. I've fixed numerous smaller problems in the SoC 
dtsi and will submit them together with a v2 of this patch.


Best regards,
Daniel
