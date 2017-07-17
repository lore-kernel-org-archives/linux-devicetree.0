From: Santosh Shilimkar <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: clock: ti-sci: Fix incorrect usage of
 headers
Date: Mon, 17 Jul 2017 10:14:49 -0700
Message-ID: <eeda0027-259b-4494-42d6-4f380d230134@oracle.com>
References: <20170711223615.29398-1-s-anna@ti.com>
 <20170712010923.GP22780@codeaurora.org>
 <20170717170457.4pkb6qaa3qbept5n@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170717170457.4pkb6qaa3qbept5n@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Dave Gerlach <d-gerlach-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 7/17/2017 10:04 AM, Rob Herring wrote:
> On Tue, Jul 11, 2017 at 06:09:23PM -0700, Stephen Boyd wrote:
>> On 07/11, Suman Anna wrote:
>>> The clock consumer usage description was erroneously referring to
>>> couple of dt-binding headers that are no longer valid. The definition
>>> and/or usage of these headers is incorrect and the only file present
>>> at the moment, dt-bindings/soc/k2g.h is also being cleaned up. The
>>> examples in this binding were updated properly, but the update to
>>> description was missed out. So, fix this.
>>>
>>> Fixes: 8f306cfe4383 ("Documentation: dt: Add TI SCI clock driver")
>>> Signed-off-by: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
>>> ---
>>> Hi Stephen,
>>>
>>> Looks like this was missed during the update/repost of the ti-sci-clk
>>> driver/binding. FYI, Santosh is going to pickup the header file cleanup
>>> patch https://patchwork.kernel.org/patch/9741279/ for the next merge
>>> window.
>>
>> I'll let Rob apply this as it is purely a binding document update.
> 
> Applied.
> 
Thanks Rob !!
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
