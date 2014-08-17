From: Carlo Caione <carlo@caione.org>
Subject: Re: [PATCH 0/7] ARM: meson: add preliminary support for MesonX/Meson6 SoCs
Date: Sun, 17 Aug 2014 17:25:49 +0200
Message-ID: <CAOQ7t2bdBqS=AdhqYZdNeqygF_RB9tKMJ_y3XtpA7z6XbJsKXQ@mail.gmail.com>
References: <1408272594-10814-1-git-send-email-carlo@caione.org>
	<20140817142912.GA29963@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-serial-owner@vger.kernel.org>
In-Reply-To: <20140817142912.GA29963@gmail.com>
Sender: linux-serial-owner@vger.kernel.org
To: Beniamino Galvani <b.galvani@gmail.com>
Cc: Carlo Caione <carlo@caione.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-serial@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, robh+dt@kernel.org, Mark Rutland <mark.rutland@arm.com>, ijc+devicetree@hellion.org.uk, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, gregkh@linuxfoundation.org, jslaby@suse.cz, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Sun, Aug 17, 2014 at 4:29 PM, Beniamino Galvani <b.galvani@gmail.com> wrote:

> nice job! The patches work fine on a Tronsmart Vega S89 Elite TV box
> (Meson8 S802 SoC) just changing the fixed-clock frequency in the dts.

This means that probably also the timer driver can be somehow shared
between Meson6 and Meson8. If this is confirmed in v2 I can make a
generic clocksource/clockevents driver for both the architectures.

Thanks,

-- 
Carlo Caione
