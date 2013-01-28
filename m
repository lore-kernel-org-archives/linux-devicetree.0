From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH V2] ARM: davinci: da850: add RTC DT entries
Date: Mon, 28 Jan 2013 21:32:13 +0530
Message-ID: <5106A105.6030004@ti.com>
References: <1359359268-9781-1-git-send-email-mrugesh.mk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1359359268-9781-1-git-send-email-mrugesh.mk@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Mrugesh Katepallewar <mrugesh.mk@ti.com>
Cc: devicetree-discuss@lists.ozlabs.org, davinci-linux-open-source@linux.davincidsp.com, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net, hs@denx.de
List-Id: devicetree@vger.kernel.org

Hi Mrugesh,

On 1/28/2013 1:17 PM, Mrugesh Katepallewar wrote:
> Add RTC DT entries in da850 dts file.
> 
> Signed-off-by: Mrugesh Katepallewar <mrugesh.mk@ti.com>
> ---
> Applies on top of v3.8-rc4 of linus tree.
> 
> This patch is depending on 
> "ARM: davinci: da850: add interrupt-parent property in soc node"
> https://patchwork.kernel.org/patch/2044101/

> Tested on da850-evm device.
> 
> Test Procedure:
> date 2013.01.28-10:00:00 (usage: date[YYYY.]MM.DD-hh:mm[:ss])
> hwclock -w
> reset board and check system time.

Queuing this for v3.9. The testing information above is useful and
should be part of the changelog. I moved it there while committing.

It will be nice to check the alarm functionality as well. Can you check
that and let me know that works as well?

Thanks,
Sekhar
