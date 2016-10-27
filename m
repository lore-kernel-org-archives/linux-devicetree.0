From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 2/9] dt-bindings: interrupt-controller: add DT binding
 for meson GPIO interrupt controller
Date: Thu, 27 Oct 2016 10:32:05 +0100
Message-ID: <20161027093205.GA27135@leverpostej>
References: <1476890480-8884-1-git-send-email-jbrunet@baylibre.com>
 <1476890480-8884-3-git-send-email-jbrunet@baylibre.com>
 <20161026214234.4q6wmecehqh6q32o@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20161026214234.4q6wmecehqh6q32o@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Kevin Hilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-gpio@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 26, 2016 at 04:42:35PM -0500, Rob Herring wrote:
> On Wed, Oct 19, 2016 at 05:21:13PM +0200, Jerome Brunet wrote:
> > 
> > This commit adds the device tree bindings description for Amlogic's GPIO
> > interrupt controller available on the meson8, meson8b and gxbb SoC families
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> > Rob, I did not include the Ack you gave for the RFC as bindings have slightly
> > changed. Only the interrupt property has be removed following a discussion I
> > had with Marc
> 
> As Mark R already said, you should keep the interrupts property.

To be clear, the interrupt routing should be described *somehow*, though
I don't think the generic interrupts property is correct, as this is an
interrupt *router*, i.e. this device doesn't own the interrupt, it just
joins two parts of the line together (and so flags are meaningless).

Thanks,
Mark.
