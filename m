From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2 1/2] video: ARM CLCD: Add DT support
Date: Thu, 12 Sep 2013 08:55:54 -0600
Message-ID: <5231D5FA.4060508@wwwdotorg.org>
References: <1378808726-32535-1-git-send-email-pawel.moll@arm.com>
 <522F57B9.5000001@wwwdotorg.org> <1378899931.4082.75.camel@hornet>
 <5230AAEB.2030607@wwwdotorg.org> <1378991033.13571.33.camel@hornet>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1378991033.13571.33.camel@hornet>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <Mark.Rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Arnd Bergmann <arnd.bergmann@linaro.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 09/12/2013 07:03 AM, Pawel Moll wrote:
> On Wed, 2013-09-11 at 18:39 +0100, Stephen Warren wrote:
...
>> Perhaps the CLCD could reference the memreserve then?
> 
> How do you mean reference the memreserve? It's not a node, I don't think you can get
> a phandle to it...

Perhaps it's an extension that hasn't actually been implemented yet. I
thought I saw some reference to it in some long-past discussions. It's
possible that this feature has been dropped in preference to the "CMA"
bindings for defining reserved memory regions?

...
> Ok, so I'll make it a arm,pl11x,specific property. Actually two
> properties - one bit I missed was the dual STN panel case, where they
> have separate frame buffers. Something along the lines of:
> 
> Optional:
> 
> - arm,pl11x,framebuffer-base: a pair of two values, address and size,
> 				defining the framebuffer for the upper
> 				(or the only one) panel
> - arm,pl11x,lower-framebuffer-base: as above, for the lower STN panel,
> 					when present
> 
> Being very hardware-specific, it covers all possible quirky scenarios,
> at the same time does not exclude the option of using the CMA region
> phandles, if a particular system needed it.

What do "upper" and "lower" mean in this context? I assume this somehow
refers to placement of the displays on the board. If so, it sounds like
there should be some better terminology; something that's specific to
the CLCD controller itself, rather than the environment it's used in.
Aalthough it does sound like this is in an FPGA and hence the controller
is board-specific, but I don't see why it couldn't be re-used in some
other FPGA-based board with different panel layout. Would "A" and "B" or
"main" and "primary" or "first" and "second" work better?
