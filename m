From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 1/3] ARM: mediatek: Add Reset Controller for MediaTek
 SoC
Date: Mon, 03 Nov 2014 10:55:46 +0100
Message-ID: <1415008546.3060.8.camel@pengutronix.de>
References: <1415005371-4323-1-git-send-email-flora.fu@mediatek.com>
	 <1415005371-4323-2-git-send-email-flora.fu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1415005371-4323-2-git-send-email-flora.fu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Flora Fu <flora.fu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, arm@kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

Am Montag, den 03.11.2014, 17:02 +0800 schrieb Flora Fu:
> Add a driver in reset controller.
> 
> Signed-off-by: Flora Fu <flora.fu@mediatek.com>
[...]

This version looks good to me. I'm going to apply it as soon as there is
agreement on the syscon child device patch.

regards
Philipp
