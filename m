From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCHv2 3/3] edac: altera: Add SDRAM EDAC support for
 CycloneV/ArriaV
Date: Mon, 21 Apr 2014 12:27:50 +0200
Message-ID: <20140421102750.GA27209@amd.pavel.ucw.cz>
References: <1397604610-20931-1-git-send-email-tthayer@altera.com>
 <1397604610-20931-5-git-send-email-tthayer@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1397604610-20931-5-git-send-email-tthayer@altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tthayer@altera.com
Cc: robherring2@gmail.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org, galak@codeaurora.org, rob@landley.net, linux@arm.linux.org.uk, dinguyen@altera.com, dougthompson@xmission.com, grant.likely@linaro.org, tthayer.linux@gmail.com, Borislav Petkov <bp@alien8.de>, devicetree@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi!

> From: Thor Thayer <tthayer@altera.com>
> 
> Added EDAC support for reporting ECC errors of CycloneV
> and ArriaV SDRAM controller.
> - The SDRAM Controller registers are used by the FPGA bridge so
>   these are accessed through the syscon interface.
> - The configuration of the SDRAM memory size for the EDAC framework
>   is discovered from the SDRAM Controller registers.
> - Documentation of the bindings in devicetree/bindings/arm/altera/
>   socfpga-sdram-edac.txt
> - Correction of single bit errors, detection of double bit errors.
> 
> ---
> v2: Use the SDRAM controller registers to calculate memory size
>     instead of the Device Tree. Update To & Cc list. Add maintainer 
>     information.

I'd reduce number of *s in the messages, otherwise

Reviewed-by: Pavel Machek <pavel@ucw.cz>

for whole series.
								Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
