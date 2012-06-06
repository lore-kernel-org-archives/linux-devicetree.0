From: Roland Stigge <stigge@antcom.de>
Subject: Re: [PATCH v5] MTD: LPC32xx SLC NAND driver
Date: Wed, 06 Jun 2012 11:01:44 +0200
Message-ID: <4FCF1C78.5000309@antcom.de>
References: <1338837901-24075-1-git-send-email-stigge@antcom.de> <1338972168.6875.7.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1338972168.6875.7.camel@sauron.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dedekind1@gmail.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dwmw2@infradead.org, kevin.wells@nxp.com, srinivas.bakki@nxp.com, linux-arm-kernel@lists.infradead.org, hechtb@googlemail.com, lars@metafoo.de, b32955@freescale.com, leiwen@marvell.com, linux@arm.linux.org.uk
List-Id: devicetree@vger.kernel.org

On 06/06/2012 10:42 AM, Artem Bityutskiy wrote:
> On Mon, 2012-06-04 at 21:25 +0200, Roland Stigge wrote:
>> +config MTD_NAND_SLC_LPC32XX +	bool "NXP LPC32xx SLC Controller"
> 
> Why bool and not tristate here? Why you force this to be
> compiled-in and make it impossible to be a kernel module like other
> drivers are?

Right - the solution for both issues you mention (compiling as module
and linker error) is replacing above "bool" with "tristate".

Will post an updated patch.

Thanks,

Roland
