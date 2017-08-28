From: Amelie DELAUNAY <amelie.delaunay@st.com>
Subject: Re: [PATCH 1/7] dt-bindings: usb: Document the STM32F7xx DWC2 USB OTG
 HS core binding
Date: Mon, 28 Aug 2017 08:13:27 +0000
Message-ID: <e46c3681-01e8-cb16-2ee8-5947bdd6b62c@st.com>
References: <1502962386-6683-1-git-send-email-amelie.delaunay@st.com>
 <1502962386-6683-2-git-send-email-amelie.delaunay@st.com>
 <20170822021059.suqqn7332sjbvfj3@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170822021059.suqqn7332sjbvfj3@rob-hp-laptop>
Content-Language: en-US
Content-ID: <66823F11415467469540A1E5FD76C9A2@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, John Youn <johnyoun@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Benjamin GAIGNARD <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org



On 08/22/2017 04:10 AM, Rob Herring wrote:
> On Thu, Aug 17, 2017 at 11:33:00AM +0200, Amelie Delaunay wrote:
>> This patch adds binding documentation for DWC2 controller in HS mode found
>> on STMicroelectronics STM32F7xx SoC.
>>
>> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
>> ---
>>   Documentation/devicetree/bindings/usb/dwc2.txt | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
>> index fcf199b..e64d903 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc2.txt
>> +++ b/Documentation/devicetree/bindings/usb/dwc2.txt
>> @@ -19,6 +19,8 @@ Required properties:
>>     configured in FS mode;
>>     - "st,stm32f4x9-hsotg": The DWC2 USB HS controller instance in STM32F4x9 SoCs
>>     configured in HS mode;
>> +  - "st,stm32f7xx-hsotg": The DWC2 USB HS controller instance in STM32F7xx SoCs
>> +    configured in HS mode;
> 
> Don't use wildcards in compatible strings (not sure how the previous one
> snuck in). Just "stm32f7" (i.e. just drop the xx) is probably specific
> enough though.
OK to drop the "xx", I used them only to match the previous one.

> 
>>   - reg : Should contain 1 register range (address and length)
>>   - interrupts : Should contain 1 interrupt
>>   - clocks: clock provider specifier
>> -- 
>> 2.7.4
>>
