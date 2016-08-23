From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 3/9] regulator: core: Try full range when
 adjusting regulators to constraints
Date: Tue, 23 Aug 2016 12:17:23 +0800
Message-ID: <CAGb2v67ZST-E++z5oobLRwCfHMZZR6HTss=MSqJLJArnQz3qMw@mail.gmail.com>
References: <20160821021125.1521-1-wens@csie.org> <20160821021125.1521-4-wens@csie.org>
 <20160822162907.GO22076@sirena.org.uk> <20160822175205.h76hurjaopnosymc@vip.cybercity.dk>
 <20160822180932.GW22076@sirena.org.uk>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB3E4566QKGQEZFOSXMY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160822180932.GW22076-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rask Ingemann Lambertsen <ccc94453-1EA3ORoCGBhoJ7GROcy7lA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 23, 2016 at 2:09 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Aug 22, 2016 at 07:52:05PM +0200, Rask Ingemann Lambertsen wrote:
>> On Mon, Aug 22, 2016 at 05:29:07PM +0100, Mark Brown wrote:
>
>> > This seems like you have buggy constraints, constraints which allow
>> > voltages that can't physically be satisfied don't make obvious sense.
>
>> No, it's for cases like this (see the cubietruck4 or a80-optimus dts
>> patches):
>
>>                       reg_bldo4: bldo4 {
>>                               regulator-min-microvolt = <1080000>;
>>                               regulator-max-microvolt = <1320000>;
>>                               regulator-name = "vcc12-hsic";
>>                       };
>
>> The regulator can do 1100000 uV, 1200000 uV and 1300000 uV, all of which
>> are within the constraints, so obviously the constraints can be satisfied,
>> yet the regulator core fails do so with a message like this:
>
> Sure, but the constraints also say that you can do 1.32V which the
> system is not physically capable of delivering.  That's not a good sign
> for the constraints, it suggests that at least the capabilities of the
> regulator have not been taken into consideration when setting up the
> constraints.

So to be clear, the constraints should be the intersection of the
recommended operating parameters of the consumer and the regulator's
output, with the voltage/current steps taken in to consideration.

In that case I'll drop this patch and fix up the constraints.
And maybe send a patch to clarify the regulator bindings.

Thanks
ChenYu
