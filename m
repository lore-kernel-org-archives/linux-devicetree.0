From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] ARM: dts: NSP: Move aliases to bcm-nsp.dtsi
Date: Mon,  5 Nov 2018 12:37:42 -0800
Message-ID: <20181105203742.7181-1-f.fainelli@gmail.com>
References: <20181029165524.26162-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181029165524.26162-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bcm-kernel-feedback-list@broadcom.com
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, 29 Oct 2018 09:55:23 -0700, Florian Fainelli <f.fainelli@gmail.com> wrote:
> All boards replicate the aliases node, move the aliases node to
> bcm-nsp.dtsi and add all the serial and ethernet ports such that a boot
> program like u-boot can populate MAC addresses accordingly.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---

Applied to devicetree/next, thanks!
--
Florian
