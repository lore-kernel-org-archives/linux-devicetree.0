From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 3/3] arm: dts: dra7: fixup qspi entry
Date: Wed, 09 Jul 2014 12:18:30 +0200
Message-ID: <53BD16F6.1030006@linutronix.de>
References: <1404844852-19980-1-git-send-email-bigeasy@linutronix.de> <1404844852-19980-3-git-send-email-bigeasy@linutronix.de> <53BD1444.6080603@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <53BD1444.6080603@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: sourav <sourav.poddar@ti.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>, Felipe Balbi <balbi@ti.com>
List-Id: devicetree@vger.kernel.org

On 07/09/2014 12:07 PM, sourav wrote:
> Hi,

Hello, Sourav,

> The number is correct and is complaining just because the crossbar stuff
> is not
> put in. I had already posted a patch[1] to remove interrupt binding as
> of now.
> 
> Hence, NAK for this patch.

Thank you for explanation. What is the status on the crossbar stuff? Is
this comming any time soon? It seems that it is also stalling the
networking pieces.

> 
> [1]: https://patchwork.kernel.org/patch/4364341/

Sebastian
