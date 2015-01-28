From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: Re: [PATCH 1/6] soc: qcom: gsbi: Add support for ADM CRCI muxing
Date: Wed, 28 Jan 2015 11:05:50 +0200
Message-ID: <54C8A66E.3070306@mm-sol.com>
References: <1422396644-21714-1-git-send-email-agross@codeaurora.org>
 <1422396644-21714-2-git-send-email-agross@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1422396644-21714-2-git-send-email-agross@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andy Gross <agross@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Kumar Gala <galak@codeaurora.org>, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Andy,

On 01/28/2015 12:10 AM, Andy Gross wrote:
> This patch adds automatic configuration for the ADM CRCI muxing required to
> support DMA operations for GSBI clients.  The GSBI mode and instance determine
> the correct TCSR ADM CRCI MUX value that must be programmed so that the DMA
> works properly.
> 
> Signed-off-by: Andy Gross <agross@codeaurora.org>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,gsbi.txt     |   17 ++-
>  drivers/soc/qcom/Kconfig                           |    1 +
>  drivers/soc/qcom/qcom_gsbi.c                       |  148 +++++++++++++++++++-
>  3 files changed, 158 insertions(+), 8 deletions(-)
> 

<snip>

> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 7bd2c94..32f20be 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -4,6 +4,7 @@
>  config QCOM_GSBI
>          tristate "QCOM General Serial Bus Interface"
>          depends on ARCH_QCOM
> +	select MFD_SYSCON

Wrong indentation? In fact the original Kconfig entry has spaces instead
of tabs, could you prepare a cleanup patch for this.

>          help
>            Say y here to enable GSBI support.  The GSBI provides control
>            functions for connecting the underlying serial UART, SPI, and I2C

<snip>

-- 
regards,
Stan
