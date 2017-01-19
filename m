From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: mt8173: add reference clock for usb
Date: Thu, 19 Jan 2017 13:23:53 +0100
Message-ID: <63ac4f16-5701-db0d-45a2-4af9ea5c57fc@gmail.com>
References: <1484719707-12107-1-git-send-email-chunfeng.yun@mediatek.com>
 <1484719707-12107-4-git-send-email-chunfeng.yun@mediatek.com>
 <20170119093747.GA17213@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170119093747.GA17213@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 19/01/17 10:37, Greg Kroah-Hartman wrote:
> On Wed, Jan 18, 2017 at 02:08:25PM +0800, Chunfeng Yun wrote:
>> add 26M reference clock for ssusb and xhci nodes
>>
>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>> ---
>>  arch/arm64/boot/dts/mediatek/mt8173.dtsi |    6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> This patch doesn't apply to my tree :(
>

This patch should go through my tree, but take into account my comment 
on patch 3/6. From my point of view this series is not ready to be merged.

Regards,
Matthias
