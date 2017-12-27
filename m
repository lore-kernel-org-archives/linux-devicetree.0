From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 00/11] Allwinner H3/H5/A64(DE2) SimpleFB support
Date: Wed, 27 Dec 2017 12:23:53 +0800
Message-ID: <CAGb2v658L_941_jaD0eu6fjmo1HGdjS3bU1UVw3y8RO3ZDmwyg@mail.gmail.com>
References: <20171222122243.25735-1-icenowy@aosc.io> <CAGb2v653n_Q-spOSP9RTXBrL7CtrYiV7dAyRAVYCxg3KpzRvoQ@mail.gmail.com>
 <4610834.pRdGNWpFpX@ice-x220i>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4610834.pRdGNWpFpX@ice-x220i>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 27, 2017 at 12:10 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> 在 2017年12月27日星期三 CST 下午12:09:41，Chen-Yu Tsai 写道：
>> On Fri, Dec 22, 2017 at 8:22 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>> > This patchset adds support for the SimpleFB on Allwinner SoCs with
>> > "Display Engine 2.0".
>> >
>> > PATCH 1 to PATCH 3 are DE2 CCU fixes for H3/H5 SoCs.
>> >
>> > PATCH 4 adds the pipeline strings for DE2 SimpleFB.
>> >
>> > PATCH 5 to 7 adds necessary device tree nodes (DE2 CCU and SimpleFB)
>> > for H3/H5 SoCs.
>> >
>> > PATCH 8 to 11 are for Allwinner A64 SoC to enable SimpleFB.
>>
>> Changelog?
>
> They're in seperate patches.

Please add them to all patches in such a case. List "none" if there
were no changes.

ChenYu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
