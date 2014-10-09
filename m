From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/6] ARM: cygnus: Initial support for Broadcom Cygnus SoC
Date: Thu, 09 Oct 2014 09:32:33 +0200
Message-ID: <2721519.urlXjs6OJF@wuerfel>
References: <1412746025-11998-2-git-send-email-sbranden@broadcom.com>
 <34012512.W8VifyXY4H@wuerfel> <5435B7D7.1030904@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5435B7D7.1030904@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Scott Branden <sbranden@broadcom.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Russell King <linux@arm.linux.org.uk>, Jonathan Richardson <jonathar@broadcom.com>, Antti Palosaari <crope@iki.fi>, bcm-kernel-feedback-list@broadcom.com, Alex Elder <elder@linaro.org>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ray Jui <rjui@broadcom.com>, Matt Porter <mporter@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Daudt <bcm@fixthebug.org>, linux-kernel@vger.kernel.org, JD Zheng <jdzheng@broadcom.com>, Kumar Gala <galak@codeaurora.org>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <m.chehab@samsung.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 08 October 2014 15:16:55 Scott Branden wrote:
> It looks like I will also be able to add Northstar under the 
> ARCH_BCM_IPROC.  This will be good momentum to cleaning up and 
> consolidate support going forward.
> I will change the Kconfig such that ARCH_BCM_5301X selects ARCH_BCM_IPROC.
> 
> 

Ok, sounds good.

	Arnd
