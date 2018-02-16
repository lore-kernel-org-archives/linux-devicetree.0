From: "'Kishon Vijay Abraham I' via linux-sunxi" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: [RESEND] phy: sun4i-usb: add support for R40 USB PHY
Date: Fri, 16 Feb 2018 16:43:19 +0530
Message-ID: <e5bcd7dd-1545-189f-82b1-efb77422b936@ti.com>
References: <20180103084944.3145-1-icenowy@aosc.io>
 <20180115150656.bibc4draok4i4oae@lemon.iwr.uni-heidelberg.de>
 <CAGb2v64DuqTv49CfOMhovdikc9iUGCfLRSmJ+FEeF5ct+-YzEw@mail.gmail.com>
 <993f82ad-befe-05fb-351d-8fd31d8bc132@ti.com>
Reply-To: kishon-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCOOP4VF5IDRBYPZTLKAKGQETKNVGTY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <993f82ad-befe-05fb-351d-8fd31d8bc132-l0cyMroinI0@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Hermann Lauer <Hermann.Lauer-hEciA7+sKtudPOQpRHQ53DeJuz7u0hKX@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On Friday 19 January 2018 01:43 PM, Kishon Vijay Abraham I wrote:
> Hi,
> 
> On Friday 19 January 2018 11:55 AM, Chen-Yu Tsai wrote:
>> Hi Kishon,
>>
>> On Mon, Jan 15, 2018 at 11:06 PM, Hermann Lauer
>> <Hermann.Lauer-hEciA7+sKtudPOQpRHQ53DeJuz7u0hKX@public.gmane.org> wrote:
>>> On Wed, Jan 03, 2018 at 04:49:44PM +0800, Icenowy Zheng wrote:
>>>> Allwinner R40 features a USB PHY like the one in A64, but with 3 PHYs.
>>>>
>>>> Add support for it.
>>>>
>>>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>>>> Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>>
>>> You may add
>>>
>>> Tested-by: Hermann.Lauer-hEciA7+sKtudPOQpRHQ53DeJuz7u0hKX@public.gmane.org
>>
>> Gentle ping for this patch to be included in 4.16
> 
> Sent the pull request for 4.16 to Greg on Jan 2nd. So this can't be included in
> 4.16. Sorry.

merged now, thanks!

-Kishon
