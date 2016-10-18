From: Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [PATCH 03/19] MAINTAINERS: Remove phy-miphy365x.c entry from STi
 arch
Date: Tue, 18 Oct 2016 09:48:19 +0200
Message-ID: <aab225f3-2482-4a08-1149-4220327f81d7@st.com>
References: <1473859677-9231-1-git-send-email-peter.griffin@linaro.org>
 <1473859677-9231-4-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1473859677-9231-4-git-send-email-peter.griffin@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, devicetree@vger.kernel.org
Cc: lee.jones@linaro.org, kishon@ti.com
List-Id: devicetree@vger.kernel.org

Hi

On 09/14/2016 03:27 PM, Peter Griffin wrote:
> Remove this driver as the IP is only found on STiH415/6
> silicon, and support for these SoC's is being removed
> from the kernel.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Cc: <kishon@ti.com>

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Applied on sti-dt-for-4.10 branch

Thanks 

> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index db814a8..12c271c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1754,7 +1754,6 @@ F:	drivers/media/rc/st_rc.c
>  F:	drivers/media/platform/sti/c8sectpfe/
>  F:	drivers/mmc/host/sdhci-st.c
>  F:	drivers/phy/phy-miphy28lp.c
> -F:	drivers/phy/phy-miphy365x.c
>  F:	drivers/phy/phy-stih407-usb.c
>  F:	drivers/phy/phy-stih41x-usb.c
>  F:	drivers/pinctrl/pinctrl-st.c
> 
