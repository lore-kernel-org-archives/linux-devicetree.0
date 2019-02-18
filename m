From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/3] ARM: dts: rk3288 Tinker Board (S) sdcard changes
Date: Mon, 18 Feb 2019 11:54:09 +0000
Message-ID: <6a15343b-554b-6059-09af-f6511e740866@arm.com>
References: <20190217121513.22965-1-beagleboard@davidjohnsummers.uk>
 <20190217121513.22965-2-beagleboard@davidjohnsummers.uk>
 <e83b0404-bd32-a5d5-2e32-e0f49b122b95@arm.com>
 <2d8ac4e6-b825-dca7-d3cb-57cb32b3230b@davidjohnsummers.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2d8ac4e6-b825-dca7-d3cb-57cb32b3230b@davidjohnsummers.uk>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Summers <beagleboard@davidjohnsummers.uk>, heiko@sntech.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 17/02/2019 15:19, David Summers wrote:
> On 17/02/2019 14:00, Robin Murphy wrote:
>> Hi David,
>>
>> On 2019-02-17 12:15 pm, David Summers wrote:
>>> This patch makes some minor changes to how the sd card is
>>> described in the device tree for the ASUS Tinker Board (S). In
>>> particular on the Tinker Board S, when booted from the eMMC, and with
>>> no card in the sd slot, and the log has endless messages about not
>>> being able to detect the card.
>>>
>>> Several methods to remove this error have been tried, the only one
>>> that works is the broken-cd and so that is what is applied here.
>>
>> I don't have a Tinker Board, but the symptom sounds instantly familiar 
>> from hacking on another RK3288 box; have you tried adding 
>> "regulator-always-on" to the vccio_sd regulator?
>>
>> With the reference design (which I would assume the Tinker Board has 
>> no reason to deviate from in this area), the CD pin is either wired 
>> directly to the SoC with no external pull-up, or explicitly pulled up 
>> to VCCIO_SD. Either way, when the dwmmc driver probes and discovers 
>> there is no card present, it sets the currently-unnecessary 
>> vqmmc-supply as inactive, and thus the regulator core turns off 
>> VCCIO_SD entirely. Unfortunately, this removes the voltage from the 
>> entire I/O domain including the internal pull-up, which ends up 
>> leaving the CD pin floating and generating spurious events.
>>
>> Robin.
> 
> Hi Robin,
> 
> An interesting suggestion - no it hasn't been tried to always set the 
> vccio_sd regulator on. Will give it a go on ArchLinux Arm.
> 
> I guess this would explain why the Tinker Board booting from sd doesn't 
> see the error, as its enabled probably in uboot and then keeps working.
> 
> IIRC though, if booting the TBS from eMMC, then inserting an sd card and 
> the errors stop. I guess this wouldn't happen if the power wasn't applied?

That's the fun part of this scenario - the presence of a card is 
unambiguous, it's only the absence of one which depends on the pull-up 
state, so whenever as a card is inserted everything does work correctly. 
  Assuming they are the same errors I was seeing, they're from the 
driver *thinking* a card is inserted due to CD floating low, then 
failing to communicate with it, after which it powers down the I/O 
interface again and the whole cycle begins anew.

> I guess also that "regulator-always-on" is a quick test - but that for 
> submission to kernel it would be better done via "mmc-pwrseq-simple"?

No, it's a valid description of the hardware to say "disabling this 
regulator makes something fail to work as expected" if that is truly the 
case. Besides, pwrseq is about how to initialise a detected present 
card, not how to correctly detect that presence in the first place.

> Anyway I set up a test - so we can confirm this.

Great - there is of course still the possibility that the pin really 
isn't wired up at all, in which case ignoring CD and taking the CPU 
overhead of polling would be the only option, but the vendor DT doesn't 
have any signs to suggest that's the case, and makes me lean more 
towards the pull-up issue.

Robin.
