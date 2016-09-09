From: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 4/8] ARM: dts: bcm283x: Add a new EMMC pin group from
 the downstream tree.
Date: Fri, 09 Sep 2016 10:26:31 +0200
Message-ID: <1473409591.6698.81.camel@redhat.com>
References: <1473244289-20728-1-git-send-email-kraxel@redhat.com>
         <1473244289-20728-5-git-send-email-kraxel@redhat.com>
         <87650770.23554.026b1e4b-e35d-48e6-9394-7eeea0ff9add.open-xchange@email.1und1.de>
         <1473320687.6698.25.camel@redhat.com>
         <429647ef-ff1e-4999-5b19-3b4529ad3872@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <429647ef-ff1e-4999-5b19-3b4529ad3872@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

  Hi,

> No, i thought of the GPIO pull up/down register values:
> 
> BCM2835_PUD_OFF 0
> BCM2835_PUD_DOWN 1
> BCM2835_PUD_UP 2

We can do that, sure (and probably drop the unused "enum
bcm2835_pinconf_pull" from drivers/pinctrl/bcm/pinctrl-bcm2835.c at the
same time).

But I fail to see how this is related to the patch discussed, looks like
a independent issue to me ...

cheers,
  Gerd
