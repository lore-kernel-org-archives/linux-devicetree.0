From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 2/2] remoteproc: qcom: Introduce WCNSS peripheral image
 loader
Date: Tue, 28 Jun 2016 23:05:25 +0200
Message-ID: <115043528.GxNIb9dTCg@wuerfel>
References: <1467147506-753-1-git-send-email-bjorn.andersson@linaro.org>
 <1467147506-753-2-git-send-email-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1467147506-753-2-git-send-email-bjorn.andersson@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, John Stultz <john.stultz@linaro.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>
List-Id: devicetree@vger.kernel.org

On Tuesday, June 28, 2016 1:58:26 PM CEST Bjorn Andersson wrote:
> 
> +config QCOM_WCNSS_PIL
> +       tristate "Qualcomm WCNSS Peripheral Image Loader"
> +       depends on OF && ARCH_QCOM
> +       select QCOM_MDT_LOADER
> +       select QCOM_SCM
> +       select REMOTEPROC
> +       help
> +         Say y here to support the Peripherial Image Loader for the Qualcomm
> +         Wireless Connectivity Subsystem.
> +
> 

	"depends on QCOM_SMEM"

This showed up in Linux-next today and caused a build error:

drivers/remoteproc/built-in.o: In function `q6v5_fatal_interrupt':
qcom_q6v5_pil.c:(.text+0x2428): undefined reference to `qcom_smem_get'
drivers/remoteproc/built-in.o: In function `q6v5_wdog_interrupt':
qcom_q6v5_pil.c:(.text+0x2498): undefined reference to `qcom_smem_get'


	Arnd
