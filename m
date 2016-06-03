From: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCH 5/5] ARM: dts: Move Arria10 SDRAM as child of ECC
 Manager
Date: Fri, 3 Jun 2016 11:06:55 -0500
Message-ID: <alpine.DEB.2.02.1606031106340.1763@linux-builds1>
References: <1464193783-5071-1-git-send-email-tthayer@opensource.altera.com> <1464193783-5071-6-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464193783-5071-6-git-send-email-tthayer@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tthayer@opensource.altera.com
Cc: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com
List-Id: devicetree@vger.kernel.org

On Wed, 25 May 2016, tthayer@opensource.altera.com wrote:

> From: Thor Thayer <tthayer@opensource.altera.com>
> 
> Changes to support ECC Manager as SDRAM IRQ parent by
> 1) updating IRQ property values to correct child IRQs
> 2) moving node under ECC Manager.
> 
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> ---
>  arch/arm/boot/dts/socfpga_arria10.dtsi |   13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>

Applied! 

Thanks,
Dinh
