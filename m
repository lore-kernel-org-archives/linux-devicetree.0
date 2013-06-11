From: zhangfei <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v2 2/2] i2c: designware: add two optional property
 tx/rx-fifo-size
Date: Tue, 11 Jun 2013 10:13:57 +0800
Message-ID: <51B687E5.307@linaro.org>
References: <1370840576-15651-1-git-send-email-zhangfei.gao@linaro.org>
 <1370840576-15651-3-git-send-email-zhangfei.gao@linaro.org>
 <20130610184954.GK4312@tarshish>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130610184954.GK4312@tarshish>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Wolfram Sang <wsa@the-dreams.de>
List-Id: devicetree@vger.kernel.org

On 13-06-11 02:49 AM, Baruch Siach wrote:
> Hi Zhangfei Gao,
>
> On Mon, Jun 10, 2013 at 01:02:55PM +0800, Zhangfei Gao wrote:
>> rx-fifo-size and tx-fifo-size will be updated if provided from dts
>>
>> Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>
>> CC: Baruch Siach <baruch@tkos.co.il>
>> ---
>>   .../devicetree/bindings/i2c/i2c-designware.txt     |    7 +++++++
>>   drivers/i2c/busses/i2c-designware-platdrv.c        |    3 +++
>>   2 files changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-designware.txt b/Documentation/devicetree/bindings/i2c/i2c-designware.txt
>> index e42a2ee..61fdb44 100644
>> --- a/Documentation/devicetree/bindings/i2c/i2c-designware.txt
>> +++ b/Documentation/devicetree/bindings/i2c/i2c-designware.txt
>> @@ -6,6 +6,11 @@ Required properties :
>>    - reg : Offset and length of the register set for the device
>>    - interrupts : <IRQ> where IRQ is the interrupt number.
>>
>> +Optional properties:
>> +
>> + - rx-fifo-size : 1 cell, Rx fifo threshold
>
> I'd use the word 'size' instead of 'threshold' here. The term 'threshold' is
> used for something else in the datasheet.
>
> baruch
>
OK, will update and resend the patch.
