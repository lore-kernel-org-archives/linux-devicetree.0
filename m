From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v3 4/4] usb: musb: Add support for MediaTek musb
 controller
Date: Thu, 17 Jan 2019 06:33:42 -0800
Message-ID: <20190117143342.GS5544@atomide.com>
References: <1547709348-17506-1-git-send-email-min.guo@mediatek.com>
 <1547709348-17506-5-git-send-email-min.guo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1547709348-17506-5-git-send-email-min.guo@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: min.guo@mediatek.com
Cc: Bin Liu <b-liu@ti.com>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, hdegoede@redhat.com, Yonglong Wu <yonglong.wu@mediatek.com>
List-Id: devicetree@vger.kernel.org

Hi,

* min.guo@mediatek.com <min.guo@mediatek.com> [190117 07:16]:
> There are some quirk of MediaTek musb controller, such as:
>  -W1C interrupt status registers
>  -Private data toggle registers
>  -No dedicated DMA interrupt line

Can you please separate the musb generic changes listed above
into separate individual patches in preparation for adding
support for new hardware?

Otherwise we'll have hard time finding out with git bisect what
exactly breaks things if we run into trouble.

Regards,

Tony
