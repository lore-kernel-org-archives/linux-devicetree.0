From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 0/4] SMP support for Broadcom NSP
Date: Fri, 06 Nov 2015 22:26:20 +0100
Message-ID: <2861343.fhR947i94r@phil>
References: <1446844273-6460-1-git-send-email-kapilh@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446844273-6460-1-git-send-email-kapilh@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kapil Hali <kapilh@broadcom.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, Lee Jones <lee@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, Kever Yang <kever.yang@rock-chips.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Olof Johansson <olof@lixom.net>, Paul Walmsley <paul@pwsan.com>, Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Hi,

Am Freitag, 6. November 2015, 16:11:09 schrieb Kapil Hali:
> Change in v3:
> * Fixed patch subject from RESEND PATCH to PATCH
> * Deleted arch/arm/mach-bcm/bcm_nsp.h file
> * Removed inclusion of header file bcm_nsp.h in platsmp.c
> * Removed unused variable 'timeout' in nsp_boot_secondary()

I'm still not sure why I'm getting this :-) . But with the number of patch 
(re-)sends it's crowding my inbox a bit to much for my liking, so please drop 
me of your recipient list


Thanks
Heiko
