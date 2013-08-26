From: boris brezillon <b.brezillon@overkiz.com>
Subject: Re: [RFC PATCH 1/3] pinctrl: add new generic pinconf config for deglitch
 filter
Date: Mon, 26 Aug 2013 19:01:05 +0200
Message-ID: <521B89D1.6010902@overkiz.com>
References: <1377379926-11163-1-git-send-email-b.brezillon@overkiz.com> <1377380109-11247-1-git-send-email-b.brezillon@overkiz.com> <521B875E.1010605@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <521B875E.1010605@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jiri Kosina <jkosina@suse.cz>, Masanari Iida <standby24x7@gmail.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Richard Genoud <richard.genoud@gmail.com>, Heiko Stuebner <heiko@sntech.de>, James Hogan <james.hogan@imgtec.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello Stephen,

On 26/08/2013 18:50, Stephen Warren wrote:
> On 08/24/2013 03:35 PM, Boris BREZILLON wrote:
>> Add a new parameter to support deglitch filter configuration.
>> A deglitch filter works like a debounce filter but with a smaller
>> delay (nanoseconds).
> Why not use the existing debounce property, just with a small delay
> specified. It seems like that's exactly what the property is for?
That's one of the question I asked in my cover letter :-)

Indeed the at91 deglitch filter delay is not configurable and is statically
assigned to half a master clk cycle (if master clk = 133MHz -> 8 ns).
The debounce property argument is currently expressed in usecs.

This will result in always selecting the debounce filter (which is also
available on at91 SoCs) over the deglitch filter.

Could we add a flag in the deglitch argument to specify the delay unit
(nsecs or usecs) ?


Best Regards,

Boris
