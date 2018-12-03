From: Krzysztof Opasiak <k.opasiak@samsung.com>
Subject: Re: [PATCH v1 11/12] usb: gadget: Add configfs attribuite for
 controling match_existing_only
Date: Mon, 3 Dec 2018 10:53:28 +0100
Message-ID: <1eafffa7-9183-d9c9-2d22-410cc6e0982a@samsung.com>
References: <20181203034515.91412-1-chenyu56@huawei.com>
        <CGME20181203034629epcas3p12958dc0d45a7de56c65d24390b4d0dd7@epcas3p1.samsung.com>
        <20181203034515.91412-12-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203034515.91412-12-chenyu56@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yu Chen <chenyu56@huawei.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: suzhuangluan@hisilicon.com, kongfei@hisilicon.com, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Stultz <john.stultz@linaro.org>, Binghui Wang <wangbinghui@hisilicon.com>
List-Id: devicetree@vger.kernel.org



On 03.12.2018 04:45, Yu Chen wrote:
> Currently the "match_existing_only" of usb_gadget_driver in configfs is
> set to one which is not flexible.
> Dwc3 udc will be removed when usb core switch to host mode. This causes
> failure of writing name of dwc3 udc to configfs's UDC attribuite.
> To fix this we need to add a way to change the config of
> "match_existing_only".
> This patch adds a configfs attribuite for controling match_existing_only
> which allow user to config "match_existing_only".
> 

To be honest I strongly disagree with that patch.
This attribute was intended for build-in gadgets to allow user to decide 
whether probe should fail or gadget should wait for UDC (used when 
gadget is built-in). For ConfigFS we expect the UDC to always exist 
prior to binding a gadget to it. If UDC goes away from what ever reason 
gadget should be unbound.

So what this patch does in my opinion is abusing the attribute and 
hacking the kernel instead of creating a simple udev rule that whenever 
dwc3 appears and it gadget should be enabled write its name to UDC 
attribute.

Best regards,
-- 
Krzysztof Opasiak
Samsung R&D Institute Poland
Samsung Electronics
