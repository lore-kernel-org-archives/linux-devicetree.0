From: chunfeng yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 6/6] pinctrl: mt8173: set GPIO16 to usb iddig mode
Date: Thu, 12 May 2016 09:41:22 +0800
Message-ID: <1463017282.11651.82.camel@mhfsdcap03>
References: <1462868614-20602-1-git-send-email-chunfeng.yun@mediatek.com>
	 <1462868614-20602-7-git-send-email-chunfeng.yun@mediatek.com>
	 <CACRpkdaeD5mk7LXEWnE0=Xute8-JA-fa4tVt4fYhujEXeq2+9w@mail.gmail.com>
	 <1462991546.11623.3.camel@mussux00>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462991546.11623.3.camel@mussux00>
Sender: linux-kernel-owner@vger.kernel.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Maoguang Meng <maoguang.meng@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>, Alan Stern <stern@rowland.harvard.edu>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Pawel Moll <pawel.moll@arm.com>, Kumar Gala <galak@codeaurora.org>, Sascha Hauer <s.hauer@pengutronix.de>, Biao Huang <biao.huang@mediatek.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.or
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, 2016-05-11 at 11:32 -0700, Hongzhou Yang wrote:
> On Wed, 2016-05-11 at 13:56 +0200, Linus Walleij wrote:
> > On Tue, May 10, 2016 at 10:23 AM, Chunfeng Yun
> > <chunfeng.yun@mediatek.com> wrote:
> > 
> > > the default mode of GPIO16 pin is gpio, when set EINT16 to
> > > IRQ_TYPE_LEVEL_HIGH, no interrupt is triggered, it can be
> > > fixed when set its default mode as usb iddig.
> > >
> > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > 
> 
> Chunfeng, GPIO16 can be used as EINT16 mode, but the pinmux should be 0.
> If you want to set its default mode to iddig, you should set it in dts.
> 
I set it in DTS, but it didn't work, because when usb driver requested
IRQ, pinmux was switched back to default mode set by
MTK_EINT_FUNCTION().


> Yours,
> Hongzhou
> 
