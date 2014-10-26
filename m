From: Ben Peddell <klightspeed@killerwolves.net>
Subject: Re: [PATCHv0] arm: mvebu: add .dts file for Synology DS213j
Date: Sun, 26 Oct 2014 18:35:18 +1000
Message-ID: <544CB246.2030607@killerwolves.net>
References: <3d0cc6de9ea5506d5fb201129ad277e57d0cdfc8.1414268057.git.arno@natisbad.org>
 <20141025221611.GA14620@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20141025221611.GA14620@lunn.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>, Arnaud Ebalard <arno@natisbad.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, Simon Guinot <sguinot@lacie.com>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On 26/10/14 08:16, Andrew Lunn wrote:
> Hi Arnaud
> 
> Nice to see another device supported.
> 
>> - When I bought the NAS, it had an old Marvell bootloader. After install
>>   of latest DSM version, the u-boot was a new one w/ I had to change the
>>   'ranges' in the .dts to the ones below to have the kernel boot. I guess
>>   new DS213j hardware will be shipped with new u-boot version at some
>>   point and this will be fine; Otherwise, users will either have to
>>   upgrade their DSM or manually s/1f/d0/ in .dts.
> 
> Marvell have made a real mess here. Since there seems to be two
> different base addresses in use, i suggest you put a fat comment on
> the top of the .dts file about this issue. Give users a clue what to
> try if the kernel does not do anything at all.
> 
>  
>> - Andrew,Ben: SPI flash partitions are correct, I can read all those,
>>   'file' recognize them and the content looks kosher. Nonetheless, I did
>>   a diff before and after a 'saveenv' under u-boot and u-boot
>>   environment is saved by u-boot itself in the middle of the kernel
>>   (0x40000 after the start of mtd1). This make kernel CRC incorrect and
>>   prevent u-boot to boot the kernel. If you have any idea on this, I am
>>   interested.
> 
> This sounds like the default install of u-boot does not make use of
> any environment variables which are not the default value. Hence the
> uboot environment store being in the middle of the kernel is not an
> issue. Maybe you can ask for the u-boot sources, or see if they are on
> the synology download site, and check this? Again, a fat warning in
> the .dts file may be a good idea. 

On the Kirkwood-based Synology DiskStations, saving the environment is
not possible, and the "RedBoot Config" partition is not used.

It sounds as if Synology configured the Marvell u-boot bootloader on the
Marvell Armada series for a 1MiB bootloader partition size (instead of 
768KiB), with the config partition following immediately after it, and
never tested (or forgot to disable) saving environment variables.

> What does seem odd is the Reboot, FIS, etc, mtd partition names. 
> Is there redboot installed at all?

I think the RedBoot partition names are carried over from the older
PPC-based Synology DiskStations.  As far as I can tell, the FIS 
directory partition is never referenced by the Synology kernel or
bootloader, though the information in it does match what is used by
the kernel, and it appears it may be used by the Synology updater.
