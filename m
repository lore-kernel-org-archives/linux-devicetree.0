From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 01/11] pinctrl: single: adopt pinctrl sleep mode management
Date: Mon, 17 Jun 2013 13:32:38 +0200
Message-ID: <CACRpkdZjvW6M1Q+K3OD1x_Jkz91AofdOdBThyJLGJ+Wx-BDTNw@mail.gmail.com>
References: <1369995191-20855-1-git-send-email-gururaja.hebbar@ti.com>
	<1369995191-20855-2-git-send-email-gururaja.hebbar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1369995191-20855-2-git-send-email-gururaja.hebbar@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hebbar Gururaja <gururaja.hebbar@ti.com>, ext Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Kevin Hilman <khilman@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vaibhav Bedia <vaibhav.bedia@ti.com>, sudhakar.raj@ti.com
List-Id: devicetree@vger.kernel.org

On Fri, May 31, 2013 at 12:13 PM, Hebbar Gururaja
<gururaja.hebbar@ti.com> wrote:

> Make pinctrl-single able to handle suspend/resume events and change
> hogged pins states accordingly.
>
> Signed-off-by: Hebbar Gururaja <gururaja.hebbar@ti.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>

Noone said anything about this patch, but it looks very straight-forward
to me and seems sound so I have applied it.

If Tony or Haojian has strong feelings about it I will dequeue it.

Yours,
Linus Walleij
