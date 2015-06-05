From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCHv2 0/4] Add Altera Arria10 EDAC Support
Date: Fri, 5 Jun 2015 13:02:56 +0200
Message-ID: <20150605110255.GE3679@pd.tnic>
References: <1433428128-7292-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1433428128-7292-1-git-send-email-tthayer@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: tthayer@opensource.altera.com
Cc: dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com
List-Id: devicetree@vger.kernel.org

On Thu, Jun 04, 2015 at 09:28:44AM -0500, tthayer@opensource.altera.com wrote:
> From: Thor Thayer <tthayer@opensource.altera.com>
> 
> This series of patches adds support for the Arria10 EDAC. The
> SDRAM controller and ECC registers are significantly different
> from the CycloneV/ArriaV but common areas could be abstracted.
> 
> Thor Thayer (4):
>   edac, altera: Generalize driver to use DT Memory size
>   edac, altera: Refactor EDAC for Altera CycloneV SoC.
>   edac, altera: Addition of Arria10 EDAC
>   arm: socfpga: dts: Arria10 SDRAM EDAC DTS additions.
> 
>  .../bindings/arm/altera/socfpga-sdram-edac.txt     |    2 +-
>  arch/arm/boot/dts/socfpga_arria10.dtsi             |   11 +
>  drivers/edac/altera_edac.c                         |  364 ++++++++++++--------
>  drivers/edac/altera_edac.h                         |  201 +++++++++++
>  4 files changed, 437 insertions(+), 141 deletions(-)
>  create mode 100644 drivers/edac/altera_edac.h

Ok, all applied, no need to redo them.

altera_edac still builds ok with the cross compiler here but you should
doublecheck my final result just in case:

git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git#for-next

Thanks.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
