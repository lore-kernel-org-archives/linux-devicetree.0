From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/6] ARM: cygnus: Initial support for Broadcom Cygnus
	SoC
Date: Wed, 8 Oct 2014 12:41:12 +0100
Message-ID: <20141008114112.GG5182@n2100.arm.linux.org.uk>
References: <sbranden@broadcom.com> <1412746025-11998-1-git-send-email-sbranden@broadcom.com> <1412746025-11998-2-git-send-email-sbranden@broadcom.com> <20141008081112.GB5182@n2100.arm.linux.org.uk> <54351D49.7040104@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54351D49.7040104@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Scott Branden <sbranden@broadcom.com>
Cc: Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, bcm-kernel-feedback-list@broadcom.com, Mike Turquette <mturquette@linaro.org>, Alex Elder <elder@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Antti Palosaari <crope@iki.fi>, JD Zheng <jdzheng@broadcom.com>, Ray Jui <rjui@broadcom.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jonathan Richardson <jonathar@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 08, 2014 at 04:17:29AM -0700, Scott Branden wrote:
> Thanks - was unaware of this functionality.  Will add .l2c_aux_val and  
> .l2c_aux mask to DT_MATCHINE_START.  BUT, what happens when we need to  
> add trustzone support and make SMC call to secure monitor?

You will then need to implement the .l2c_write_sec initialiser in the
same place.

Note that there's work to revise the trustzone support in this area
which will probably be merged for 3.19.

-- 
FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.
