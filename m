From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [PATCH 5/6] ARM: dts: sunxi: Add Allwinner H3 DTSI
Date: Tue, 27 Oct 2015 09:12:17 +0100
Message-ID: <562F31E1.9070203@redhat.com>
References: <1445444428-4652-1-git-send-email-jenskuske@gmail.com>
 <1445444428-4652-2-git-send-email-jenskuske@gmail.com>
 <20151023181406.GK10947@lukather> <20151023212013.50bcbe4a@OPI2>
 <20151024071328.GQ10947@lukather> <20151024104749.179dab64@OPI2>
 <20151026210623.GB10947@lukather>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORB27DXSYQKGQEUVGJLCI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20151026210623.GB10947@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 26-10-15 22:06, Maxime Ripard wrote:
> On Sat, Oct 24, 2015 at 10:47:49AM +0200, Jean-Francois Moine wrote:
>> On Sat, 24 Oct 2015 09:13:28 +0200
>> Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>>
>>> Or simply
>>>
>>> bus_gates {
>>> 	clocks = <&ahb1>, <&ahb2>;
>>> 	clock-indices = <5>, <6>, <8>, ...
>>> 	clock-output-names = "bus_ce", "bus_dma", "bus_mmc0"
>>> };
>>
>> I don't understand: the apb1, apb2, ahb1 and ahb2 clocks may be
>> programmed independently to different frequencies
>
> I don't understand why you're talking about frequencies here.
>
>> and you have to know which of them is the parent of each leaf clock.
>
> Indeed, but that's also doable here. Just not in the DT.
>
>> So, either you hard-code the parents as Jens did in a first proposal,
>> or you define the full list of parents in the DT as in the last
>> proposal, or you use a container per parent in the DT as I proposed.
>>
>> There could be an other solution using the output clock name to define
>> the parent clock:
>>
>> bus_gates {
>> 	clocks = <&ahb1>, <&ahb2>, <&apb1>, <&apb2>;
>> 	clock-indices = <5>, <6>, <8>, ...
>> 	clock-output-names = "ahb1_ce", "ahb1_dma", "ahb1_mmc0"
>> };
>>
>> with the documentation:
>>
>> 	"the clocks MUST be defined in order: ahb1, ahb2, apb1, apb2."
>>
>> and the code
>>
>> 	if (strncmp(clock_name, "ahb1", 4) == 0)
>> 		clk_parent = of_clk_get_parent_name(node, 0);
>> 	else if (..)
>>
>> but it seems a bit hacky.
>
> It's exactly what I suggested, without the string comparison, but
> relying on the ID instead.

I'm not following you here, what do you mean with "the ID" ?

Regards,

Hans
