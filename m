From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCHv8 2/3] devicetree: Addition of the Altera SDRAM EDAC. Add
 the
Date: Sat, 28 Jun 2014 19:08:04 +0200
Message-ID: <20140628170804.GD23634@xo-6d-61-c0.localdomain>
References: <1403882819-24929-1-git-send-email-tthayer@altera.com>
 <1403882819-24929-3-git-send-email-tthayer@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1403882819-24929-3-git-send-email-tthayer@altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tthayer@altera.com
Cc: robherring2@gmail.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, linux@arm.linux.org.uk, dinguyen@altera.com, dougthompson@xmission.com, grant.likely@linaro.org, bp@alien8.de, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com
List-Id: devicetree@vger.kernel.org

Hi!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/altera/socfpga-sdram-edac.txt
> @@ -0,0 +1,15 @@
> +Altera SOCFPGA SDRAM Error Detection & Correction [EDAC]
> +
> +Required properties:
> +- compatible : should contain "altr,sdram-edac";
> +- reg : should contain the ECC register range in sdram

SDRAM for consistency.

Acked-by: Pavel Machek <pavel@denx.de>
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
