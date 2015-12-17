From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 0/8] Raspberry Pi 2 support.
Date: Thu, 17 Dec 2015 01:03:59 +0100
Message-ID: <21040591.KakM5Gl6ZZ@wuerfel>
References: <1450310115-22163-1-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450310115-22163-1-git-send-email-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Anholt <eric@anholt.net>
Cc: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 16 December 2015 15:55:07 Eric Anholt wrote:
> This is a major rewrite of the previous Raspberry Pi 2 submission.
> SMP support is now included, and the DT includes are cleaned up to
> avoid massive duplication.
> 
> The branch (based on 4.4-rc5, to get the USB regression fixes) can be
> found at:
> 
> https://github.com/anholt/linux/tree/bcm2836-4.4

Looks all good to me, but when we get the pull request, I'd strongly
prefer to have that based on -rc3 or earlier.

What commit is the USB regression fix you refer to above? Is that in a
branch that is -rc3 based? Maybe you can rebase the changes on top
of that branch, to minimize the amount of backmerges?

	Arnd
