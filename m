From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: pinctrl-single: fix the binding documentation
Date: Tue, 12 Feb 2013 13:13:22 +0100
Message-ID: <CACRpkdYGQ3S8-Zfmm8gSU4-R1pr7AZgadRJqSa2diigt4WWpjA@mail.gmail.com>
References: <1360550763-5404-1-git-send-email-anilkumar.v@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1360550763-5404-1-git-send-email-anilkumar.v@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: "Kumar, Anil" <anilkumar.v@ti.com>, ext Tony Lindgren <tony@atomide.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net, b-cousson@ti.com
List-Id: devicetree@vger.kernel.org

On Mon, Feb 11, 2013 at 3:46 AM, Kumar, Anil <anilkumar.v@ti.com> wrote:

> As there are no use of #address-cells and #size-cells properties
> in pinctrl-single driver DT node. Fix pinctrl-single binding documentation
> to remove these properties.
>
> Signed-off-by: Kumar, Anil <anilkumar.v@ti.com>
> ---
> Tested on da850 EVM.

I need Tony Lindgrens ACK on this before I apply it.

Thanks,
Linus Walleij
