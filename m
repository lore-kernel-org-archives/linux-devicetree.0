From: Gregory Fong <gregory.0xf0@gmail.com>
Subject: Re: [PATCH 6/7] ARM: brcmstb: mask GIC IRQs on suspend
Date: Thu, 18 Jun 2015 18:48:35 -0700
Message-ID: <CADtm3G5arLABYkdKrgcKAagZRfSm_XwQO6UYfJH+ceijYuP39w@mail.gmail.com>
References: <1434672696-13632-1-git-send-email-computersforpeace@gmail.com> <1434672696-13632-7-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434672696-13632-7-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 18, 2015 at 5:11 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> Lazily-masked IRQs can cause system suspend problems (e.g., spurious
> wakeups from WFI), so we need to be sure non-wakeup GIC interrupts get
> masked, not just disabled, during system suspend.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Acked-by: Gregory Fong <gregory.0xf0@gmail.com>
