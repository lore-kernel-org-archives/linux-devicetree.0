From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2 1/2] video: ARM CLCD: Add DT support
Date: Tue, 10 Sep 2013 11:32:41 -0600
Message-ID: <522F57B9.5000001@wwwdotorg.org>
References: <1378808726-32535-1-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1378808726-32535-1-git-send-email-pawel.moll@arm.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Arnd Bergmann <arnd.bergmann@linaro.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 09/10/2013 04:25 AM, Pawel Moll wrote:
> This patch adds basic DT bindings for the PL11x CLCD cells
> and make their fbdev driver use them.

> diff --git a/Documentation/devicetree/bindings/video/arm,pl11x.txt b/Documentation/devicetree/bindings/video/arm,pl11x.txt

> +Optional properties:
> +
> +- video-ram: phandle to a node describing specialized video memory
> +		(that is *not* described in the top level "memory" node)
> +		that must be used as a framebuffer, eg. due to restrictions
> +		of the system interconnect; the node must contain a
> +		standard reg property describing the address and the size
> +		of the memory area

Should this use the "CMA bindings" that are being proposed at the moment?

Even if not, I'm not quite clear on what the referenced node is supposed
to contain; is just a reg property enough, so you'd see the following at
a completely arbitrary location in the DT:

framebuffer-mem {
    reg = <0x80000000 0x00100000>;
};

I'm not sure what the benefit of making this a standalone node is; why
not just put the base/size directly into the video-ram property in the
CLCD node?

> +- max-framebuffer-size: maximum size in bytes of the framebuffer the
> +			system can handle, eg. in terms of available
> +			memory bandwidth

Size doesn't imply bandwidth, due to the potential for varying bpp,
frame-rates, margin/porch sizes, etc. If this is a bandwidth limit,
shouldn't we instead represent that value directly, perhaps along with
some multiplier to convert theoretical bandwidth to practical bandwidth
(to account for memory protocol and controller overheads)?

...
> +- panel-type: (required) must be "tft" or "stn", defines panel type
...
> +- panel-stn-4bit: (for monochrome "stn" panel) if present means
> +			that the monochrome display is connected
> +			via 4 bit-wide interface

I just wanted to confirm that those are a complete/direct representation
of all the HW options the module supports?

> +- display-timings: standard display timings sub-node, see
> +			Documentation/devicetree/bindings/video/display-timing.txt

Should that be in a "Required sub-nodes" section (I assume required not
optional) rather than "Optional Properties"?
