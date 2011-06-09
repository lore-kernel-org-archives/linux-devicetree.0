From: Jamie Iles <jamie@jamieiles.com>
Subject: ARM/DT: registering clks from DT in .init_early
Date: Thu, 9 Jun 2011 17:45:57 +0100
Message-ID: <20110609164557.GK3711@pulham.picochip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

I'm currently working on moving our platform to device tree with the aim 
of mainlining it.  Before device tree we registered the clks in the 
.init_early machine callback which is fine as the clks are static data.  
I'm now trying to dynamically register these clks from the device tree 
but the slab allocator isn't available at this stage so I can't allocate 
them dynamically.

Am I heading in the wrong direction here?  We currently get the 
clocksource and clock event frequency from a clk so I don't think this 
can be made later (though I guess this could come from device tree 
instead).

Jamie
