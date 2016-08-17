From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 2/2] ARM: davinci_all_defconfig: enable modules for sound
 on LCDK
Date: Wed, 17 Aug 2016 14:20:51 +0530
Message-ID: <52f428a2-7818-5f3a-bb66-70e2eaa63e7a@ti.com>
References: <20160810200853.24275-1-kbeldan@baylibre.com>
 <20160810200853.24275-2-kbeldan@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160810200853.24275-2-kbeldan@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Karl Beldan <kbeldan@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Kevin Hilman <khilman@baylibre.com>, Karl Beldan <karl.beldan+oss@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thursday 11 August 2016 01:38 AM, Karl Beldan wrote:
> This is the minimal set of additional modules required to support audio
> on the LCDK.
> 
> Signed-off-by: Karl Beldan <kbeldan@baylibre.com>

This patch does not apply because Kevin already added some missing audio
modules through commit "ARM: davinci_all_defconfig: enable DA850 audio
as modules"

Can you please rebase on master branch of my tree[1] and resend?

Regards,
Sekhar

[1]
https://git.kernel.org/cgit/linux/kernel/git/nsekhar/linux-davinci.git/log/
