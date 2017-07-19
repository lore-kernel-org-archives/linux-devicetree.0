From: Scott Branden <scott.branden@broadcom.com>
Subject: Re: [PATCH 2/2] arm64: dts: move rpi into rpi directory
Date: Wed, 19 Jul 2017 13:25:51 -0700
Message-ID: <ff694220-b771-4702-c9dc-536a3c87770e@broadcom.com>
References: <1500483950-9217-1-git-send-email-scott.branden@broadcom.com>
 <1500483950-9217-3-git-send-email-scott.branden@broadcom.com>
 <87mv80dvpo.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87mv80dvpo.fsf@eliezer.anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Stefan Wahren <stefan.wahren@i2se.com>
Cc: BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Eric,


On 17-07-19 01:21 PM, Eric Anholt wrote:
> Scott Branden <scott.branden@broadcom.com> writes:
>
>> Place rpi into its own subdirectory.  This helps as the number
>> of Broadcom boards grow and we can separate them per SoC.
> It seems like pretty unnecessary churn to me, though I wouldn't
> necessarily block it.  However, it conflicts with the patch I was
> preparing yesterday to try to resolve our DT merging troubles
> (https://lkml.org/lkml/2017/5/16/707), so I'd like to hold off on it for
> now.
I'm quite fine with dropping the rpi dts patch.  I'm going to proceed 
with the northstar2 patch
before more SoC and boards are introduced.
Thanks,
  Scott
