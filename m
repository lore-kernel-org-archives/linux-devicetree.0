From: Anurup M <anurupvasu@gmail.com>
Subject: Re: [PATCH v5 02/11] dt-bindings: hisi: Add Hisilicon HiP05/06/07
 Djtag dts bindings
Date: Fri, 3 Mar 2017 15:18:46 +0530
Message-ID: <58B93BFE.2040307@gmail.com>
References: <1488451716-88735-1-git-send-email-anurup.m@huawei.com>
 <20170303065048.zhyujv4bsuvmlrcq@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170303065048.zhyujv4bsuvmlrcq@rob-hp-laptop>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, wangkefeng.wang@huawei.com, gabriele.paoloni@huawei.com, huangdaode@hisilicon.com, tanxiaojun@huawei.com, john.garry@huawei.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, xuwei5@hisilicon.com, linuxarm@huawei.com, zhangshaokun@hisilicon.com, sanil.kumar@hisilicon.com, anurup.m@huawei.com, dikshit.n@huawei.com, shyju.pv@huawei.com, linux-arm-kernel@lists.infradead.org, shiju.jose@huawei.com
List-Id: devicetree@vger.kernel.org



On Friday 03 March 2017 12:20 PM, Rob Herring wrote:
> On Thu, Mar 02, 2017 at 05:48:36AM -0500, Anurup M wrote:
>> From: Tan Xiaojun <tanxiaojun@huawei.com>
>>
>> Add Hisilicon HiP05/06/07 Djtag dts bindings for CPU and IO Die
>>
>> Signed-off-by: Tan Xiaojun <tanxiaojun@huawei.com>
>> Signed-off-by: Anurup M <anurup.m@huawei.com>
>> ---
>>   .../devicetree/bindings/arm/hisilicon/djtag.txt    | 51 ++++++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/arm/hisilicon/djtag.txt
> Please add acks when posting new versions.

There was a correction in the example in 02/11 and also 03/11 for 
removal of IRQ of MN PMU.
So I did not add the acks. I shall make sure to add them in newer versions.

Thanks,
Anurup

> Rob
