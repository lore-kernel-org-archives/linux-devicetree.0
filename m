From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH 2/4] pinctrl: at91: fix sam9x5 debounce/deglitch functions
Date: Fri, 27 Sep 2013 14:12:19 +0200
Message-ID: <CACRpkdbbpe8RbZ3AZX9YjsqT_GOo3aaD3YAcJT7toNx6E6VPgA@mail.gmail.com>
References: <1379058213-3245-1-git-send-email-b.brezillon@overkiz.com>
	<1379058442-3321-1-git-send-email-b.brezillon@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1379058442-3321-1-git-send-email-b.brezillon@overkiz.com>
Sender: linux-doc-owner@vger.kernel.org
To: Boris BREZILLON <b.brezillon@overkiz.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Rob Landley <rob@landley.net>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Grant Likely <grant.likely@linaro.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, Richard Genoud <richard.genoud@gmail.com>, Jiri Kosina <jkosina@suse.cz>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 13, 2013 at 9:47 AM, Boris BREZILLON
<b.brezillon@overkiz.com> wrote:

> Replace at91_mux_get_deglitch with at91_mux_pio3_get_deglitch when using
> sam9x5 (pio3) IP.
> at91_mux_get_deglitch only test the activation of the "Input Filter" which
> may be overloaded by the activation of the "Input Filter Slow Clock" to use
> the input filter as a debounce filter instead of a deglitch filter.
>
> Fix at91_mux_pio3_get_debounce to test the activation of the Input Filter
> before testing the activation of the debounce filter (Input Filter Slow
> Clock depends on Input Filter).
>
> Fix at91_mux_pio3_set_debounce function to avoid disabling the deglitch
> filter ("Input Filter") when debounce filter is disabled.
>
> Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>

Patch applied with Jean-Christophe's ACK.

Yours,
Linus Walleij
