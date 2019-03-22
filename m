From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 1/1] dt-bindings: clock: meson8b: drop the "ABP" clock
 definition
Date: Fri, 22 Mar 2019 16:53:33 -0700
Message-ID: <7hmulmzcsi.fsf@baylibre.com>
References: <20190319214123.27219-1-martin.blumenstingl@googlemail.com>
 <20190319214123.27219-2-martin.blumenstingl@googlemail.com>
 <b7d2edf1-da66-a09f-5f29-28f37ce3f06b@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <b7d2edf1-da66-a09f-5f29-28f37ce3f06b@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 19/03/2019 22:41, Martin Blumenstingl wrote:
>> Commit 8e1dd17c8b0e3f ("dt-bindings: clock: meson8b: export the CPU post
>> dividers") added a new clock ID "CLKID_ABP" which contains a typo. This
>> was fixed by adding a new (typo-free) #define CLKID_APB in
>> commit 40d08f774c17ad ("dt-bindings: clock: meson8b: add APB clock
>> definition").
>> Now that the new #define is used by the driver we can remove the old
>> one (because the old one is not used anywhere).
>> 
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> ---
>>  include/dt-bindings/clock/meson8b-clkc.h | 1 -
>>  1 file changed, 1 deletion(-)
>> 
>> diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
>> index 8067077a62ca..cd11628f50f8 100644
>> --- a/include/dt-bindings/clock/meson8b-clkc.h
>> +++ b/include/dt-bindings/clock/meson8b-clkc.h
>> @@ -103,7 +103,6 @@
>>  #define CLKID_MPLL1		94
>>  #define CLKID_MPLL2		95
>>  #define CLKID_NAND_CLK		112
>> -#define CLKID_ABP		124
>>  #define CLKID_APB		124
>>  #define CLKID_PERIPH		126
>>  #define CLKID_AXI		128
>> 
>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Neil / Jerome, I'm assuming you will queue this via the clk-meson tree?

Kevin
