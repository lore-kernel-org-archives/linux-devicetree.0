Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:33706 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754425Ab3GaU5f (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 31 Jul 2013 16:57:35 -0400
Message-ID: <51F97A3C.9010409@wwwdotorg.org>
Date: Wed, 31 Jul 2013 14:57:32 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [RFC] binding for nvec mfd device
References: <1416005.VvfEeGuSWa@ax5200p> <51F6E5BE.3080400@wwwdotorg.org> <20130731141314.GO29859@e106331-lin.cambridge.arm.com>
In-Reply-To: <20130731141314.GO29859@e106331-lin.cambridge.arm.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Dietrich <marvin24@gmx.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Andrey Danin <danindrey@mail.ru>, Ian Campbell <ian.campbell@citrix.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>
List-ID: <devicetree@vger.kernel.org>

On 07/31/2013 08:13 AM, Mark Rutland wrote:
> On Mon, Jul 29, 2013 at 10:59:26PM +0100, Stephen Warren wrote:
>> On 07/27/2013 07:23 AM, Marc Dietrich wrote:
>>> Hi,
>>>
>>> this is an RFC for an mfd device introduced here [1]. I didn't got much 
>>> response, except from Stephen, but that bothered me enough already ;-)

... [propose binding for Tegra I2C slave controller, and NVEC protocol
components]

>> One question I have here: There is a single I2C HW module on Tegra that
>> can act either as a master or a slave. I don't think it can do both at
>> once. Should we: ...
> 
> Is that configurable at run-time, or an integration decision?

It's certainly a run-time decision whether to operate the HW in master
or slave mode, and this is independent from anything on the board,
except of course for whether it actually makes sense to use master or
slave mode purely based on which external components are hooked up to
the bus.

I imagine that at least by appropriately resetting or reconfiguring it,
you could switch roles at run-time too. I don't know if you can actually
actively use both the master and slave portions of the HW at the exact
same time independently though. Marc is right that the diagrams in the
documentation certainly imply you can use both at the same time,
although I'm not totally convinced looking at the registers. I'm CCing
Laxman to answer that question, since he knows the HW better than I.
