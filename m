From: zhangfei <zhangfei.gao@linaro.org>
Subject: Re: [PATCH 2/2] i2c: designware: Add i2c-designware-hs
Date: Mon, 10 Jun 2013 00:03:25 +0800
Message-ID: <51B4A74D.3040908@linaro.org>
References: <1370745402-11844-1-git-send-email-zhangfei.gao@linaro.org>
 <1370745402-11844-3-git-send-email-zhangfei.gao@linaro.org>
 <20130609032300.GB4312@tarshish>
 <CAMj5BkhPp_-b19WFM-XitJ5-qDd9-dETp7UdNRLkRbdcq_h-Vg@mail.gmail.com>
 <20130609095026.GF4312@tarshish>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130609095026.GF4312@tarshish>
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
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, device-tree <devicetree-discuss@lists.ozlabs.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, zhangfei gao <zhangfei.gao@gmail.com>, Wolfram Sang <wsa@the-dreams.de>
List-Id: devicetree@vger.kernel.org



>> What in case private register have to be accessed?
>
> Good question. I don't know what is the common convention in this case. Do you
> have such a need here?

Originally, there is private register for tuning timing of clk and data.
Suppose there may some issue of catching data in clk trigger stage.
However, in the test, still not need to set timing yet.

>
>> struct dw_i2c_data {
>>          u32 accessor_flags;
>>          unsigned int tx_fifo_depth;
>>          unsigned int rx_fifo_depth;
>> };
>>
>> static struct dw_i2c_data hisilicon_data = {
>>          .accessor_flags = ACCESS_32BIT,
>
> This should be detected automatically in i2c_dw_init(). When ACCESS_16BIT is
> not set, access is 32bit wide. Doesn't it work for you?

Cool, this works, then the first patch can be ignored at all.
My bad, not check when no value of DW_IC_COMP_TYPE.

>
>>          .tx_fifo_depth = 16,
>>          .rx_fifo_depth = 16,
>
> These should be encoded in new device-tree properties named "tx-fifo-size",
> and "rx-fifo-size". For example, see
> Documentation/devicetree/bindings/powerpc/4xx/emac.txt.

OK, will add these two property to
Documentation/devicetree/bindings/i2c/i2c-designware.txt

Besides, would you mind change
subsys_initcall(dw_i2c_init_driver);
to
module_platform_driver(dw_i2c_driver);
Otherwise default pinctrl can not be auto-set, since subsys_initcall is 
too early.

Thanks
