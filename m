From: Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [PATCH v6 00/13] Add support for usb on Hikey960
Date: Mon, 29 Apr 2019 16:42:57 +0100
Message-ID: <766eb894-f939-02d2-5a3b-03fb51f7c4ee@arm.com>
References: <20190420064019.57522-1-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190420064019.57522-1-chenyu56@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yu Chen <chenyu56@huawei.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: john.stultz@linaro.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, liuyu712@hisilicon.com, wanghu17@hisilicon.com, butao@hisilicon.com, chenyao11@huawei.com, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei@hisilicon.com, xuyiping@hisilicon.com, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com
List-Id: devicetree@vger.kernel.org

Hi,

On 20/04/2019 07:40, Yu Chen wrote:
> The patchset adds support for usb functionality of Hikey960, includes:
> - usb phy driver for Hisilicon Kirin Soc hi3660
> - usb driver for HiKey960 board
> - some adjustment in dwc3 and usb role driver
> - dts for support usb of HiKey960
> 

Still works fine on my Debian setup:

Tested-by: Valentin Schneider <valentin.schneider@arm.com>

Thanks,
Valentin
