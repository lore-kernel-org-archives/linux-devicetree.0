From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: only apply reset hacks to broken hardware
Date: Wed, 1 Aug 2018 10:24:48 +0200
Message-ID: <3f29b079-6061-53f5-69bb-6e162f648d61@gmail.com>
References: <20180727183313.137943-1-computersforpeace@gmail.com>
 <20180727220337.1b3375ca@bbrezillon>
 <87wotcrz94.fsf@notabene.neil.brown.name>
 <20180731221255.3e65c1fa@bbrezillon>
 <a74ea3ee-894d-3129-ec15-e44261e0c11c@gmail.com>
 <87muu6rkb7.fsf@notabene.neil.brown.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <87muu6rkb7.fsf@notabene.neil.brown.name>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: NeilBrown <neilb@suse.com>, Boris Brezillon <boris.brezillon@bootlin.com>
Cc: devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Zhiqiang Hou <Zhiqiang.Hou@nxp.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>
List-Id: devicetree@vger.kernel.org

On 08/01/2018 02:40 AM, NeilBrown wrote:
> On Wed, Aug 01 2018, Marek Vasut wrote:
> 
>> On 07/31/2018 10:12 PM, Boris Brezillon wrote:
>>> On Tue, 31 Jul 2018 11:05:11 +1000
>>> NeilBrown <neilb@suse.com> wrote:
>>>
>>>> On Fri, Jul 27 2018, Boris Brezillon wrote:
>>>>
>>>>> On Fri, 27 Jul 2018 11:33:13 -0700
>>>>> Brian Norris <computersforpeace@gmail.com> wrote:
>>>>>  
>>>>>> Commit 59b356ffd0b0 ("mtd: m25p80: restore the status of SPI flash when
>>>>>> exiting") is the latest from a long history of attempts to add reboot
>>>>>> handling to handle stateful addressing modes on SPI flash. Some prior
>>>>>> mostly-related discussions:
>>>>>>
>>>>>> http://lists.infradead.org/pipermail/linux-mtd/2013-March/046343.html
>>>>>> [PATCH 1/3] mtd: m25p80: utilize dedicated 4-byte addressing commands
>>>>>>
>>>>>> http://lists.infradead.org/pipermail/barebox/2014-September/020682.html
>>>>>> [RFC] MTD m25p80 3-byte addressing and boot problem
>>>>>>
>>>>>> http://lists.infradead.org/pipermail/linux-mtd/2015-February/057683.html
>>>>>> [PATCH 2/2] m25p80: if supported put chip to deep power down if not used
>>>>>>
>>>>>> Previously, attempts to add reboot-time software reset handling were
>>>>>> rejected, but the latest attempt was not.
>>>>>>
>>>>>> Quick summary of the problem:
>>>>>> Some systems (e.g., boot ROM or bootloader) assume that they can read
>>>>>> initial boot code from their SPI flash using 3-byte addressing. If the
>>>>>> flash is left in 4-byte mode after reset, these systems won't boot. The
>>>>>> above patch provided a shutdown/remove hook to attempt to reset the
>>>>>> addressing mode before we reboot. Notably, this patch misses out on
>>>>>> huge classes of unexpected reboots (e.g., crashes, watchdog resets).
>>>>>>
>>>>>> Unfortunately, it is essentially impossible to solve this problem 100%:
>>>>>> if your system doesn't know how to reset the SPI flash to power-on
>>>>>> defaults at initialization time, no amount of software can really rescue
>>>>>> you -- there will always be a chance of some unexpected reset that
>>>>>> leaves your flash in an addressing mode that your boot sequence didn't
>>>>>> expect.
>>>>>>
>>>>>> While it is not directly harmful to perform hacks like the
>>>>>> aforementioned commit on all 4-byte addressing flash, a
>>>>>> properly-designed system should not need the hack -- and in fact,
>>>>>> providing this hack may mask the fact that a given system is indeed
>>>>>> broken. So this patch attempts to apply this unsound hack more narrowly,
>>>>>> providing a strong suggestion to developers and system designers that
>>>>>> this is truly a hack. With luck, system designers can catch their errors
>>>>>> early on in their development cycle, rather than applying this hack long
>>>>>> term. But apparently enough systems are out in the wild that we still
>>>>>> have to provide this hack.
>>>>>>
>>>>>> Document a new device tree property to denote systems that do not have a
>>>>>> proper hardware (or software) reset mechanism, and apply the hack (with
>>>>>> a loud warning) only in this case.
>>>>>>
>>>>>> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>>>>>> ---
>>>>>> Note that I intentionall didn't split the documentation patch. It seems
>>>>>> clearer to do these together IMO, but if it's *really* important to
>>>>>> someone...I can resend  
>>>>>
>>>>> I'm fine with that.
>>>>>
>>>>> I'll leave Neil some time to review/test/comment on the patch before
>>>>> queuing it, but it looks good to me.  
>>>>
>>>> Thanks.
>>>> I can confirm that if I apply this patch, my system won't reboot
>>>> properly (as expected), and if I then add
>>>>
>>>> 		broken-flash-reset;
>>>>
>>>> to the jedec,spi-nor device, it starts functioning correctly again.
>>>>
>>>> I don't like the pejorative "broken", and it also suggests that a thing
>>>> used to work, but something happened to break it - this is not
>>>> accurate.
>>>> I would prefer something like "reset-not-connected" which is an accurate
>>>> description of the state of the hardware.
>>>>
>>>> I also think that having a WARN_ON is an over-reaction.  Certainly a
>>>> warning could be appropriate, but just one pr_warn() should be enough.
>>>> The "problem" is unlikely in practice, and loudly warning people that an
>>>> asteroid might kill them isn't particularly helpful.
>>>>
>>>> I genuinely think that if the system fails to reboot, then Linux is at
>>>> fault. I accept that changing Linux to be completely robust might be
>>>> more trouble than it is worth, but I don't accept that it is impossible.
>>>>
>>>> But I don't intend to fight either of these battles.
>>>
>>> Does that mean you're accepting this change? Brian, any comment on what
>>> Neil said?
>>>
>>> To be honest, I hate being in the middle of this discussion without
>>> having been involved in the first decision to accept such workarounds.
>>> I keep thinking that making boards that do not have reset properly
>>> wired less likely to fail rebooting is a wise decision, but I also
>>> agree with Brian when he says we should inform people that their design
>>> is unreliable.
>>
>> Hiding the issue in most cases only leads to vendors making more such
>> crippled boards and never learning.
> 
> And you think that printing a loud warning would be likely to get vendor
> to make fewer crappy boards?
> I think it would just annoy people who aren't in a position to do
> anything about it.

If your hardware is broken and it cannot be properly worked around by
software, what do you do ?

-- 
Best regards,
Marek Vasut

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
