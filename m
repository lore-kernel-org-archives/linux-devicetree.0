From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v3 08/10] clk: qcom: Add ACD path to CPU clock driver for
 msm8996
Date: Thu, 22 Mar 2018 18:56:42 +0000
Message-ID: <d9e9e276-ba8c-7d8c-b110-da0a0b778e6d@arm.com>
References: <1518616792-29028-1-git-send-email-ilialin@codeaurora.org>
 <1518616792-29028-9-git-send-email-ilialin@codeaurora.org>
 <152147863176.242365.17292287330283256524@swboyd.mtv.corp.google.com>
 <41f3b246-43f4-450d-5c6b-34cdad7b15dd@arm.com>
 <152149448251.242365.16980775001987673274@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <152149448251.242365.16980775001987673274@swboyd.mtv.corp.google.com>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@kernel.org>, Ilia Lin <ilialin@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, rnayak@codeaurora.org, robh@kernel.org, will.deacon@arm.com, amit.kucheria@linaro.org, tfinkel@codeaurora.org, nicolas.dechesne@linaro.org, celster@codeaurora.org
List-Id: devicetree@vger.kernel.org

On 19/03/18 21:21, Stephen Boyd wrote:
> Quoting Robin Murphy (2018-03-19 11:16:15)
>> On 19/03/18 16:57, Stephen Boyd wrote:
>> [...]
>>>> +
>>>
>>>> +                       writel_relaxed(SSSCTL_VAL, vbases[APC_BASE] +
>>>> +                                       PWRCL_REG_OFFSET + SSSCTL_OFFSET);
>>>> +               /* Ensure SSSCTL config goes through before enabling ACD. */
>>>> +               mb();
>>>
>>> Use writel instead.
>>
>> Note that writel() only gives an implicit wmb() *before* the store to
>> ensure ordering against any previous writes. If this code really needs
>> to ensure that the given write has definitely completed before any other
>> accesses happen, then it still needs an explicit barrier *after* the
>> write*(), unless perhaps the next access is always guaranteed to be a
>> non-relaxed write (thus implicitly providing a suitable DSB).
>>
> 
> Ah right. So this should be a wmb() too? I suspect it's to order with
> the write to the l2 indirect registers, but reading that register before
> the MMIO write is not a problem. The comment above the l2 accessors
> could be slightly more specific here and it would help immensely.

It depends a bit on what exactly the hardware requires. If it's merely 
that write(s) to register A (and perhaps others) arrive before any write 
to register B, then the sensible thing to do would be to just make the 
write to B non-relaxed, i.e.:

	writel_relaxed(x, base + A);
	...
	writel(y, base + B);

That still only guarantees that the previous write(s) have been pushed 
all the way to the endpoint before the write to B is issued, though - 
for many devices that's sufficient, but in some cases the only way to be 
totally sure that the write has both been received *and* taken effect is 
by reading back some suitable indicator before proceeding.

If we only care about making sure writes are pushed out, rather than 
synchronising more complicated memory accesses between multiple agents, 
then a full mb() is probably overkill (as ordering against outstanding 
loads too only adds more overhead in the interconnect), and wmb() 
(ideally implicit in a subsequent writel() as above) should be enough.

Robin.
