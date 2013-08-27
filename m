From: boris brezillon <b.brezillon@overkiz.com>
Subject: Re: [RFC PATCH 1/3] pinctrl: add new generic pinconf config for
 deglitch filter
Date: Tue, 27 Aug 2013 08:16:49 +0200
Message-ID: <521C4451.1060908@overkiz.com>
References: <1377379926-11163-1-git-send-email-b.brezillon@overkiz.com>
 <1377380109-11247-1-git-send-email-b.brezillon@overkiz.com>
 <521B875E.1010605@wwwdotorg.org> <521B89D1.6010902@overkiz.com>
 <521C2347.4080702@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <521C2347.4080702@wwwdotorg.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Russell King <linux@arm.linux.org.uk>, Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>, linux-doc@vger.kernel.org, Richard Genoud <richard.genoud@gmail.com>, Jiri Kosina <jkosina@suse.cz>, Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Masanari Iida <standby24x7@gmail.com>, Rob Landley <rob@landley.net>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

On 27/08/2013 05:55, Stephen Warren wrote:
> On 08/26/2013 11:01 AM, boris brezillon wrote:
>> Hello Stephen,
>>
>> On 26/08/2013 18:50, Stephen Warren wrote:
>>> On 08/24/2013 03:35 PM, Boris BREZILLON wrote:
>>>> Add a new parameter to support deglitch filter configuration.
>>>> A deglitch filter works like a debounce filter but with a smaller
>>>> delay (nanoseconds).
>>> Why not use the existing debounce property, just with a small delay
>>> specified. It seems like that's exactly what the property is for?
>> That's one of the question I asked in my cover letter :-)
>>
>> Indeed the at91 deglitch filter delay is not configurable and is statically
>> assigned to half a master clk cycle (if master clk = 133MHz -> 8 ns).
>> The debounce property argument is currently expressed in usecs.
>>
>> This will result in always selecting the debounce filter (which is also
>> available on at91 SoCs) over the deglitch filter.
>>
>> Could we add a flag in the deglitch argument to specify the delay unit
>> (nsecs or usecs) ?
> If the value is hard-coded in HW, why not use non-zero (or 1) to enable
> and zero to disable?

Indeed at91 pins support both deglitch and debounce filter and I have to 
choose
between the two given the argument value (in usec).

Here's what I can do:

if (arg >= 1/2 * slowclock)    /* debounce case */
     /* choose debounce filter and configure the delay
         according to the given argument value */
else                                          /* deglitch case */
     /* choose deglitch filter */


Slow clock is running at 32KHz which gives a 30 usec clock cycle.

>
> (this kind of thing is why I'm not convinced that generic pinconf works
> so well... What if we need psecs in the future?)

Should I keep the at91 native pinconf binding and add the missing flags 
to this binding
(OUTPUT configuration flags) ?

This was another question I asked in my cover letter: wether or not the 
generic pinconf
binding should be used.
