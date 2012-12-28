From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] cpuidle: kirkwood: Move out of mach directory, add DT.
Date: Fri, 28 Dec 2012 23:20:35 +0530
Message-ID: <50DDDBEB.3000002@ti.com>
References: <1356698844-4220-1-git-send-email-andrew@lunn.ch>
 <50DDAA42.2020101@gmail.com> <20121228143517.GA5172@lunn.ch>
 <50DDB2E3.103@gmail.com> <20121228154927.GC5172@lunn.ch>
 <50DDC54A.3020509@gmail.com> <50DDCF47.1030305@ti.com>
 <20121228172807.GA7578@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121228172807.GA7578-g2DYL2Zd6BY@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: len.brown-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 28 December 2012 10:58 PM, Andrew Lunn wrote:
>> Putting DDR/SDRAM into self refresh means, you no longer have RAM
>> available to execute and any code CPU needs to execute after that has
>> to be executed either from lock down cache with no cache evictions or
>> from some internal on chip memory with caches disabled to avoid accesses
>> to DDR. Not sure how below code works if the first writel puts DDR into
>> self refresh. Is cpu_do_idle() code copied to some internal memory ?
>>
>> +	writel(0x7, ddr_operation_base);
>> +	cpu_do_idle();
>>
>> May be I am missing something but i have worked on such a code for OMAP3
>> kind of devices and seen major issues with DDR self refresh and CPU
>> entering into idle state.
>
> Quoting the datasheet:
>
>    To place the SDRAM into self refresh set the <Cmd> field in the
>    SDRAM Operation Register (Table 174 p. 400) to 0x7. The SDRAM
>    controller waits for 256 cycles and then generates a self refresh
>    command to SDRAM, and clears the SDRAM Operation register.
>
Thanks for additional info.

> I assume we always manage to execute the WFI within these 256 cycles.
>
> There is also some text about handling new pending transactions, so
> even if it does not WFI, e.g. because of an interrupts, it seems to do
> the right thing.
>
Is this single CPU or multi-cpu machine ? Even though the cpu_do_idle()
has just couple of instructions, there can be lot more happening in
background especially with multi masters system. It might be safe if the
single CPU is the only master accessing DDR. In multi-master, multi-CPU
scenario though it can't work reliably.

Regards
Santosh
