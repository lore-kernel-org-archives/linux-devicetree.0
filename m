From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM5301X: Relicense most DTS files to the GPL 2.0+ / MIT
Date: Thu,  3 May 2018 17:51:02 -0700
Message-ID: <20180504005102.20717-1-f.fainelli@gmail.com>
References: <20180502141102.31769-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180502141102.31769-1-zajec5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bcm-kernel-feedback-list@broadcom.com, =?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Dan Haab <dhaab@luxul.com>, Dan Haab <riproute@gmail.com>
Cc: Jon Mason <jonmason@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, =?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>
List-Id: devicetree@vger.kernel.org

On Wed,  2 May 2018 16:11:02 +0200, Rafał Miłecki <zajec5@gmail.com> wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> These files were created and ever touched by a group of three people
> only: Dan, Hauke and me. They were licensed under GNU/GPL or ISC.
> 
> Introducing and discussing SPDX-License-Identifier resulted in a
> conclusion that ISC is a not recommended license (see also a
> license-rules.rst). Moveover an old e-mail from Alan Cox was pointed
> which explained that dual licensing is a safer solution than depending
> on a common compatibility belief.
> 
> This commit switches most of BCM5301X DTS files to dual licensing using:
> 1) GPL 2.0+ to make sure they are compatible with Linux kernel
> 2) MIT to allow sharing with more permissive projects
> Both licenses belong to the preferred ones (see LICENSES/preferred/).
> 
> An attempt to relicense remaining files will be made separately and will
> require approve from more/other developers.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---

Applied to devicetree/next, thanks!
--
Florian
