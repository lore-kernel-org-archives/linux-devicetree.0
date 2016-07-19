Return-Path: <kvalo@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [v7] wlcore: spi: add wl18xx support
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1468911482-32560-1-git-send-email-eyalr@ti.com>
Message-Id: <20160719181636.AEFB261218@smtp.codeaurora.org>
Date: Tue, 19 Jul 2016 18:16:36 +0000 (UTC)
To: Eyal Reizer <eyalreizer@gmail.com>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-spi@vger.kernel.org, robh@kernel.org, Eyal Reizer <eyalr@ti.com>
List-ID: <devicetree@vger.kernel.org>

Eyal Reizer <eyalreizer@gmail.com> wrote:
> From: Eyal Reizer <eyalr@ti.com>
> 
> Add support for using with both wl12xx and wl18xx.
> 
> - all wilink family needs special init command for entering wspi mode.
>   extra clock cycles should be sent after the spi init command while the
>   cs pin is high.
> - Use inverted chip select for sending a dummy 4 bytes command that
>   completes the init stage.
> 
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> Acked-by: Rob Herring <robh@kernel.org>

Thanks, 1 patch applied to wireless-drivers-next.git:

01efe65aba65 wlcore: spi: add wl18xx support

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9235983/
