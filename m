From: Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [PATCH v2 00/10] Add support for usb on Hikey960
Date: Tue, 19 Feb 2019 11:31:05 +0000
Message-ID: <ad5c5f33-612b-8580-b816-8e9304b10b9d@arm.com>
References: <20190218112310.17860-1-chenyu56@huawei.com>
 <b1aca3d0-547a-51bd-5bff-69652484b6cc@arm.com>
 <5e884818-7afe-e76c-a181-81d3b78f40bf@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5e884818-7afe-e76c-a181-81d3b78f40bf@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chen Yu <chenyu56@huawei.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: liuyu712@hisilicon.com, john.stultz@linaro.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, wanghu17@hisilicon.com, butao@hisilicon.com, chenyao11@huawei.com, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei@hisilicon.com, xuyiping@hisilicon.com, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com
List-Id: devicetree@vger.kernel.org

On 19/02/2019 01:34, Chen Yu wrote:
[...]
> This patch set based on Heikki Krogerus's patches.
> Have you applied https://do-db2.lkml.org/lkml/2019/2/13/106 first?
> And these configs should be set to y:
> 	CONFIG_TYPEC
> 	CONFIG_TYPEC_TCPM
> 	CONFIG_TYPEC_TCPCI
> 	CONFIG_TYPEC_RT1711H
> 

I was based on the right stack but didn't have those configs. It seems to
be working fine now, thanks!

Tested-by: Valentin Schneider <valentin.schneider@arm.com>
