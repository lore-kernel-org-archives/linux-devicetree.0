From: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCHv2 2/4] edac, altera: Refactor EDAC for Altera CycloneV
 SoC.
Date: Thu, 4 Jun 2015 10:26:29 -0500
Message-ID: <55706E25.8050105@opensource.altera.com>
References: <1433428128-7292-1-git-send-email-tthayer@opensource.altera.com>
 <1433428128-7292-3-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1433428128-7292-3-git-send-email-tthayer@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tthayer@opensource.altera.com, bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com
List-Id: devicetree@vger.kernel.org

On 06/04/2015 09:28 AM, tthayer@opensource.altera.com wrote:
> From: Thor Thayer <tthayer@opensource.altera.com>
> 
> The Arria10 SOC uses a completely different SDRAM controller from the
> earlier CycloneV and ArriaV SoCs. This patch abstracts the SDRAM bits
> for the CycloneV/ArriaV SoCs in preparation for the Arria10 support.
> 
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> ---
> v2: Make c5_data static.
> ---
>  drivers/edac/altera_edac.c |  194 ++++++++++++++++++++------------------------
>  drivers/edac/altera_edac.h |  116 ++++++++++++++++++++++++++
>  2 files changed, 206 insertions(+), 104 deletions(-)
>  create mode 100644 drivers/edac/altera_edac.h
> 
> diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
> index a9e7c69..a8350f6 100644
> --- a/drivers/edac/altera_edac.c
> +++ b/drivers/edac/altera_edac.c

What branch are you basing this patch on? I get the following error when
applied to both v4.1-rc6, linux-next, and linux-edac/linux-next.

Applying: edac, altera: Refactor EDAC for Altera CycloneV SoC.
error: patch failed: drivers/edac/altera_edac.c:400
error: drivers/edac/altera_edac.c: patch does not apply
Patch failed at 0001 edac, altera: Refactor EDAC for Altera CycloneV SoC.

Dinh
