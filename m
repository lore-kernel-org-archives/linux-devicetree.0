From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH v4 2/2] ARM: socfpga: dts: add sdram controller dt
 binding doc
Date: Mon, 25 May 2015 14:39:02 +0200
Message-ID: <20150525123902.GE9943@amd>
References: <1432317735-29413-1-git-send-email-atull@opensource.altera.com>
 <1432317735-29413-3-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1432317735-29413-3-git-send-email-atull@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Tull <atull@opensource.altera.com>
Cc: Dinh Nguyen <dinguyen@opensource.altera.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, Delicious Quinoq <delicious.quinoa@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri 2015-05-22 13:02:15, Alan Tull wrote:
> Add binding doc for Altera SOCFPGA SDRAM controller.
> 
> Signed-off-by: Alan Tull <atull@opensource.altera.com>
> ---
> v4: Add bindings doc
> ---
>  .../arm/altera/socfpga-sdram-controller.txt        |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-sdram-controller.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-sdram-controller.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-sdram-controller.txt
> new file mode 100644
> index 0000000..77ca635
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/altera/socfpga-sdram-controller.txt
> @@ -0,0 +1,12 @@
> +Altera SOCFPGA SDRAM Controller
> +
> +Required properties:
> +- compatible : Should contain "altr,sdr-ctl" and "syscon".
> +  syscon is required by the Altera SOCFPGA SDRAM EDAC.
> +- reg : Should contain 1 register range (address and length)
> +
> +Example:
> +	sdr: sdr@ffc25000 {
> +		compatible = "altr,sdr-ctl", "syscon";

Is the syscon binding good idea? Should the EDAC driver be fixed to
accept altr,sdr-ctl binding, instead?
							Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
