From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [RFC PATCH 2/3] pinctrl: at91: add support for generic pinconf
Date: Mon, 26 Aug 2013 10:53:54 -0600
Message-ID: <521B8822.50304@wwwdotorg.org>
References: <1377379926-11163-1-git-send-email-b.brezillon@overkiz.com> <1377380259-11290-1-git-send-email-b.brezillon@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1377380259-11290-1-git-send-email-b.brezillon@overkiz.com>
Sender: linux-doc-owner@vger.kernel.org
To: Boris BREZILLON <b.brezillon@overkiz.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jiri Kosina <jkosina@suse.cz>, Masanari Iida <standby24x7@gmail.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Richard Genoud <richard.genoud@gmail.com>, Heiko Stuebner <heiko@sntech.de>, James Hogan <james.hogan@imgtec.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 08/24/2013 03:37 PM, Boris BREZILLON wrote:
> Add support for generic pin configuration to pinctrl-at91 driver.

> diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt

>  Required properties for iomux controller:
> -- compatible: "atmel,at91rm9200-pinctrl"
> +- compatible: "atmel,at91rm9200-pinctrl" or "atmel,at91sam9x5-pinctrl".

You seem to also be adding a second chip name to the list here, which is
more than the patch subject/description imply you're doing...

> +  Add "generic-pinconf" to the compatible string list to use the generic pin
> +  configuration syntax.

"generic-pinconf" is too generic of a compatible value for this binding
to define.

Instead, I think you want to either:

a)

Use compatible="atmel,at91rm9200-pinctrl" for the old binding,
use compatible="atmel,at91rm9200-pinctrl-generic" for the new binding

or:

b)

Define Boolean property atmel,generic-pinconf (perhaps a better name
could be chosen?). If it's not present, parse the node assuming the old
binding. If it is present, parse the node assuming the new binding.

