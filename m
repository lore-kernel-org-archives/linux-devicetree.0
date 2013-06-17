From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 01/11] pinctrl: single: adopt pinctrl sleep mode
 management
Date: Mon, 17 Jun 2013 05:03:41 -0700
Message-ID: <20130617120340.GE10305@atomide.com>
References: <1369995191-20855-1-git-send-email-gururaja.hebbar@ti.com>
 <1369995191-20855-2-git-send-email-gururaja.hebbar@ti.com>
 <CACRpkdZjvW6M1Q+K3OD1x_Jkz91AofdOdBThyJLGJ+Wx-BDTNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZjvW6M1Q+K3OD1x_Jkz91AofdOdBThyJLGJ+Wx-BDTNw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Hebbar Gururaja <gururaja.hebbar@ti.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Kevin Hilman <khilman@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vaibhav Bedia <vaibhav.bedia@ti.com>, sudhakar.raj@ti.com
List-Id: devicetree@vger.kernel.org

* Linus Walleij <linus.walleij@linaro.org> [130617 04:38]:
> On Fri, May 31, 2013 at 12:13 PM, Hebbar Gururaja
> <gururaja.hebbar@ti.com> wrote:
> 
> > Make pinctrl-single able to handle suspend/resume events and change
> > hogged pins states accordingly.
> >
> > Signed-off-by: Hebbar Gururaja <gururaja.hebbar@ti.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> 
> Noone said anything about this patch, but it looks very straight-forward
> to me and seems sound so I have applied it.
> 
> If Tony or Haojian has strong feelings about it I will dequeue it.

I don't like the hogged pins at all as they prevent me from unloading
pinctrl-single.. But the patch seems fine to me:

Acked-by: Tony Lindgren <tony@atomide.com>
