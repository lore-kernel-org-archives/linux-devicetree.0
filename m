From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 4/4] drivers: soc: sunxi: add support for
 A64 and its SRAM C
Date: Fri, 18 Aug 2017 14:19:38 +0800
Message-ID: <CAGb2v65U1Bdo_reLhh2977CkATkTwuL_6-tDK6UrV=N5OyQKcg@mail.gmail.com>
References: <20170809085627.32687-1-icenowy@aosc.io> <20170809085627.32687-5-icenowy@aosc.io>
 <CAGb2v66RnXDbL7OJfOAgeXPJSFZwzgfGbnB108vX-+OO_0xiWQ@mail.gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBE4O3LGAKGQEPGUKBGY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v66RnXDbL7OJfOAgeXPJSFZwzgfGbnB108vX-+OO_0xiWQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 14, 2017 at 5:48 PM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> On Wed, Aug 9, 2017 at 4:56 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>> Allwinner A64's display engine claims the SRAM C section to work.
>>
>> Add support for the A64 SRAM controller and the SRAM C section of it.
>>
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>
> Looks good to me. Will apply all 4 once the dt bindings are acked.

Applied patch 1, 3, and 4 for 4.14, and patch 2 as a fix for 4.13.

Thanks
ChenYu
