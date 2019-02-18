From: Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [PATCH v2 00/10] Add support for usb on Hikey960
Date: Mon, 18 Feb 2019 17:30:11 +0000
Message-ID: <b1aca3d0-547a-51bd-5bff-69652484b6cc@arm.com>
References: <20190218112310.17860-1-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190218112310.17860-1-chenyu56@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yu Chen <chenyu56@huawei.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: john.stultz@linaro.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, liuyu712@hisilicon.com, wanghu17@hisilicon.com, butao@hisilicon.com, chenyao11@huawei.com, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei@hisilicon.com, xuyiping@hisilicon.com, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com
List-Id: devicetree@vger.kernel.org

Hi,

On 18/02/2019 11:23, Yu Chen wrote:
> The patchset adds support for usb functionality of Hikey960, includes:
> - dwc3 driver for Hisilicon Kirin Soc hi3660
> - usb driver for HiKey960 board
> - some adjustment in dwc3, usb gadget and typec driver
> - dts for support usb of HiKey960
> 

I want to try this out on my HiKey960, but I can't get the USB A ports
working (tried USB stick and USB eth adapter).

On top of the arm64 defconfig, I've enabled (with menuconfig):

	CONFIG_PHY_HI3660_USB
	CONFIG_HISI_HIKEY_USB

Am I missing something? FYI up until now I've carried over Fan Ning's old
USB patch-set and that works fine, so I think it might just be a
configuration error from my end.

Thanks,
Valentin
