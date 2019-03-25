From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 2/2] edac: sifive: Add EDAC driver for SiFive FU540-C000
 chip
Date: Mon, 25 Mar 2019 07:57:37 +0100
Message-ID: <20190325065737.GD12016@zn.tnic>
References: <1553082728-9232-1-git-send-email-yash.shah@sifive.com>
 <1553082728-9232-3-git-send-email-yash.shah@sifive.com>
 <alpine.DEB.2.21.9999.1903241558210.8028@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1903241558210.8028@viisi.sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Yash Shah <yash.shah@sifive.com>, linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org, palmer@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, aou@eecs.berkeley.edu, mchehab@kernel.org, devicetree@vger.kernel.org, sachin.ghadi@sifive.com
List-Id: devicetree@vger.kernel.org

On Sun, Mar 24, 2019 at 05:23:27PM -0700, Paul Walmsley wrote:
> > +	if (!IS_ENABLED(CONFIG_EDAC_DEBUG))
> > +		return;
> 
> Can all of these debugfs functions be wrapped with an #if ... #endif such 
> that, if CONFIG_EDAC_DEBUG is not set, they will all be stripped out by 
> the preprocessor?

Why would you make the code more ugly with ifdeffery?

Do you have any serious code size constraints so that you absolutely
need to remove a couple of KBs?

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
