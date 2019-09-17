From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Fix HOST capability QMI incompatibility
Date: Tue, 17 Sep 2019 14:03:41 +0000 (UTC)
Message-ID: <20190917140342.D11AF61576@smtp.codeaurora.org>
References: <20190725063108.15790-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190725063108.15790-1-bjorn.andersson@linaro.org>
Sender: netdev-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Bjorn Andersson <bjorn.andersson@linaro.org> wrote:

> The introduction of 768ec4c012ac ("ath10k: update HOST capability QMI
> message") served the purpose of supporting the new and extended HOST
> capability QMI message.
> 
> But while the new message adds a slew of optional members it changes the
> data type of the "daemon_support" member, which means that older
> versions of the firmware will fail to decode the incoming request
> message.
> 
> There is no way to detect this breakage from Linux and there's no way to
> recover from sending the wrong message (i.e. we can't just try one
> format and then fallback to the other), so a quirk is introduced in
> DeviceTree to indicate to the driver that the firmware requires the 8bit
> version of this message.
> 
> Cc: stable@vger.kernel.org
> Fixes: 768ec4c012ac ("ath10k: update HOST capability qmi message")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

7165ef890a4c ath10k: Fix HOST capability QMI incompatibility

-- 
https://patchwork.kernel.org/patch/11058005/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
