From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATH] MIPS: ath79: Add OF support and DTS for TL-WR1043ND
Date: Sat, 18 Apr 2015 13:33:20 -0700
Message-ID: <5532BF90.2040907@gmail.com>
References: <1429280669-2986-1-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429280669-2986-1-git-send-email-albeu@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Alban Bedel <albeu@free.fr>, linux-mips@linux-mips.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Ralf Baechle <ralf@linux-mips.org>, Andrew Bresticker <abrestic@chromium.org>, Qais Yousef <qais.yousef@imgtec.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Gabor Juhos <juhosg@openwrt.org>
List-Id: devicetree@vger.kernel.org

Le 17/04/2015 07:24, Alban Bedel a =C3=A9crit :
> This series add OF bindings and code support for the interrupt
> controllers, clocks and GPIOs. However it was only tested on a
> TL-WR1043ND with an AR9132, others SoCs are untested, and a few are
> not supported at all.
>=20
> Most code changes base on the previous bug fix series:
> [PATH] MIPS: ath79: Various small fix to prepare OF support

Any reasons why Gabor Juhos is not CC'd on these patches?
--
=46lorian
