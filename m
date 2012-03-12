From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] dt: pinctrl: Document device tree binding
Date: Mon, 12 Mar 2012 21:06:53 +0800
Message-ID: <20120312130651.GB19513@S2101-09.ap.freescale.net>
References: <1331316873-20052-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1331316873-20052-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@stericsson.com>, B29396@freescale.com, s.hauer@pengutronix.de, dongas86@gmail.com, thomas.abraham@linaro.org, tony@atomide.com
List-Id: devicetree@vger.kernel.org

On Fri, Mar 09, 2012 at 11:14:33AM -0700, Stephen Warren wrote:
> The core pin controller bindings define:
> * The fact that pin controllers expose pin configurations as nodes in
>   device tree.
> * That the bindings for those pin configuration nodes is defined by the
>   individual pin controller drivers.
> * A standardized set of properties for client devices to define numbered
>   or named pin configuration states, each referring to some number of the
>   afore-mentioned pin configuration nodes.
> * That the bindings for the client devices determines the set of numbered
>   or named states that must exist.
> 
> Signed-off-by: Stephen Warren <swarren@wwwdotorg.org>

Acked-by: Shawn Guo <shawn.guo@linaro.org>
