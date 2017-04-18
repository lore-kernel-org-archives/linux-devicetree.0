From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: sun8i: a83t: Rename pinmux setting names
Date: Tue, 18 Apr 2017 17:16:53 +0800
Message-ID: <CAGb2v65is5iyzXYvJMF7QLWXBdMBpemEm2kmyTnytx7V30M7Og@mail.gmail.com>
References: <20170418042205.27894-1-wens@csie.org> <20170418042205.27894-4-wens@csie.org>
 <20170418090447.dcxinewczubf26b7@lukather>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBHVT27DQKGQEVPXIACA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170418090447.dcxinewczubf26b7@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 18, 2017 at 5:04 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Tue, Apr 18, 2017 at 12:22:05PM +0800, Chen-Yu Tsai wrote:
>> The pinmux setting nodes all have an address element in their node
>> names, however the pinctrl node does not have #address-cells.
>>
>> Rename the existing pinmux setting nodes and labels in sun8i-a83t.dtsi,
>> dropping identifiers for functions that only have one possible setting,
>> and using the pingroup name if the function is identically available on
>> different pingroups.
>>
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>
> Applied, and I really like the new names.
>
> Would you make the same patch for everyone?

I can. No guarantees on the schedule though.

ChenYu
