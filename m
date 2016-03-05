From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] pinctrl: pistachio: fix mfio84-89 function description
 and pinmux.
Date: Fri, 4 Mar 2016 22:31:37 -0600
Message-ID: <20160305043137.GJ13525@rob-hp-laptop>
References: <1457105302-15070-1-git-send-email-Govindraj.Raja@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1457105302-15070-1-git-send-email-Govindraj.Raja@imgtec.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Govindraj Raja <Govindraj.Raja@imgtec.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, linux-mips@linux-mips.org, James Hartley <James.Hartley@imgtec.com>, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 04, 2016 at 03:28:22PM +0000, Govindraj Raja wrote:
> mfio 84 to 89 are described wrongly, fix it to describe
> the right pin and add them to right pin-mux group.
> 
> The correct order is:
> 	pll1_lock => mips_pll	-- MFIO_83
> 	pll2_lock => audio_pll	-- MFIO_84
> 	pll3_lock => rpu_v_pll	-- MFIO_85
> 	pll4_lock => rpu_l_pll	-- MFIO_86
> 	pll5_lock => sys_pll	-- MFIO_87
> 	pll6_lock => wifi_pll	-- MFIO_88
> 	pll7_lock => bt_pll	-- MFIO_89
> 
> Fixes: cefc03e5995e("pinctrl: Add Pistachio SoC pin control driver")
> Signed-off-by: Govindraj Raja <Govindraj.Raja@imgtec.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Andrew Bresticker <abrestic@chromium.org>
> Cc: linux-mips@linux-mips.org
> Cc: James Hartley <James.Hartley@imgtec.com>
> Cc: <stable@vger.kernel.org> # v4.2+
> ---
> Do I need to split this patch into dt & pinctrl?
> Or can it be picked up through pinctrl subsystem with dt maintainers Ack?

Yes.

Acked-by: Rob Herring <robh@kernel.org>
