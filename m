From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 01/10] pinctrl: mediatek: data struct optimize and remove
 unused member
Date: Tue, 19 May 2015 10:49:19 +0200
Message-ID: <CACRpkdZhxAxOMCwvMz2BWqND053kZ0taVstQn8n2emN=wktF-Q@mail.gmail.com>
References: <1431567346-33780-1-git-send-email-hongzhou.yang@mediatek.com>
	<1431567346-33780-2-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431567346-33780-2-git-send-email-hongzhou.yang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, Howard Chen <ibanezchen@gmail.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Fabian Frederick <fabf@skynet.be>, Maoguang Meng <maoguang.meng@mediatek.com>, Axel Lin <axel.lin@ingics.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@v>
List-Id: devicetree@vger.kernel.org

On Thu, May 14, 2015 at 3:35 AM, Hongzhou Yang
<hongzhou.yang@mediatek.com> wrote:

> From: Yingjoe Chen <yingjoe.chen@mediatek.com>
>
> struct mtk_desc_pin.chip, mtk_pinctrl_devdata.invser_offset
> and mtk_pinctrl_devdata.chip_type are never used in code.
> Remove them.
>
> Some per-pin data are using int for pin number and offsets.
> Change to short and rearrange to reduce const data size.
>
> Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>

Patch applied.

However I suggest you use:

unsigned int => u32
unsigned short => u16
unsigned char => u8

These kernel-specific types are more to the point,
you immediately see how many bits they use, so a
patch chaning all of the types to u32/u16/u8 would
be welcome.

Yours,
Linus Walleij
