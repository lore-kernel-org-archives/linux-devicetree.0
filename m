From: Florian Fainelli <fainelli@broadcom.com>
Subject: Re: [PATCH v2 2/5] ARM: NSP: add minimal Northstar Plus device tree
Date: Thu, 27 Aug 2015 17:44:47 -0700
Message-ID: <55DFAEFF.9030305@broadcom.com>
References: <1440628530-6137-1-git-send-email-jonmason@broadcom.com> <1440628530-6137-3-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440628530-6137-3-git-send-email-jonmason@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Mason <jonmason@broadcom.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, Kapil Hali <kapilh@broadcom.com>
List-Id: devicetree@vger.kernel.org

On 26/08/15 15:35, Jon Mason wrote:
> Add a very minimalistic set of Northstar Plus Device Tree files which
> describes the SoC and the BCM958625 implementation.  The perpherials
> described are:
> 
> ARM Cortex A9 CPU
> 2 8250 UARTs
> ARM GIC
> PL310 L2 Cache
> ARM A9 Global timer
> 
> Signed-off-by: Kapil Hali <kapilh@broadcom.com>
> Signed-off-by: Jon Mason <jonmason@broadcom.com>

Applied to devicetree/next, thanks!
-- 
Florian
