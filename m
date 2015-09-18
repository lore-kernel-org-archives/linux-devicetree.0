From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 3/9] ARM: dts: Remove unused PCI I/O resource in Cygnus
Date: Fri, 18 Sep 2015 23:28:28 +0200
Message-ID: <4598126.bTshpfCuvX@wuerfel>
References: <1442611454-16331-1-git-send-email-rjui@broadcom.com> <1442611454-16331-4-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442611454-16331-4-git-send-email-rjui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ray Jui <rjui@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Friday 18 September 2015 14:24:08 Ray Jui wrote:
> Remove unused PCI I/O resource in bcm-cygnus.dtsi
> 
> Signed-off-by: Ray Jui <rjui@broadcom.com>
> Reviewed-by: Scott Branden <sbranden@broadcom.com>
> 

Why? How do you know that nobody ever plugs in a card with I/O ports?

	Arnd
