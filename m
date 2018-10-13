From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v5 1/6] ath10k: Add qmi service helpers for wcn3990 qmi
 client
Date: Sat, 13 Oct 2018 17:33:20 +0000 (UTC)
Message-ID: <20181013173320.C72EF60A98@smtp.codeaurora.org>
References: <20180815092637.11455-2-govinds@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ath10k-bounces+gldad-ath10k=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180815092637.11455-2-govinds@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+gldad-ath10k=m.gmane.org@lists.infradead.org
Cc: devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>, briannorris@chromium.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, niklas.cassel@linaro.org
List-Id: devicetree@vger.kernel.org

Govind Singh <govinds@codeaurora.org> wrote:

> WLAN qmi server running in Q6 exposes host to target
> cold boot qmi handshakes. Add WLAN QMI service helpers
> for ath10k wcn3990 qmi client.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Acked-by: Niklas Cassel <niklas.cassel@linaro.org>
> Reviewed-by: Brian Norris <briannorris@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

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
