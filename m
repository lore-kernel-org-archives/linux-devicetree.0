From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 6/6] pinctrl: mt8173: set GPIO16 to usb iddig mode
Date: Wed, 11 May 2016 13:56:11 +0200
Message-ID: <CACRpkdaeD5mk7LXEWnE0=Xute8-JA-fa4tVt4fYhujEXeq2+9w@mail.gmail.com>
References: <1462868614-20602-1-git-send-email-chunfeng.yun@mediatek.com>
	<1462868614-20602-7-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1462868614-20602-7-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Maoguang Meng <maoguang.meng@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>, Alan Stern <stern@rowland.harvard.edu>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Pawel Moll <pawel.moll@arm.com>, Kumar Gala <galak@codeaurora.org>, Sascha Hauer <s.hauer@pengutronix.de>, Biao Huang <biao.huang@mediatek.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>l
List-Id: devicetree@vger.kernel.org

On Tue, May 10, 2016 at 10:23 AM, Chunfeng Yun
<chunfeng.yun@mediatek.com> wrote:

> the default mode of GPIO16 pin is gpio, when set EINT16 to
> IRQ_TYPE_LEVEL_HIGH, no interrupt is triggered, it can be
> fixed when set its default mode as usb iddig.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

This looks like it can be merged orthogonally to all the
other patches, but I don't understand the patch or if it
is correct.

Hongzhou/Yingjoe, can either of you review this patch?

Yours,
Linus Walleij
