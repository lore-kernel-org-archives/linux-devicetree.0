From: Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH v2 02/30] pinctrl: mediatek: reuse pinctrl driver for
 mt7623
Date: Mon, 1 May 2017 14:44:07 +0800
Message-ID: <1493621047.32195.4.camel@mtkswgap22>
References: <1493198774-4478-1-git-send-email-sean.wang@mediatek.com>
         <1493198774-4478-3-git-send-email-sean.wang@mediatek.com>
         <CACRpkdbR-k3wgD+7KoV6d7yg1uduXpa9MO0+woEibQYPeYzgYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbR-k3wgD+7KoV6d7yg1uduXpa9MO0+woEibQYPeYzgYw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2017-04-28 at 10:01 +0200, Linus Walleij wrote:
> On Wed, Apr 26, 2017 at 11:25 AM,  <sean.wang@mediatek.com> wrote:
> 
> > From: Sean Wang <sean.wang@mediatek.com>
> >
> > mt7623 pinctrl driver can be compatible with mt2701 one,
> > so the patch reuses the driver and deletes those redundant
> > ones.
> >
> > Cc: John Crispin <john@phrozen.org>
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> 
> Partly correct.
> 
> >         "mediatek,mt6397-pinctrl", compatible with mt6397 pinctrl.
> > -       "mediatek,mt7623-pinctrl", compatible with mt7623 pinctrl.
> 
> NO don't do this.
> 
> "compatible" means exactly this: this hardware is compatible with
> this driver. That is why we have it!
> 
> So instead of mt7623 pretending to be mt2701, let the mt2701 driver
> list that it is compatible with mt7623, simple.
> 
> So patch pinctrl-mt2701.c mt2701_pctrl_match[] instead.
> 

Hi Linus,

really appreciate your clear guidance and reviewing on this

I will fix it up in the next version
	
	Sean

> Yours,
> Linus Walleij


