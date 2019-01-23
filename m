From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH reset-next 0/2] reset: brcmstb: Misc fixes
Date: Wed, 23 Jan 2019 10:41:50 +0100
Message-ID: <1548236510.3904.3.camel@pengutronix.de>
References: <20190123003345.13750-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190123003345.13750-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, rdunlap@infradead.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, paul.gortmaker@windriver.com
List-Id: devicetree@vger.kernel.org

On Tue, 2019-01-22 at 16:33 -0800, Florian Fainelli wrote:
> Hi Philipp,
> 
> These two patches fix some recent issues brought up by Paul and Randy,
> feel free to squash into c196cdc7659d ("reset: Add Broadcom STB SW_INIT
> reset controller driver") since this is only in reset/next and
> linux-next so far.

If you want this squashed, feel free to submit an updated version of the
original patches and I'll replace them. That way I don't have to decide
how to stitch (or drop) the commit messages.

thanks
Philipp
