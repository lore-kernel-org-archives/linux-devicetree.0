From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v4] ARM: dts: pxa: add mioa701 board description
Date: Sun, 11 Nov 2018 22:12:53 +0100
Message-ID: <8736s7l3my.fsf@belgarion.home>
References: <20180915110206.23110-1-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180915110206.23110-1-robert.jarzmik@free.fr> (Robert Jarzmik's
        message of "Sat, 15 Sep 2018 13:02:06 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, Marcel Ziswiler <marcel@ziswiler.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Robert Jarzmik <robert.jarzmik@free.fr> writes:

> Add device-tree description of the Mitac MIO A701 board.
> This is aimed at replacing mioa701.c board file, and once stabilized,
> the leftover, such as the suspend resume mechanics will rely on a new
> IPL, and not the legacy Windows CE one.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---
> Since v1: fix lcd_supply and lcd_backlight
>           These were depending on my internal tree changes, fit it.
> Since v2: take into account Rob's comments
> Since v3: take into account Marcel's comments
>
> This patch deserves some special "love review". As it will probably
> serve for a more broad pxa conversion to devicetree of the other boards,
> and because it touches almost all domains for a pxa platform (camera,
> video, audio, i2c, ...), it should be as clean as possible so that
> mistakes are not carried on ...
>
> Therefore I expect the review of this one to be long (ie. it won't land
> for v4.19), until it looks good enough.

Rob, would you respin that in your tester now all the missing dependencies have
hit Linus's master tree again please ?

--
Robert
