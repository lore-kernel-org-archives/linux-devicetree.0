From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 1/2] gpio: axp209: use correct register for GPIO input
 status
Date: Wed, 23 Nov 2016 14:45:32 +0100
Message-ID: <20161123144532.3089ebfd@free-electrons.com>
References: <20161123132749.11666-1-quentin.schulz@free-electrons.com>
        <20161123132749.11666-2-quentin.schulz@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161123132749.11666-2-quentin.schulz@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@free-electrons.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

On Wed, 23 Nov 2016 14:27:48 +0100, Quentin Schulz wrote:
> The GPIO input status was read from control register
> (AXP20X_GPIO[210]_CTRL) instead of status register (AXP20X_GPIO20_SS).
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>

This smells like a bug fix, so perhaps Cc: stable?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
