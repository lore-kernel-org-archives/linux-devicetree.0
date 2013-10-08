From: boris brezillon <b.brezillon@overkiz.com>
Subject: Re: [PATCH v3 07/19] clk: at91: add pll id macros for pll dt bindings
Date: Tue, 08 Oct 2013 14:03:56 +0200
Message-ID: <5253F4AC.8050407@overkiz.com>
References: <1375937608-3773-1-git-send-email-b.brezillon@overkiz.com>
 <1375942160-8881-1-git-send-email-b.brezillon@overkiz.com>
 <5253DEBD.7010904@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5253DEBD.7010904@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Andrew Victor <linux@maxim.org.za>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Russell King <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ludovic Desroches <ludovic.desroches@atmel.com>, Josh Wu <josh.wu@atmel.com>, Richard Genoud <richard.genoud@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 08/10/2013 12:30, Nicolas Ferre wrote:
> On 08/08/2013 08:09, Boris BREZILLON :
>> This patch adds the PLL id macros which will be used by pll dt 
>> definitions.
>
> It is not needed, drop it. Just document the values in the DT biding 
> and it will be fine.

I'll drop (and document) it.

>
>>
>> Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
>> ---
>>   include/dt-bindings/clk/at91/common/clk-pll.h |   13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>   create mode 100644 include/dt-bindings/clk/at91/common/clk-pll.h
>>
>> diff --git a/include/dt-bindings/clk/at91/common/clk-pll.h 
>> b/include/dt-bindings/clk/at91/common/clk-pll.h
>> new file mode 100644
>> index 0000000..93ec849
>> --- /dev/null
>> +++ b/include/dt-bindings/clk/at91/common/clk-pll.h
>> @@ -0,0 +1,13 @@
>> +/*
>> + * This header provides constants for AT91 pll ids.
>> + *
>> + * The constants defined in this header are being used in dts.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLK_AT91_PLL_H
>> +#define _DT_BINDINGS_CLK_AT91_PLL_H
>> +
>> +#define AT91_PLLA_CLK        0    /* PLLA clk id */
>> +#define AT91_PLLB_CLK        1    /* PLLB clk id */
>> +
>> +#endif
>>
>
>
