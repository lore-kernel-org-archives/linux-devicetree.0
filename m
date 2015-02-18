From: zhangfei <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v4 4/4] phy: add phy-hi6220-usb
Date: Wed, 18 Feb 2015 13:44:21 +0800
Message-ID: <54E426B5.4070206@linaro.org>
References: <1423726646-30336-1-git-send-email-zhangfei.gao@linaro.org> <1423726646-30336-5-git-send-email-zhangfei.gao@linaro.org> <54E4249C.9050404@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54E4249C.9050404@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, balbi@ti.com, mark.rutland@arm.com, Peter Chen <peter.chen@freescale.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "dan . zhao" <dan.zhao@hisilicon.com>, Wangbinghui <wangbinghui@hisilicon.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi, Kishon

On 02/18/2015 01:35 PM, Kishon Vijay Abraham I wrote:
> Hi,
>
> On Thursday 12 February 2015 01:07 PM, Zhangfei Gao wrote:
>> Add usb phy controller for hi6220 platform
>>
>> Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>
>> ---
>>   drivers/phy/Kconfig          |   9 ++
>>   drivers/phy/Makefile         |   1 +
>>   drivers/phy/phy-hi6220-usb.c | 306
>> +++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 316 insertions(+)
>>   create mode 100644 drivers/phy/phy-hi6220-usb.c
>
> why is this driver in drivers/phy when it doesn't use the generic PHY
> framework at all?
>

Balbi recommended "new drivers only on drivers/phy/", including usb phy.
So Move drivers/usb/phy/phy-hi6220-usb.c to 
drivers/phy/phy-hi6220-usb.c, required by Balbi.

Thanks
