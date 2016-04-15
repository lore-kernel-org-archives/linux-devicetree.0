From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH 1/3] ARM: DTS: da850: add node for spi0
Date: Fri, 15 Apr 2016 11:17:55 -0500
Message-ID: <57111433.6080402@lechnology.com>
References: <1460586628-25152-1-git-send-email-david@lechnology.com>
 <1460586628-25152-2-git-send-email-david@lechnology.com>
 <5710C176.3040304@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5710C176.3040304@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kevin Hilman <khilman@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/15/2016 05:24 AM, Sekhar Nori wrote:

>
> This made me notice that num-cs is populated wrongly for spi1. It
> actually has 8 chip selects. This is fine though.

I might as well fix it since I have to make changes anyway. Don't 
remember how I came up with 6.

>
> Also, it will be nice to add pinctrl entries for spi0 like it is done
> for spi1. You will need those anyway for using the interface.

I omitted this on purpose. For my use case, I am using the SPI as 
write-only, so not using the SOMI pin, which is actually muxed as a GPIO 
for something else. So having a pinctl like spi1 is of no use to me. I 
figured if someone needs it, they can add it, otherwise it just is 
wasted space to me.
>
> I prefer DT updates are patches of their own and not combined with code
> updates like this. Can you please split this up?

Ack.
