From: Roland Stigge <stigge@antcom.de>
Subject: Re: [PATCH] MTD: LPC32xx SLC NAND driver
Date: Tue, 15 May 2012 15:48:28 +0200
Message-ID: <4FB25EAC.10205@antcom.de>
References: <1336829386-23301-1-git-send-email-stigge@antcom.de>  <1337068543.2528.143.camel@sauron.fi.intel.com>  <4FB2109A.2080505@freescale.com> <4FB25837.2050603@antcom.de> <1337088703.2528.208.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1337088703.2528.208.camel@sauron.fi.intel.com>
Sender: linux-doc-owner@vger.kernel.org
To: dedekind1@gmail.com
Cc: Huang Shijie <b32955@freescale.com>, Bastian Hecht <hechtb@googlemail.com>, Lars-Peter Clausen <lars@metafoo.de>, Lei Wen <leiwen@marvell.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dwmw2@infradead.org, kevin.wells@nxp.com, srinivas.bakki@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05/15/2012 03:31 PM, Artem Bityutskiy wrote:
>> As I understand loops_per_jiffy, this loop will take much longer
>> than the 100 ms you defined above?
> 
> Not sure about much, but longer. The idea is that this is about
> the error path so if we report -EIO with a slight delay - no
> problem.

Turned out that the condition (FIFO empty) is always true for me.
Keeping the check for safety reasons for now, doing the timeout with
msleep()s which should be (cpu-wise) "social" enough and are
unexpected anyway but do approximate the ms timeout more precisely.

Roland
