From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH anybus v1 2/4] dt-bindings: anybus-bridge: document
 devicetree binding.
Date: Fri, 26 Oct 2018 07:39:21 +0100
Message-ID: <20181026063921.GF4870@dell>
References: <20181025154656.10153-1-TheSven73@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181025154656.10153-1-TheSven73@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thesven73@gmail.com
Cc: svendev@arcx.com, robh+dt@kernel.org, mark.rutland@arm.com, afaerber@suse.de, treding@nvidia.com, david@lechnology.com, noralf@tronnes.org, johan@kernel.org, monstr@monstr.eu, michal.vokac@ysoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, stuyoder@gmail.com, linus.walleij@linaro.org, maxime.ripard@bootlin.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 25 Oct 2018, thesven73@gmail.com wrote:

> >> This is why the bridge driver has a dependency on a pwm.
> >> If the pwm could be enabled individually, I could drop this dependency.
> >> Can you think of a way?
> >
> > How about using the pwm-clock device tree binding to turn the PWM into
> > a clock?
> > Documentation/devicetree/bindings/clock/pwm-clock.txt
> 
> Looks like a winner. Thanks !!

Could you fix your mailed to reply to mails 'threaded' please?

Your mails are now spread far and wide across my Inbox.

Thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
