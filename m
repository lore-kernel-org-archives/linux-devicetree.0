From: Mitch Bradley <wmb@firmworks.com>
Subject: Re: An extremely simplified pinctrl bindings proposal
Date: Mon, 06 Feb 2012 09:05:24 -1000
Message-ID: <4F302474.1020701@firmworks.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF178E5D3160@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF178E5D3160@HQMAIL01.nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@nvidia.com>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "cjb@laptop.org" <cjb@laptop.org>, Dong Aisheng <dongas86@gmail.com>, "ext Tony Lindgren (tony@atomide.com)" <tony@atomide.com>, "Linus Walleij (linus.walleij@linaro.org)" <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "Grant Likely (grant.likely@secretlab.ca)" <grant.likely@secretlab.ca>, Thomas Abraham <thomas.abraham@linaro.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "Simon Glass (sjg@chromium.org)" <sjg@chromium.org>, Shawn Guo <shawn.guo@linaro.org>, Dong Aisheng-B29396 <B29396@freescale.com>, "Sascha Hauer (s.hauer@pengutronix.de)" <s.hauer@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

I like the general approach of simplifying the pinctrl thing, as the 
previous approach did not appear to be converging.

One possible name would be "gpconfig" - for general purpose configuration.

The register access model in the strawman proposal is probably too 
simple.  32-bit memory mapped registers are certainly the most common 
subcase on ARM, but there are many other cases that occur in practice:

* Registers that must be accessed with 8, 16, or 64-bit cycles.
* Registers that have side effects on read, so read-mask-write must be 
avoided
* Registers accessed via an index/data cycle pair, thus having locking 
requirements
* Registers that must be read after being written, or otherwise 
requiring some sort of memory-ordering enforcement.
* Time delays between pairs of writes
* PCI configuration registers, which often have some combination of the 
above
* Registers behind serial buses like I2C

Both Open Firmware and ACPI have addressed this general problem.  In 
addition to a numeric identifier for the register, you need to specify 
the access semantics.  It's difficult to finitely enumerate all possible 
cases, but you can get to 99.9% with a modest number of access models, 
and then add new models as needed.
