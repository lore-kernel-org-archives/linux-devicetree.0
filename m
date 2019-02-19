From: Chen Yu <chenyu56@huawei.com>
Subject: Re: [PATCH v2 00/10] Add support for usb on Hikey960
Date: Tue, 19 Feb 2019 09:34:33 +0800
Message-ID: <5e884818-7afe-e76c-a181-81d3b78f40bf@huawei.com>
References: <20190218112310.17860-1-chenyu56@huawei.com>
 <b1aca3d0-547a-51bd-5bff-69652484b6cc@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b1aca3d0-547a-51bd-5bff-69652484b6cc@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Valentin Schneider <valentin.schneider@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: liuyu712@hisilicon.com, john.stultz@linaro.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, wanghu17@hisilicon.com, butao@hisilicon.com, chenyao11@huawei.com, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei@hisilicon.com, xuyiping@hisilicon.com, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com
List-Id: devicetree@vger.kernel.org

Hi,

On 2019/2/19 1:30, Valentin Schneider wrote:
> Hi,
> 
> On 18/02/2019 11:23, Yu Chen wrote:
>> The patchset adds support for usb functionality of Hikey960, includes:
>> - dwc3 driver for Hisilicon Kirin Soc hi3660
>> - usb driver for HiKey960 board
>> - some adjustment in dwc3, usb gadget and typec driver
>> - dts for support usb of HiKey960
>>
> 
> I want to try this out on my HiKey960, but I can't get the USB A ports
> working (tried USB stick and USB eth adapter).
> 
> On top of the arm64 defconfig, I've enabled (with menuconfig):
> 
> 	CONFIG_PHY_HI3660_USB
> 	CONFIG_HISI_HIKEY_USB
> 
> Am I missing something? FYI up until now I've carried over Fan Ning's old
> USB patch-set and that works fine, so I think it might just be a
> configuration error from my end.

This patch set based on Heikki Krogerus's patches.
Have you applied https://do-db2.lkml.org/lkml/2019/2/13/106 first?
And these configs should be set to y:
	CONFIG_TYPEC
	CONFIG_TYPEC_TCPM
	CONFIG_TYPEC_TCPCI
	CONFIG_TYPEC_RT1711H

> 
> Thanks,
> Valentin
> 
> 
> 
> .
> 

Thanks,
Yu Chen
