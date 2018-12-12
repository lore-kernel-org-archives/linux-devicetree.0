From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: Re: [PATCH 1/3] dt-bindings: mfd: syscon: Add optional clock support
Date: Wed, 12 Dec 2018 09:18:56 +0100
Message-ID: <79817f52-0430-acd9-857e-c53f358c87c2@st.com>
References: <1543337297-21873-1-git-send-email-fabrice.gasnier@st.com>
 <1543337297-21873-2-git-send-email-fabrice.gasnier@st.com>
 <20181211221653.GA18104@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181211221653.GA18104@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: lee.jones@linaro.org, alexandre.torgue@st.com, mcoquelin.stm32@gmail.com, arnd@arndb.de, mark.rutland@arm.com, gabriel.fernandez@st.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 12/11/18 11:16 PM, Rob Herring wrote:
> On Tue, Nov 27, 2018 at 05:48:15PM +0100, Fabrice Gasnier wrote:
>> Some system control registers need to be clocked, so the registers can
>> be accessed. Add an optional clock.
>>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
>> ---
>>  Documentation/devicetree/bindings/mfd/syscon.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/syscon.txt b/Documentation/devicetree/bindings/mfd/syscon.txt
>> index 25d9e9c..a9aaa51 100644
>> --- a/Documentation/devicetree/bindings/mfd/syscon.txt
>> +++ b/Documentation/devicetree/bindings/mfd/syscon.txt
>> @@ -17,6 +17,7 @@ Optional property:
>>  - reg-io-width: the size (in bytes) of the IO accesses that should be
>>    performed on the device.
>>  - hwlocks: reference to a phandle of a hardware spinlock provider node.
>> +- clocks: phandle to the syscon clock
> 
> No. Add clocks to specific bindings using syscon. If you have a node 
> with only 'syscon', then that should be fixed.

Hi Rob,

Thanks for reviewing, so I'll
- add it to Documentation/devicetree/bindings/arm/stm32/stm32-syscon.txt
- send a v2 with this change.

Best regards,
Fabrice
> 
> Rob
> 
