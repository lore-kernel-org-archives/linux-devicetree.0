From: Tony Lindgren <tony@atomide.com>
Subject: Re: [RFC 9/9] of/irq: create interrupts-extended property
Date: Thu, 17 Oct 2013 10:33:11 -0700
Message-ID: <20131017173310.GC15154@atomide.com>
References: <1381869563-16083-1-git-send-email-grant.likely@linaro.org>
 <1381869563-16083-10-git-send-email-grant.likely@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1381869563-16083-10-git-send-email-grant.likely@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

* Grant Likely <grant.likely@linaro.org> [131015 13:43]:
> The standard interrupts property in device tree can only handle
> interrupts coming from a single interrupt parent. If a device is wired
> to multiple interrupt controllers, then it needs to be attached to a
> node with an interrupt-map property to demux the interrupt specifiers
> which is confusing. It would be a lot easier if there was a form of the
> interrupts property that allows for a separate interrupt phandle for
> each interrupt specifier.
> 
> This patch does exactly that by creating a new interrupts-extended
> property which reuses the phandle+arguments pattern used by GPIOs and
> other core bindings.
> 
> Signed-off-by: Grant Likely <grant.likely@linaro.org>
> Cc: Rob Herring <rob.herring@calxeda.com>

Works for me and solves the issue for devices with interrupts
from multiple interrupt controllers:

Acked-by: Tony Lindgren <tony@atomide.com>
