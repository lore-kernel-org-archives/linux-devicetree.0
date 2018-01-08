From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun[47]i: Fix display backend 1 output to TCON0
 remote endpoint
Date: Mon, 8 Jan 2018 16:26:16 +0800
Message-ID: <CAGb2v66HQ1+u--dLzVn8tjG+fYvdeYPuUkV4p-Zc1ctOsrSXrQ@mail.gmail.com>
References: <20180103163155.13975-1-wens@csie.org> <20180104132752.pcixtjugwfvlshpl@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180104132752.pcixtjugwfvlshpl-ZC1Zs529Oq4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 4, 2018 at 9:27 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Thu, Jan 04, 2018 at 12:31:55AM +0800, Chen-Yu Tsai wrote:
>> There is a copy-paste error in the display pipeline device tree graph.
>> The remote endpoint of the display backend 1's output to TCON0 points
>> to the wrong endpoint. This will result in the driver incorrectly
>> parsing the relationship of the components.
>>
>> Reported-by: Andrea Venturi <ennesimamail.av-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Fixes: 0df4cf33a594 ("ARM: dts: sun4i: Add device nodes for display
>>                     pipelines")
>> Fixes: 5b92b29bed45 ("ARM: dts: sun7i: Add device nodes for display
>>                     pipelines")
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>
> Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Applied (a few days ago).

This will be sent out in a pull request later.

ChenYu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
