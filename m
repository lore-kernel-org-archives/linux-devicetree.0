From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 1/6] ARM: bcm476x: Add infrastructure
Date: Fri, 12 Oct 2012 13:01:39 +0200
Message-ID: <20121012130139.6c3079c5@skate>
References: <20121007015300.828366635@gmail.com>
 <201210120803.54539.arnd@arndb.de> <20121012101252.6c3b7dce@skate>
 <201210121048.24998.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201210121048.24998.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: devicetree-discuss@lists.ozlabs.org, Domenico Andreoli <cavokz@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Dear Arnd Bergmann,

On Fri, 12 Oct 2012 10:48:24 +0000, Arnd Bergmann wrote:

> The main thing to watch out for are mappings that are not for MMIO,
> such as the call to create_mapping() in map_lowmem() or in
> devicemaps_init().
> 
> I would suggest making struct map_desc specific to callers of
> iotable_init() and changing the prototype for create_mapping() to
> 
> void __init create_mapping(unsigned long virtual, unsigned long pfn,
> 			   size_t length, unsigned int type);

Yes, this is exactly what I've done. I'll rebase my work, test and send
it.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
