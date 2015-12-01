From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v4 2/5] ARM: BCM: Clean up SMP support for Broadcom Kona
Date: Tue, 01 Dec 2015 15:07:21 -0800
Message-ID: <565E2829.7030103@gmail.com>
References: <1448987049-17041-1-git-send-email-kapilh@broadcom.com> <1448987049-17041-3-git-send-email-kapilh@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448987049-17041-3-git-send-email-kapilh@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kapil Hali <kapilh@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Lee Jones <lee@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, Kever Yang <kever.yang@rock-chips.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Olof Johansson <olof@lixom.net>, Paul Walmsley <paul@pwsan.com>, Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On 01/12/15 08:24, Kapil Hali wrote:
> These changes cleans up SMP implementaion for Broadcom's
> Kona SoC which are required for handling SMP for iProc
> family of SoCs at a single place for BCM NSP and BCM Kona.
> 
> Signed-off-by: Kapil Hali <kapilh@broadcom.com>

Applied to soc/next, thanks!
-- 
Florian
