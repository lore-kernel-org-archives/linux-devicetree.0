From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCHv2 0/3] Add SD/MMC EDAC for Altera Arria10
Date: Wed, 10 Aug 2016 14:48:34 +0200
Message-ID: <20160810124834.GA438@nazgul.tnic>
References: <1470753653-23465-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1470753653-23465-1-git-send-email-tthayer@opensource.altera.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: tthayer@opensource.altera.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, linux-doc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, m.chehab@osg.samsung.com, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, robh+dt@kernel.org, dougthompson@xmission.com, dinguyen@opensource.altera.com, tthayer.linux@gmail.com, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 09, 2016 at 09:40:50AM -0500, tthayer@opensource.altera.com wrote:
> From: Thor Thayer <tthayer@opensource.altera.com>
> 
> Add the SD/MMC FIFO EDAC module which is a dual-port RAM as
> opposed to the other Arria10 peripheral's single port RAM FIFOs.
> 
> Thor Thayer (3):
>   Documentation: dt: socfpga: Add Arria10 SD-MMC EDAC binding
>   EDAC, altera: Add Arria10 SD-MMC EDAC support
>   ARM: dts: Add Arria10 SD/MMC EDAC devicetree entry
> 
>  .../bindings/arm/altera/socfpga-eccmgr.txt         |   19 ++
>  arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc.dts  |   12 ++
>  drivers/edac/Kconfig                               |    7 +
>  drivers/edac/altera_edac.c                         |  188 +++++++++++++++++++-
>  drivers/edac/altera_edac.h                         |    5 +
>  5 files changed, 230 insertions(+), 1 deletion(-)

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
