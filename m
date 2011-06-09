From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: ARM/DT: registering clks from DT in .init_early
Date: Thu, 9 Jun 2011 20:28:49 +0100
Message-ID: <20110609192849.GL3711@pulham.picochip.com>
References: <20110609164557.GK3711@pulham.picochip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110609164557.GK3711-apL1N+EY0C9YtYNIL7UdTEEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 09, 2011 at 05:45:57PM +0100, Jamie Iles wrote:
> I'm currently working on moving our platform to device tree with the aim 
> of mainlining it.  Before device tree we registered the clks in the 
> .init_early machine callback which is fine as the clks are static data.  
> I'm now trying to dynamically register these clks from the device tree 
> but the slab allocator isn't available at this stage so I can't allocate 
> them dynamically.
> 
> Am I heading in the wrong direction here?  We currently get the 
> clocksource and clock event frequency from a clk so I don't think this 
> can be made later (though I guess this could come from device tree 
> instead).

OK, I found http://permalink.gmane.org/gmane.linux.ports.arm.kernel/105261
which describes the issue.  I've changed to alloc_bootmem() which Grant 
suggested in that thread and that does resolve the crash, however 
of_clk_add_provider() uses kzalloc() and I can't help but feel that it's 
going to get a bit too messy doing it this way.

Jamie
