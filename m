From: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] ARM: at91: at91sam9x5: sets NPCS0 (PA14) back to GPIO
Date: Fri, 25 Jul 2014 10:45:53 +0200
Message-ID: <20140725104553.403921b1@bbrezillon>
References: <1405074175-22444-1-git-send-email-voice.shen@atmel.com>
	<53D10C50.50305@aksignal.cz>
	<20140724162645.4e19c26c@bbrezillon>
	<53D12103.3020103@aksignal.cz>
	<20140724175848.44f5da10@bbrezillon>
	<53D1F5D0.1080006@aksignal.cz>
	<20140725095319.16a8465c@bbrezillon>
	<53D214E1.4050105@aksignal.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53D214E1.4050105@aksignal.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: jiri.prchal@aksignal.cz
Cc: Bo Shen <voice.shen@atmel.com>, nicolas.ferre@atmel.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 25 Jul 2014 10:27:13 +0200
Ji=C5=99=C3=AD Prchal <jiri.prchal@aksignal.cz> wrote:

[...]
>=20
>=20
> > Could you also paste the content of /sys/kernel/debug/gpio ?
> The /sys/kernel/debug/ is empty.

You have to enable CONFIG_DEBUG_FS in your config and then mount the
debug file system:

#mount -t debugfs dbg /sys/kernel/debug




--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
