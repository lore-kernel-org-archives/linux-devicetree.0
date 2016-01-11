From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] mtd: spi-nor: add hisilicon spi-nor flash controller driver
Date: Sun, 10 Jan 2016 21:09:31 -0600
Message-ID: <CAL_Jsq+K-tF=snhq+w9yYQKmAxbxDSLq6cv5fLfWjHTgdJxQWQ@mail.gmail.com>
References: <1452216405-10826-1-git-send-email-xuejiancheng@huawei.com>
 <20160109154249.GA28102@rob-hp-laptop> <56930369.1050000@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56930369.1050000@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: xuejiancheng <xuejiancheng@huawei.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, shijie.huang@intel.com, pengbinquan@huawei.com, han.xu@freescale.com, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Fabio Estevam <fabio.estevam@freescale.com>, Joachim Eastwood <manabian@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, suwenping@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com, zhangzhenxing@hisilicon.com, xuejiancheng@hisilicon.com
List-Id: devicetree@vger.kernel.org

On Sun, Jan 10, 2016 at 7:20 PM, xuejiancheng <xuejiancheng@huawei.com> wrote:
> Hi Rob,
>
> On 2016/1/9 23:42, Rob Herring wrote:
>> On Fri, Jan 08, 2016 at 09:26:45AM +0800, Jiancheng Xue wrote:
>>> add hisilicon spi-nor flash controller driver
>>>
>>> Signed-off-by: Binquan Peng <pengbinquan@huawei.com>
>>> Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
>>> ---

>>> +Required properties:
>>> +- compatible : Should be "hisilicon,hisi-sfc".
>>
>> I missed this last time, but you also need a more specific compatible
>> string with the SOC name in it.
>>
>
> This IP block is used in many SOCs. Do I need to add a specific compatible
> string for every SOC? Thank you.

Yes. You can keep the generic one for driver matching, but you want to
have the specific one in case there ever is a quirk/errata in a
specific SOC.

Rob
