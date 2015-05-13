From: Eric Anholt <eric@anholt.net>
Subject: RPi firmware driver v2
Date: Wed, 13 May 2015 12:00:06 -0700
Message-ID: <1431543609-19646-1-git-send-email-eric@anholt.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Here's a new version of the firmware driver.  This series applies on
top of for-rpi-next from Lee Jones's tree:

git://git.kernel.org/pub/scm/linux/kernel/git/rpi/linux-rpi.git

But it won't actually probe without merging in mailbox-for-next:

https://git.linaro.org/landing-teams/working/fujitsu/integration.git

I've dropped the pm-domains code for now, since it wasn't doing
anything useful for us yet without the drivers/base support.  However,
this code has been useful for building a proper clk provider for the
Pi, which can be found at:

https://github.com/anholt/linux/tree/rpi-dt-clocks

Andrea Merello apparently got a cpufreq driver working on top of the
non-DT version of this clk provider:

https://github.com/andreamerello/linux-mach-bcm/tree/bcm2836-cpufreq

I think we might manage with a generic dt-cpufreq implementation,
though.
