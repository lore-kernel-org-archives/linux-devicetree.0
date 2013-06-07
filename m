From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: pinctrl-single: enhance to configure
 multiple pins of different modules
Date: Fri, 7 Jun 2013 11:20:39 +0200
Message-ID: <CACRpkdYrmpptASxiM-YUrH-W71OxVFSh-kS_nX-Cw1Whe+fGBQ@mail.gmail.com>
References: <1369145282-14419-1-git-send-email-prakash.pm@ti.com>
	<1369145282-14419-3-git-send-email-prakash.pm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1369145282-14419-3-git-send-email-prakash.pm@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: "Manjunathappa, Prakash" <prakash.pm@ti.com>
Cc: "Nori, Sekhar" <nsekhar@ti.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Rob Landley <rob@landley.net>, ext Tony Lindgren <tony@atomide.com>, Prabhakar Lad <prabhakar.csengg@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>
List-Id: devicetree@vger.kernel.org

On Tue, May 21, 2013 at 4:08 PM, Manjunathappa, Prakash
<prakash.pm@ti.com> wrote:

> Add support to configure multiple pins in each register, existing
> implementation added by [1] does not support full fledge multiple pin
> configuration in single register, reports a pin clash when different
> modules configure different bits of same register. The issue reported
> and discussed here
> http://www.spinics.net/lists/arm-kernel/msg235213.html
>
> With pinctrl-single,bits-per-mux property specified, use function-mask
> property to find out number pins to configure. Allocate and register
> pin control functions based sub mask.
>
> Tested on da850/omap-l138 EVM.
> does not support variable submask for pins.
> does not support pinconf.
>
> [1] "pinctrl: pinctrl-single: Add pinctrl-single,bits type of mux"
> (9e605cb68a21d5704839a192a46ebcf387773704),
>
> Signed-off-by: Manjunathappa, Prakash <prakash.pm@ti.com>
> Reported-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> Tested-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Patch applied with Haojian's and Tony's ACK.

Thanks!
Linus Walleij
