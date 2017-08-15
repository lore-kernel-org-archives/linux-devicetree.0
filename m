From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v6] arm64: allwinner: a64: Add initial
 NanoPi A64 support
Date: Tue, 15 Aug 2017 12:09:56 +0800
Message-ID: <CAGb2v64cbogGW4yMVEvzPQibQisEoYwcrxv2MKuWQ_hS7HxpLQ@mail.gmail.com>
References: <1502707013-16422-1-git-send-email-jteki@openedev.com>
 <CAGb2v64gsJ0R1AU6LJ74WMgrdvMz2ykZaXvAp00rUn6X6rHzSA@mail.gmail.com> <CAD6G_RSVTWLtSbZzz4Sbg15=3g1+R7Fyjoy=+wv-gvw3RoY7nA@mail.gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBLHIZHGAKGQEJH353TY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAD6G_RSVTWLtSbZzz4Sbg15=3g1+R7Fyjoy=+wv-gvw3RoY7nA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, yftan <yftan-/wLt9BB+Iy7nC/t2CciAbw@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 15, 2017 at 11:51 AM, Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Aug 15, 2017 at 9:14 AM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
>> On Mon, Aug 14, 2017 at 6:36 PM, Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

[...]

>>> +/* i2c1 connected with gpio headers like pine64, bananapi */
>>> +&i2c1 {
>>> +       pinctrl-names = "default";
>>> +       pinctrl-0 = <&i2c1_pins>;
>>> +       status = "okay";
>>
>> So I rechecked some of the current dts files we have. We typically
>> don't enable peripherals by default if they are on some generic
>> expansion header. We do however allow listing them with an explicit
>>
>>     status = "disabled";
>>
>> Users are free to enable it themselves. The listing lets them enable
>> it from U-boot with a single fdt command.

[...]

>>> +&reg_dldo1 {
>>> +       regulator-always-on;
>>> +       regulator-min-microvolt = <3300000>;
>>> +       regulator-max-microvolt = <3300000>;
>>> +       /* Same used for vcc-dsi */
>>> +       regulator-name = "vcc-hdmi";
>>
>> We normally just tack on all the consumers to the name, so
>> "vcc-hdmi-dsi" in this case.
>>
>>> +};
>>> +
>>> +&reg_dldo4 {
>>> +       regulator-always-on;
>>> +       regulator-min-microvolt = <3000000>;
>>> +       regulator-max-microvolt = <3000000>;
>>> +       /* Same used for vdd_wifi-io */
>>> +       regulator-name = "vcc-pg";
>>
>> And "vcc-pg-wifi-io" here.
>>
>> I can fix up these bits when applying, if you are OK with the changes.
>
> OK, please make necessary changes.
>
> thanks!

Done. Please check the results of both your patches here:

https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git/log/?h=sunxi/dt64-for-4.14

ChenYu
