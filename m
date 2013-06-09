From: zhangfei gao <zhangfei.gao@gmail.com>
Subject: Re: [PATCH 2/2] i2c: designware: Add i2c-designware-hs
Date: Sun, 9 Jun 2013 16:59:48 +0800
Message-ID: <CAMj5BkhPp_-b19WFM-XitJ5-qDd9-dETp7UdNRLkRbdcq_h-Vg@mail.gmail.com>
References: <1370745402-11844-1-git-send-email-zhangfei.gao@linaro.org>
 <1370745402-11844-3-git-send-email-zhangfei.gao@linaro.org>
 <20130609032300.GB4312@tarshish>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130609032300.GB4312@tarshish>
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
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, Zhangfei Gao <zhangfei.gao@linaro.org>, device-tree <devicetree-discuss@lists.ozlabs.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Wolfram Sang <wsa@the-dreams.de>
List-Id: devicetree@vger.kernel.org

>> +++ b/Documentation/devicetree/bindings/i2c/i2c-designware-hs.txt
>> @@ -0,0 +1,30 @@
>> +* Hisilicon I2C Controller
>> +
>> +Required properties :
>> +
>> + - compatible : should be "hisilicon,designware-i2c"
>> + - reg : Offset and length of the register set for the device
>> + - interrupts : <IRQ> where IRQ is the interrupt number.
>> +
>> +Example :
>> +
>> +     i2c0: i2c@fcb08000 {
>> +             compatible = "hs,designware-i2c";
>
> A few comments on this one:
>
> 1. You should Cc devicetree-discuss@lists.ozlabs.org on patches touching ftd
>    bindings (added to Cc)
>
> 2. The convention is to use the IC block designer in the "compatible" property
>    prefix, in this case Symopsys (snps)
>
> 3. This does not match the compatible property in hs_dw_i2c_of_match[] below
>    where you use "hisilicon,designware-i2c"
>
> 4. Please update Documentation/devicetree/bindings/vendor-prefixes.txt when
>    adding new vendor prefixes

Thanks Baruch for the kind education, really useful.
How about using .compatible = "snps,hisilicon-i2c"

>> +     Client in i2c0 bus with add 0x58 could be added as example
>> +     i2c0: i2c@fcb08000 {
>> +             status = "ok";
>
> The convention is to use "okay".
got it.

>
>> +             pinctrl-names = "default";
>> +             pinctrl-0 = <&i2c0_pmx_func &i2c0_cfg_func>;
>> +             i2c_client1: i2c_client@58 {
>> +                     compatible = "hisilicon,i2c_client_tpa2028";
>> +                     reg = <0x58>;
>> +             };
>> +     };
>
> [...]
>
> The code below looks like a direct copy of i2c-designware-platdrv.c. Is there
> any reason you can't use that code instead?

Not understood i2c-designware-platdrv.c can be directly touched.
Usually, there is register function, or external function call.

It would be great if we could directly add hisilicon support in
i2c-designware-platdrv.c.
How about adding these code to distinguish.

The concern is will platdrv.c become bigger and bigger?
What in case private register have to be accessed?

struct dw_i2c_data {
        u32 accessor_flags;
        unsigned int tx_fifo_depth;
        unsigned int rx_fifo_depth;
};

static struct dw_i2c_data hisilicon_data = {
        .accessor_flags = ACCESS_32BIT,
        .tx_fifo_depth = 16,
        .rx_fifo_depth = 16,
};
{ .compatible = "snps,hisilicon-i2c", .data = &hisilicon_data},
