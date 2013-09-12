From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v2 1/2] video: ARM CLCD: Add DT support
Date: Thu, 12 Sep 2013 16:41:20 +0100
Message-ID: <20130912154120.GN12758@n2100.arm.linux.org.uk>
References: <1378808726-32535-1-git-send-email-pawel.moll@arm.com>
 <522F57B9.5000001@wwwdotorg.org> <1378899931.4082.75.camel@hornet>
 <5230AAEB.2030607@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <5230AAEB.2030607@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Mark Rutland <Mark.Rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Arnd Bergmann <arnd.bergmann@linaro.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 11, 2013 at 11:39:55AM -0600, Stephen Warren wrote:
> I don't know how constrained of a system CLCD is, but I do know that
> mode validation is a very complex process in some real-life graphics
> drivers.

Apart from maximum memory bus bandwidth, probably maximum output
bandwidth, maximum resolution (determined by what will fit in the
registers and RAM) there aren't that much constraints.  The hardware
block is quite simple in that regard.

More the problem is to deal with two situations:
1. you have a particular panel connected to it which requires a certain
   fixed timing regime.
2. you have the CLCD connected to a VGA or HDMI connector where the
   timing is dependent on the connected display.

The former would be the subject of some kind of *common* DT
representation of the timing requirements of the connected panel.
For the latter, DT needs to specify how the EDID data is retrieved,
or if there is no mechanism for that, being able to provide a set
of allowable timing parameters (such as min/max vsync, min/max
hsync, max dotclock - in other words, the data which used to be
provided to X11 in the past.)

None of that is specific to CLCD though: it's the same problem as
the SA11x0 LCD controller or any other scanned video controller.
