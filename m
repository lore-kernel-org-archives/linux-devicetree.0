From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCHv7 3/3] edac: altera: Add EDAC support for Altera SoC
 SDRAM Controller.
Date: Tue, 8 Jul 2014 13:31:09 +0200
Message-ID: <20140708113109.GC8100@amd.pavel.ucw.cz>
References: <1403730927-16163-1-git-send-email-tthayer@altera.com>
 <1403730927-16163-4-git-send-email-tthayer@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1403730927-16163-4-git-send-email-tthayer@altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: tthayer@altera.com
Cc: robherring2@gmail.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, linux@arm.linux.org.uk, dinguyen@altera.com, dougthompson@xmission.com, grant.likely@linaro.org, bp@alien8.de, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, tthayer.linux@gmail.com, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> +	read_reg = readl(mc_vbase + DRAMADDRW);
> +
> +	width = readl(mc_vbase + DRAMIFWIDTH);
> +
> +	col = (read_reg & DRAMADDRW_COLBIT_MASK) >>
> +		DRAMADDRW_COLBIT_LSB;
> +	row = (read_reg & DRAMADDRW_ROWBIT_MASK) >>
> +		DRAMADDRW_ROWBIT_LSB;
> +	bank = (read_reg & DRAMADDRW_BANKBIT_MASK) >>
> +		DRAMADDRW_BANKBIT_LSB;
> +	cs = (read_reg & DRAMADDRW_CSBIT_MASK) >>
> +		DRAMADDRW_CSBIT_LSB;

As I said, all the defines only make this harder to read. The code is
pretty obvious if you put numbers in here...

Plus I'd like an explanation/comment of how the error injection works.

Thanks,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
