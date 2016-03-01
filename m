From: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v4 2/4] power: reset: add reboot mode driver
Date: Tue, 1 Mar 2016 10:29:09 -0800
Message-ID: <CALAqxLXB4rxWMteUnc4xdg1cRTP2jPc6jTiViAgTrn0kz6qewA@mail.gmail.com>
References: <1456834172-5425-1-git-send-email-andy.yan@rock-chips.com>
	<1456834338-5521-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456834338-5521-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Yan <andy.yan@rock-chips.com>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Olof Johansson <olof@lixom.net>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Sebastian Reichel <sre@kernel.org>, Jun Nie <jun.nie@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Will Deacon <will.deacon@arm.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Caesar Wang <wxt@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, Russell
List-Id: devicetree@vger.kernel.org

On Tue, Mar 1, 2016 at 4:12 AM, Andy Yan <andy.yan@rock-chips.com> wrote:
> This driver parse the reboot commands like "reboot loader"
> and "reboot recovery" to get a boot mode described in the
> device tree , then call the write interfae to store the boot
> mode in some place like special register or sram , which can
> be read by the bootloader after system reboot, then the bootloader
> can take different action according to the mode stored.
>
> This is commonly used on Android based devices, in order to
> reboot the device into fastboot or recovery mode.
>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: Moritz Fischer <moritz.fischer@ettus.com>
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>


Thanks Andy for your persistence pushing this!

This patch works well on my nexus7.

Tested-by: John Stultz <john.stultz@linaro.org>
Acked-by: John Stultz <john.stultz@linaro.org>

thanks
-john
