From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v5 1/6] ath10k: Add qmi service helpers for wcn3990 qmi
 client
Date: Sat, 13 Oct 2018 17:33:20 +0000 (UTC)
Message-ID: <20181013173320.A37E960C60@smtp.codeaurora.org>
References: <20180815092637.11455-2-govinds@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180815092637.11455-2-govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, niklas.cassel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:

> WLAN qmi server running in Q6 exposes host to target
> cold boot qmi handshakes. Add WLAN QMI service helpers
> for ath10k wcn3990 qmi client.
> 
> Signed-off-by: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Acked-by: Niklas Cassel <niklas.cassel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Reviewed-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

6 patches applied to ath-next branch of ath.git, thanks.

bc17d4b90cdd ath10k: add qmi service helpers for wcn3990 qmi client
22e8a4602738 ath10k: add support to create boardname for non-bmi target
2b741a8aaa34 dt: bindings: add bindings for msa memory region
cc53aabcc283 firmware: qcom: scm: Add WLAN VMID for Qualcomm SCM interface
35a665766737 ath10k: add debug mask for QMI layer
ba94c753ccb4 ath10k: add QMI message handshake for wcn3990 client

-- 
https://patchwork.kernel.org/patch/10566407/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
