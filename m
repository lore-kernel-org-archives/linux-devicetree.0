From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/2] ARM: bcm2835: Add devicetree for the Raspberry Pi 3.
Date: Mon, 7 Mar 2016 22:54:30 -0700
Message-ID: <56DE6916.9080608@wwwdotorg.org>
References: <1457116769-8567-1-git-send-email-eric@anholt.net>
 <1457116769-8567-2-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457116769-8567-2-git-send-email-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Anholt <eric@anholt.net>
Cc: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/04/2016 11:39 AM, Eric Anholt wrote:
> For now this doesn't support the new hardware present on the Pi 3 (BT,
> wifi, GPIO expander).  Since the GPIO expander isn't supported, we
> also don't have the LEDs like the other board files do.

The series,
Acked-by: Stephen Warren <swarren@wwwdotorg.org>

... although I'd be slightly surprised if this was accepted; when 
AArch64 was first announced, I thought the mainline ARM kernel community 
decided that only 64-bit kernels would be supported on 64-bit HW? Still, 
I don't immediately see that in any commit log or in the kernel doc 
directory, so perhaps I'm misremembering. Hopefully; life is simpler 
that way:-)
