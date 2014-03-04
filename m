From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCHv2 14/14] ARM: OMAP3: clock: remove legacy clock data
Date: Tue, 4 Mar 2014 09:32:43 -0800
Message-ID: <20140304173242.GB17470@atomide.com>
References: <1393924700-6510-1-git-send-email-t-kristo@ti.com>
 <1393924700-6510-15-git-send-email-t-kristo@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-omap-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1393924700-6510-15-git-send-email-t-kristo@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Tero Kristo <t-kristo@ti.com>
Cc: linux-omap@vger.kernel.org, nm@ti.com, mturquette@linaro.org, paul@pwsan.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [140304 01:22]:
> This is no longer needed as clock data is provided through DT.

And this one we cannot apply yet until omap3 is booting in device tree
only mode.

Regards,

Tony
