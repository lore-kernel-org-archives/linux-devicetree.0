From: Amelie DELAUNAY <amelie.delaunay@st.com>
Subject: Re: [PATCH 6/7] ARM: dts: stm32: Add USB FS support for STM32F746 MCU
Date: Thu, 17 Aug 2017 13:58:34 +0000
Message-ID: <6623149d-fe9d-a173-52d5-ee558d55ece4@st.com>
References: <1502962386-6683-1-git-send-email-amelie.delaunay@st.com>
 <1502962386-6683-7-git-send-email-amelie.delaunay@st.com>
 <804e0eb3-88a0-2847-9330-0f92d36f9f99@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <804e0eb3-88a0-2847-9330-0f92d36f9f99@cogentembedded.com>
Content-Language: en-US
Content-ID: <0BFD8DFFF673B54D9778ED92B8478BDF@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, John Youn <johnyoun@synopsys.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Benjamin GAIGNARD <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

On 08/17/2017 12:47 PM, Sergei Shtylyov wrote:
> On 8/17/2017 12:33 PM, Amelie Delaunay wrote:
> 
>> This patch adds the USB pins and nodes for USB FS core on STM32F746 SoC.
>>
>> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
>> ---
>>   arch/arm/boot/dts/stm32f746.dtsi | 31 +++++++++++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/stm32f746.dtsi 
>> b/arch/arm/boot/dts/stm32f746.dtsi
>> index fcfe5a6..a9476ea 100644
>> --- a/arch/arm/boot/dts/stm32f746.dtsi
>> +++ b/arch/arm/boot/dts/stm32f746.dtsi
>> @@ -419,6 +419,28 @@
>>                       slew-rate = <2>;
>>                   };
>>               };
>> +
>> +            usbotg_fs_pins_a: usbotg_fs@0 {
> 
>     Dashes are preferred to underlines in the node names.
You're right. I'll fix it in v2. Thanks.
> 
> [...]
> 
> MBR, Sergei

Regards,
Amelie
