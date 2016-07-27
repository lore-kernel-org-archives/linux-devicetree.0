From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: NSP: Correct RAM amount for BCM958625HR
 board
Date: Wed, 27 Jul 2016 12:12:58 -0700
Message-ID: <abb66d7e-7e58-e25a-10d0-40d0712f9508@gmail.com>
References: <1468527257-3339-1-git-send-email-jon.mason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1468527257-3339-1-git-send-email-jon.mason@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Mason <jon.mason@broadcom.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 07/14/2016 01:14 PM, Jon Mason wrote:
> The BCM958625HR board has 2GB of RAM available.  Increase the amount
> from 512MB to 2GB and add the device type to the memory entry.
> 
> Fixes: 9a4865d42fe5 ("ARM: dts: NSP: Specify RAM amount for BCM958625HR board")
> Signed-off-by: Jon Mason <jon.mason@broadcom.com>

Applied, thanks!
-- 
Florian
