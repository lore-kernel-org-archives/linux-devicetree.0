From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH] regulator: ti-abb: Add support for interleaved LDO registers
Date: Fri, 17 Jan 2014 10:47:29 -0600
Message-ID: <52D95EA1.6000608@ti.com>
References: <1389900750-27625-1-git-send-email-nm@ti.com> <20140117160821.GV17314@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140117160821.GV17314@sirena.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/17/2014 10:08 AM, Mark Brown wrote:
> On Thu, Jan 16, 2014 at 01:32:30PM -0600, Nishanth Menon wrote:
>> Certain platforms such as DRA7 have quirky memory maps such as:
>> PRM_ABBLDO_DSPEVE_CTRL	0x4ae07e20
>> PRM_ABBLDO_IVA_CTRL	0x4ae07e24
>> other-registers
>> PRM_ABBLDO_DSPEVE_SETUP	0x4ae07e30
>> PRM_ABBLDO_IVA_SETUP	0x4ae07e34
>>
>> These need the address allocation to be either shared OR unique
>> allocation per register instance.
> 
> Is there a system controller involved here by any chance?
> 
Nope. ABB LDO module is a standalone instance whose register set
happens to be part of a memory range, as I recently got to know, is a
favorite for our hardware designers to put "misc" modules at SoC
integration time - Sigh! I guess I have made more than enough stink
about this internally already :(.

-- 
Regards,
Nishanth Menon
