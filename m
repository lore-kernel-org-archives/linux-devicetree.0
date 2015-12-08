From: zhangfei <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v2 4/9] ARM: dts: add dts files for hi3519-demb board
Date: Tue, 08 Dec 2015 11:28:20 +0800
Message-ID: <56664E54.4040604@linaro.org>
References: <1449110668-23647-1-git-send-email-xuejiancheng@huawei.com>
 <1728470.0OiiXMcl88@wuerfel> <5660FA2E.6040601@huawei.com>
 <3047121.2z9SCS5Au2@wuerfel> <56652912.80308@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <56652912.80308@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: xuejiancheng <xuejiancheng@huawei.com>, Arnd Bergmann <arnd@arndb.de>
Cc: mark.rutland@arm.com, suwenping@hisilicon.com, khilman@linaro.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, ml.yang@hisilicon.com, linux-kernel@vger.kernel.org, xuwei5@hisilicon.com, yanhaifeng@hisilicon.com, bintian.wang@huawei.com, devicetree@vger.kernel.org, robh+dt@kernel.org, gaofei@hisilicon.com, haojian.zhuang@linaro.org, galak@codeaurora.org, olof@lixom.net, yanghongwei@hisilicon.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 12/07/2015 02:37 PM, xuejiancheng wrote:

>> As this seems to be a standard part, we can also think about making a
>> high-level driver for in in drivers/soc rather than relying on the syscon
>> driver which we tend to use more for one-off devices with random register
>> layouts.
>>
>     Sorry. I didn't understand your meaning well and maybe I gave you a wrong description.
> Please allow me to clarify it again.
>     The "sysctrl" nodes here is just used for the "reboot" function. It is corresponding to
> the driver "drivers/power/reset/hisi-reboot.c". The compatible string in the driver is
> "hisilicon,sysctrl".


Pls try use drivers/power/reset/syscon-reboot.c

Thanks
