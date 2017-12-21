From: Maciej Purski <m.purski@samsung.com>
Subject: Re: [PATCH v3 4/4] regulator: core: Balance coupled regulators
 voltages
Date: Thu, 21 Dec 2017 14:29:14 +0100
Message-ID: <d7555270-5be3-a104-233c-ac0e6383f41b@samsung.com>
References: <1512639975-22241-1-git-send-email-m.purski@samsung.com>
        <CGME20171207094754eucas1p1528c6c30135124430a5c703eb81de8d2@eucas1p1.samsung.com>
        <1512639975-22241-5-git-send-email-m.purski@samsung.com>
        <20171212115427.GG16323@sirena.org.uk>
        <0bca0d20-1ca8-be4c-a60e-bbc0c640ae41@samsung.com>
        <20171215151958.GH1827@finisterre>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20171215151958.GH1827@finisterre>
Content-language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: devicetree@vger.kernel.org



On 12/15/2017 04:19 PM, Mark Brown wrote:
> On Wed, Dec 13, 2017 at 10:25:00AM +0100, Maciej Purski wrote:
> 
>>> shared.  To that end I'd adjust the code so that we always have a
>>> coupling descriptor and then handle the case where there's only one
>>> regulator described in there.
> 
>> Do you have any suggestion, how should I implement that path? The thing which
>> makes it more complicated is locking, because set_voltage_unlocked is done
>> under one regulator's mutex and its suppliers, while balance procedure locks
>> every coupled regulator without its suppliers. The suppliers for a single
>> regulator are locked when setting a single regulator's voltage takes place.
> 
> We only really need to lock the supplies when doing the actual mechanics
> of voltage changes so I'm not sure I see a big issue here - if we always
> go through balancing first then voltage setting it should be fine.  If
> everything is always balancing (even uncoupled regulators) then part of
> the transition should be moving some if not all of the data updates to
> balancing.
> 

Now I can understand your point, but I still have doubts what is the advantage 
of that solution. For non-coupled regulators we end up with useless data 
structure - coupling_desc. That also might cause some confusion. We expect 
coupled regulators to be a very rare case, so in most of the cases we will have 
a pointless structure in reg_dev with a pointer to itself. Maybe you suggest 
that coupling_desc should contain something different?
