From: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/5] arm64: allwinner: a64: Add SPDIF TX pin
 to the A64
Date: Wed, 24 Jan 2018 12:40:37 +0100
Message-ID: <CAEKpxBk3E87i3oLACFxJs=_s7LO8Mr5N9ZsYunMna4CfQp31Gg@mail.gmail.com>
References: <20180124103943.2062-1-codekipper@gmail.com> <20180124103943.2062-3-codekipper@gmail.com>
 <20180124110031.kksmh56krinaivh7@flea.lan> <CAGb2v67oFc0LRAcdvh-2F3HRkOui34ANp_-frB9exdvFBAirqg@mail.gmail.com>
Reply-To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCHNXO4F7MHBBNXBUHJQKGQELB2ET2A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v67oFc0LRAcdvh-2F3HRkOui34ANp_-frB9exdvFBAirqg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 24 January 2018 at 12:02, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> On Wed, Jan 24, 2018 at 7:00 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>> On Wed, Jan 24, 2018 at 11:39:40AM +0100, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>>> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>
>>> Add the SPDIF TX pin to the A64 dtsi.
>>>
>>> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>>> index c82979038b0b..db1694ec3ee4 100644
>>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>>> @@ -336,6 +336,11 @@
>>>                               drive-strength = <40>;
>>>                       };
>>>
>>> +                     spdif_tx_pins_a: spdif@0 {
>>
>> This will generate a dtc warning, you should use a syntax similar to
>> the other nodes there (ie. spdif if that's the only muxing option, or
>> spdif-0).
>
> Furthermore, if this is the only option, you should set it as the
> default in the .dtsi, so boards don't have to, and possibly squash
> this patch into the first one.
ACK
Thanks,
CK
>
> ChenYu
