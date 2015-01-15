From: Ding Tianhong <dingtianhong@huawei.com>
Subject: Re: [PATCH net-next v13 3/3] net: hisilicon: new hip04 ethernet driver
Date: Thu, 15 Jan 2015 10:54:24 +0800
Message-ID: <54B72BE0.7040403@huawei.com>
References: <1421217254-12008-1-git-send-email-dingtianhong@huawei.com> <1421217254-12008-4-git-send-email-dingtianhong@huawei.com> <3131780.HetDHI4Cfl@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <3131780.HetDHI4Cfl@wuerfel>
Sender: netdev-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: robh+dt@kernel.org, davem@davemloft.net, grant.likely@linaro.org, agraf@suse.de, sergei.shtylyov@cogentembedded.com, linux-arm-kernel@lists.infradead.org, eric.dumazet@gmail.com, xuwei5@hisilicon.com, zhangfei.gao@linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux@arm.linux.org.uk
List-Id: devicetree@vger.kernel.org

On 2015/1/14 16:53, Arnd Bergmann wrote:
> On Wednesday 14 January 2015 14:34:14 Ding Tianhong wrote:
>> +#define HIP04_MAX_TX_COALESCE_USECS    200
>> +#define HIP04_MIN_TX_COALESCE_USECS    100
>> +#define HIP04_MAX_TX_COALESCE_FRAMES   200
>> +#define HIP04_MIN_TX_COALESCE_FRAMES   100
> 
> It's not important, but in case you are creating another version of the
> patch, maybe the allowed range can be extended somewhat. The example values
> I picked when I sent my suggestion were really made up. It's great if
> they work fine, but users might want to  tune this far more depending on
> their workloads,  How about these
> 
> #define HIP04_MAX_TX_COALESCE_USECS    100000
> #define HIP04_MIN_TX_COALESCE_USECS    1
> #define HIP04_MAX_TX_COALESCE_FRAMES   (TX_DESC_NUM - 1)
> #define HIP04_MIN_TX_COALESCE_FRAMES   1
> 

Is it really ok that the so big range may break the driver and hip04 could not work fine?
I am not sure it is ok, I will fix it in next version.
 
Ding

> 	Arnd
> 
> .
> 
