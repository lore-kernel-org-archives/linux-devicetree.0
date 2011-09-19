From: Dave Martin <dave.martin@linaro.org>
Subject: Re: [PATCH] pata-generic/of: Make probing via device tree non-powerpc-specific
Date: Mon, 19 Sep 2011 11:05:41 +0100
Message-ID: <CA+wbFdc0SicHLN6=JQz-rRXqKovhr7=acUQi3esUU_qcXgCaAw@mail.gmail.com>
References: <1316183890-13677-1-git-send-email-dave.martin@linaro.org>
	<20110916214313.GB16381@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-ide-owner@vger.kernel.org>
In-Reply-To: <20110916214313.GB16381@n2100.arm.linux.org.uk>
Sender: linux-ide-owner@vger.kernel.org
To: Pawel Moll <pawel.moll@arm.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, linux-ide@vger.kernel.org, Jeff Garzik <jgarzik@pobox.com>, linux-arm-kernel@lists.infradead.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Sep 16, 2011 at 10:43 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Fri, Sep 16, 2011 at 03:38:10PM +0100, Dave Martin wrote:
>> This patch enables device-tree-based probing of the pata-generic
>> platform driver across all architectures:

[...]

>
> This may not be the correct way to support the CF slot on Versatile
> Express - it depends whether the CF slot on VE supports just CF
> memory cards or whether it can take any CF card.
>
> If the latter, then what may be inserted could be a CF network card,
> and that means it's probably wrong to tell the kernel that what's
> there is a PATA interface.

Interesting point.  I don't know whether we've tried plugging anything
else in...

Pawel, can you comment?

Cheers
---Dave
