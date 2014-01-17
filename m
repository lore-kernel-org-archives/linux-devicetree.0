From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH] regulator: ti-abb: Add support for interleaved LDO registers
Date: Fri, 17 Jan 2014 12:11:44 -0600
Message-ID: <52D97260.1010304@ti.com>
References: <1389900750-27625-1-git-send-email-nm@ti.com> <20140117160821.GV17314@sirena.org.uk> <52D95EA1.6000608@ti.com> <20140117180015.GA17314@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140117180015.GA17314@sirena.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/17/2014 12:00 PM, Mark Brown wrote:
> On Fri, Jan 17, 2014 at 10:47:29AM -0600, Nishanth Menon wrote:
>> On 01/17/2014 10:08 AM, Mark Brown wrote:
> 
>>> Is there a system controller involved here by any chance?
> 
>> Nope. ABB LDO module is a standalone instance whose register set
>> happens to be part of a memory range, as I recently got to know, is a
>> favorite for our hardware designers to put "misc" modules at SoC
>> integration time - Sigh! I guess I have made more than enough stink
>> about this internally already :(.
> 
> That sounds exactly like a system controller :)
Hmm.. I have considered something like PRCM in OMAP as a system
controller... anyways.. I think I miss your suggestion here. Is there
something you might suggest to improve in the patch or take an
alternative route?


-- 
Regards,
Nishanth Menon
