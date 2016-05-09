From: Chris Brand <chris.brand@broadcom.com>
Subject: Re: [PATCH 3/6] docs: Document BCM23550 bindings
Date: Mon, 9 May 2016 15:27:49 -0700
Message-ID: <CAMsMSK-da2GstXrrYVpoJh2fo-Gi70gD7WFxi8TM9M=Zmqu1Rg@mail.gmail.com>
References: <1462481334-8943-1-git-send-email-chris.brand@broadcom.com>
	<1462481334-8943-4-git-send-email-chris.brand@broadcom.com>
	<20160509194115.GA11594@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <20160509194115.GA11594@rob-hp-laptop>
Sender: linux-pm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Russell King <linux@arm.linux.org.uk>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, linux-arm-kernel@lists.infradead.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, Raymond Ngun <raymond.ngun@broadcom.com>, Markus Mayer <markus.mayer@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Mon, May 9, 2016 at 12:41 PM, Rob Herring <robh@kernel.org> wrote:
> On Thu, May 05, 2016 at 01:48:51PM -0700, Chris Brand wrote:
>> Add binding document for Broadcom BCM23550 SoC.
[...]
>> +The enable method is specified by defining the following required
>> +properties in the "cpu" device tree node:
>> +  - enable-method = "brcm,bcm23550-cpu-method";
>
> "-cpu-method" is a bit redundant. brcm,bc23550 is probably sufficient.

Fair enough. Thanks, Rob!

Chris
