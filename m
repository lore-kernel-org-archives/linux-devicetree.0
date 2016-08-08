From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 3/3] ARM: dts: Add Arria10 SD/MMC EDAC devicetree entry
Date: Mon, 8 Aug 2016 15:37:12 +0200
Message-ID: <20160808133712.GB29563@nazgul.tnic>
References: <1470153381-20517-1-git-send-email-tthayer@opensource.altera.com>
 <1470153381-20517-4-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1470153381-20517-4-git-send-email-tthayer@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: tthayer@opensource.altera.com, dinguyen@opensource.altera.com
Cc: dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com
List-Id: devicetree@vger.kernel.org

On Tue, Aug 02, 2016 at 10:56:21AM -0500, tthayer@opensource.altera.com wrote:
> From: Thor Thayer <tthayer@opensource.altera.com>
> 
> Add the device tree entries needed to support the Altera SD/MMC
> FIFO buffer EDAC on the Arria10 chip.
> 
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> ---
>  arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc.dts |   12 ++++++++++++
>  1 file changed, 12 insertions(+)

This needs an Ack by Dinh.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
