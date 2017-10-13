From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v2 7/9] usb: host: modify description for MTK xHCI config
Date: Fri, 13 Oct 2017 13:32:14 +0300
Message-ID: <59E0962E.9030508@linux.intel.com>
References: <994382d16d6bdc0f3d7c11b22f1710252e056e34.1507882470.git.chunfeng.yun@mediatek.com>
 <37153cd259af6e1fc34b32a2e0dd1a15b8214579.1507882470.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <37153cd259af6e1fc34b32a2e0dd1a15b8214579.1507882470.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Rob Herring <robh+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 13.10.2017 11:26, Chunfeng Yun wrote:
> Due to all MediaTek SoCs with xHCI host controller use this
> driver, remove limitation for specific SoCs
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---

xHCI parts of series look good to me, If Rob Herring agrees with the
dt changes I can send it forward

-Mathias
