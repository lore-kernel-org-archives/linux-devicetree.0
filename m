From: Alban <albeu@free.fr>
Subject: Re: [PATCH v4 12/12] MIPS: Add basic support for the TL-WR1043ND
 version 1
Date: Wed, 10 Jun 2015 23:58:11 +0200
Message-ID: <20150610235811.0b18af9b@tock>
References: <1433029955-7346-1-git-send-email-albeu@free.fr>
	<1433031506-7984-5-git-send-email-albeu@free.fr>
	<20150608131758.9d76be074998ea3de0e976a4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150608131758.9d76be074998ea3de0e976a4@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Antony Pavlov <antonynpavlov@gmail.com>
Cc: Aban Bedel <albeu@free.fr>, linux-mips@linux-mips.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Ralf Baechle <ralf@linux-mips.org>, Andrew Bresticker <abrestic@chromium.org>, Qais Yousef <qais.yousef@imgtec.com>, Gabor Juhos <juhosg@openwrt.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 8 Jun 2015 13:17:58 +0300
Antony Pavlov <antonynpavlov@gmail.com> wrote:

> IMHO AR9132 SoC can't work without external oscilator.
> 
> Can we just move basic extosc declaration to SoC dt file
> (ar9132.dtsi)? So board dt file ar9132_tl_wr1043nd_v1.dts will
> contain only oscilator clock frequency value.

I would prefer to keep the split between the files in sync with the
hardware. I understand that most simple board designs use a fixed
oscillator, but that might not always be the case.

Alban
