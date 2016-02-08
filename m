From: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCHv9 4/4] ARM: socfpga: Enable OCRAM ECC on startup
Date: Mon, 8 Feb 2016 13:02:09 -0600
Message-ID: <56B8E631.8040209@opensource.altera.com>
References: <1453911203-30202-1-git-send-email-tthayer@opensource.altera.com>
 <1453911203-30202-4-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453911203-30202-4-git-send-email-tthayer@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tthayer@opensource.altera.com, bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com
List-Id: devicetree@vger.kernel.org



On 01/27/2016 10:13 AM, tthayer@opensource.altera.com wrote:
> From: Thor Thayer <tthayer@opensource.altera.com>
> 
> This patch enables the ECC for On-Chip RAM on machine startup. The ECC
> has to be enabled before data is stored in memory otherwise the ECC will
> fail on reads.
> 
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> ---
> v9: Improve node release handling.
> v8: Address community comments on strings. Fix match strings based
>     on maintainer feedback. Update year in header.
> v7: enable OCRAM ECC during platform init
> v6: Implement OCRAM discovery changes from community. Add
>     of_node_put(). Remove be32_to_cpup(). Use __init() which
>     allows removal of .init_machine(). Update year in header.
> ---
>  arch/arm/mach-socfpga/Makefile  |    1 +
>  arch/arm/mach-socfpga/core.h    |    1 +
>  arch/arm/mach-socfpga/ocram.c   |   49 +++++++++++++++++++++++++++++++++++++++
>  arch/arm/mach-socfpga/socfpga.c |    3 +++
>  4 files changed, 54 insertions(+)
>  create mode 100644 arch/arm/mach-socfpga/ocram.c
> 

Acked-by: Dinh Nguyen <dinguyen@opensource.altera.com>
