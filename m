From: Suman Tripathi <stripathi@apm.com>
Subject: Re: [PATCH v7 2/2] mmc: host: sdhci: Add support to disable
 SDR104/SDR50/DDR50 based on capability register 0.
Date: Mon, 18 May 2015 12:36:07 +0530
Message-ID: <CAOHikRBU9yrGQU3BbTqs4sWZN5osqEYKzD3VjXPar180aQj67Q@mail.gmail.com>
References: <1431517912-10322-1-git-send-email-stripathi@apm.com>
	<1431517912-10322-3-git-send-email-stripathi@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1431517912-10322-3-git-send-email-stripathi@apm.com>
Sender: linux-mmc-owner@vger.kernel.org
To: Chris Ball <chris@printf.net>, Anton Vorontsov <anton@enomsg.org>, Arnd Bergmann <arnd@arndb.de>, Michal Simek <michal.simek@xilinx.com>
Cc: linux-mmc <linux-mmc@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Don Dutile <ddutile@redhat.com>, Jon Masters <jcm@redhat.com>, Mark Langsdorf <mlangsdo@redhat.com>, patches <patches@apm.com>, Suman Tripathi <stripathi@apm.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 13, 2015 at 5:21 PM, Suman Tripathi <stripathi@apm.com> wrote:
> The sdhci framework disables SDR104/SDR50/DDR50 based on only quirk.
> This patch adds the support to disable SDR104/SDR50/DDR50 based on
> reading the capability register 0.
>
> Signed-off-by: Suman Tripathi <stripathi@apm.com>
> ---
> ---
>  drivers/mmc/host/sdhci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index 58c1770..a3d9b8a 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -3118,7 +3118,8 @@ int sdhci_add_host(struct sdhci_host *host)
>                 }
>         }
>
> -       if (host->quirks2 & SDHCI_QUIRK2_NO_1_8_V)
> +       if (host->quirks2 & SDHCI_QUIRK2_NO_1_8_V ||
> +           !(caps[0] & SDHCI_CAN_VDD_180))
>                 caps[1] &= ~(SDHCI_SUPPORT_SDR104 | SDHCI_SUPPORT_SDR50 |
>                        SDHCI_SUPPORT_DDR50);
>
> --
> 1.8.2.1
>

I didn't get any comments on this patch . Can anyone review it
(Michal , Ulf , Arnd etc ...)?


-- 
Thanks,
with regards,
Suman Tripathi
