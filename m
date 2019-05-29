From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 1/5] power: supply: max17040: Add IRQ handler for low
 SOC alert
Date: Wed, 29 May 2019 16:26:35 +0200
Message-ID: <CAJKOXPc1v8FqegAnYvrmU9Mne7isMovD6o-FSs2To7EqFc8XXQ@mail.gmail.com>
References: <CAJKOXPf=nPrmw6Vzi_=LmO=dVsV4Gvoc-q75XP2FBEgm9Gxv0A@mail.gmail.com>
 <20190527022258.32748-1-matheus@castello.eng.br> <20190527022258.32748-2-matheus@castello.eng.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190527022258.32748-2-matheus@castello.eng.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Matheus Castello <matheus@castello.eng.br>
Cc: sre@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Chanwoo Choi <cw00.choi@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, lee.jones@linaro.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 27 May 2019 at 04:45, Matheus Castello <matheus@castello.eng.br> wrote:
>
> According datasheet max17040 has a pin for alert host for low SOC.
> This pin can be used as external interrupt, so we need to check for
> interrupts assigned for device and handle it.
>
> In handler we are checking and storing fuel gauge registers values
> and send an uevent to notificate user space, so user space can decide
> save work or turn off since the alert demonstrate that the battery may
> no have the power to keep the system turned on for much longer.
>
> Signed-off-by: Matheus Castello <matheus@castello.eng.br>
> ---
>  drivers/power/supply/max17040_battery.c | 65 +++++++++++++++++++++++--
>  1 file changed, 60 insertions(+), 5 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
