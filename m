From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [RFC PATCH 1/3] pinctrl: add new generic pinconf config for deglitch
 filter
Date: Mon, 26 Aug 2013 10:50:38 -0600
Message-ID: <521B875E.1010605@wwwdotorg.org>
References: <1377379926-11163-1-git-send-email-b.brezillon@overkiz.com> <1377380109-11247-1-git-send-email-b.brezillon@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1377380109-11247-1-git-send-email-b.brezillon@overkiz.com>
Sender: linux-doc-owner@vger.kernel.org
To: Boris BREZILLON <b.brezillon@overkiz.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jiri Kosina <jkosina@suse.cz>, Masanari Iida <standby24x7@gmail.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Richard Genoud <richard.genoud@gmail.com>, Heiko Stuebner <heiko@sntech.de>, James Hogan <james.hogan@imgtec.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 08/24/2013 03:35 PM, Boris BREZILLON wrote:
> Add a new parameter to support deglitch filter configuration.
> A deglitch filter works like a debounce filter but with a smaller
> delay (nanoseconds).

Why not use the existing debounce property, just with a small delay
specified. It seems like that's exactly what the property is for?
