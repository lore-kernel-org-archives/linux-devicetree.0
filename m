From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH v3 2/4] gpio-tz1090: add TZ1090 gpio driver
Date: Mon, 24 Jun 2013 16:36:23 +0100
Message-ID: <51C86777.9040006@imgtec.com>
References: <1371720391-21825-1-git-send-email-james.hogan@imgtec.com> <1371720391-21825-3-git-send-email-james.hogan@imgtec.com> <20130624133453.8FC5D3E0A89@localhost> <51C85C31.4070003@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <51C85C31.4070003@imgtec.com>
Sender: linux-doc-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 24/06/13 15:48, James Hogan wrote:
> On 24/06/13 14:34, Grant Likely wrote:
>> Similarly, can this driver use the generic irq chip to eliminate the
>> above hooks?
> 
> hmm, I could probably get away with it for irq callbacks since a bank's
> IRQ cannot be shared with non-Linux threads/cores.

I just remembered, the commits that make the generic irqchip work with
linear irq domains are in tip/irq/core so this won't work on
pinctrl/devel or gpio/next branches.

How would you like that handled? I'm happy to write a patch to convert
to generic irqchip ready to be applied later (e.g. for v3.12).

Cheers
James

