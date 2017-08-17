From: Amelie DELAUNAY <amelie.delaunay@st.com>
Subject: Re: [PATCH 4/7] ARM: dts: stm32: Enable USB HS on stm32746g-eval
Date: Thu, 17 Aug 2017 13:57:35 +0000
Message-ID: <b1aaf89c-33b5-d2db-73dd-89ad6c3a80c8@st.com>
References: <1502962386-6683-1-git-send-email-amelie.delaunay@st.com>
 <1502962386-6683-5-git-send-email-amelie.delaunay@st.com>
 <824d41f2-bea9-c1b6-4c3e-1ae146286d89@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <824d41f2-bea9-c1b6-4c3e-1ae146286d89@cogentembedded.com>
Content-Language: en-US
Content-ID: <57998DFA44736B4199FC3E2F735C6D45@st.com>
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

Hi!

On 08/17/2017 12:44 PM, Sergei Shtylyov wrote:
> Hello!
> 
> On 8/17/2017 12:33 PM, Amelie Delaunay wrote:
> 
>> This patch enables USB HS on stm32746g-eval (Host mode).
>>
>> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
>> ---
>>   arch/arm/boot/dts/stm32746g-eval.dts | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/stm32746g-eval.dts 
>> b/arch/arm/boot/dts/stm32746g-eval.dts
>> index 69a9579..944501d 100644
>> --- a/arch/arm/boot/dts/stm32746g-eval.dts
>> +++ b/arch/arm/boot/dts/stm32746g-eval.dts
>> @@ -83,6 +83,13 @@
>>               gpios = <&gpioc 13 0>;
>>           };
>>       };
>> +
>> +    usbotg_hs_phy: usbphy {
> 
>     Name it "usb-phy" please, tpo be m,ore in line with the DT spec.
OK, will be fixed in v2. Thanks!
> 
> [...]
> 
> MBR, Sergei

Regards,
Amelie
