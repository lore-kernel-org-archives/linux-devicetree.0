From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] cpuidle: kirkwood: Move out of mach directory, add DT.
Date: Fri, 28 Dec 2012 23:32:41 +0530
Message-ID: <50DDDEC1.9050307@ti.com>
References: <1356698844-4220-1-git-send-email-andrew@lunn.ch>
 <50DDAA42.2020101@gmail.com> <20121228143517.GA5172@lunn.ch>
 <50DDB2E3.103@gmail.com> <20121228154927.GC5172@lunn.ch>
 <50DDC54A.3020509@gmail.com> <50DDCF47.1030305@ti.com>
 <20121228172807.GA7578@lunn.ch> <50DDDBEB.3000002@ti.com>
 <20121228175618.GC7578@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121228175618.GC7578-g2DYL2Zd6BY@public.gmane.org>
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

On Friday 28 December 2012 11:26 PM, Andrew Lunn wrote:
>> Is this single CPU or multi-cpu machine ?
>
> Its a uniprocessor.
>
That should work then.

>> Even though the cpu_do_idle()
>> has just couple of instructions, there can be lot more happening in
>> background especially with multi masters system. It might be safe if the
>> single CPU is the only master accessing DDR. In multi-master, multi-CPU
>> scenario though it can't work reliably.
>
> There are DMA engines which could be active, moving stuff into/out of
> memory.
>
Sure but you must be stopping DMA before entering idle where DDR can 
enter into self-refresh otherwise DMA transfer will be aborted. DDR
controller also can take care of such a scenario by not entering into
self refresh when DMA is active and self refresh command is issued.

> Having said that, this code is not new, it is just getting a new home.
> There has not been problems before. Having this 256 cycle delay etc,
> suggests the hardware design is robust.
>
Thanks for information that it is robust and working well. I was just
curious having faced some issues on this topic in past.

Regards
Santosh
