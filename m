From: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: sun6i: a31: Enable HDMI support on the
 Mele I7
Date: Wed, 31 Jan 2018 17:44:55 +0100
Message-ID: <CAEKpxBnGWRqRbdTDi+P0xQ+eRjzZPn+iT8W9z793x6cKsn03-w@mail.gmail.com>
References: <20180130183327.20825-1-codekipper@gmail.com> <20180131153204.wm7sdwowvnjg2wd6@flea.lan>
Reply-To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCHNXO4F7MHBBCHFY7JQKGQEYMKD6YA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180131153204.wm7sdwowvnjg2wd6-ZC1Zs529Oq4@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 31 January 2018 at 16:32, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Tue, Jan 30, 2018 at 07:33:27PM +0100, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> The Mele I7 has an HDMI connector wired to the HDMI pins
>> on the SoC. Enable the display pipeline and HDMI output.
>>
>> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Chen-Yu is missing from the recipients...
ACK...I'll update my git config for this repo.
>
>> ---
>>  arch/arm/boot/dts/sun6i-a31-i7.dts | 29 +++++++++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun6i-a31-i7.dts b/arch/arm/boot/dts/sun6i-a31-i7.dts
>> index 010a84c7c012..4f69be4988a5 100644
>> --- a/arch/arm/boot/dts/sun6i-a31-i7.dts
>> +++ b/arch/arm/boot/dts/sun6i-a31-i7.dts
>> @@ -58,6 +58,17 @@
>>               stdout-path = "serial0:115200n8";
>>       };
>>
>> +     hdmi-connector {
>> +             compatible = "hdmi-connector";
>> +             type = "a";
>> +
>> +             port {
>> +                     hdmi_con_in: endpoint {
>> +                             remote-endpoint = <&hdmi_out_con>;
>> +                     };
>> +             };
>> +     };
>> +
>>       leds {
>>               compatible = "gpio-leds";
>>               pinctrl-names = "default";
>> @@ -93,6 +104,10 @@
>>       status = "okay";
>>  };
>>
>> +&de {
>> +     status = "okay";
>> +};
>> +
>>  &ehci0 {
>>       status = "okay";
>>  };
>> @@ -101,6 +116,16 @@
>>       status = "okay";
>>  };
>>
>> +&hdmi {
>> +     status = "okay";
>> +};
>> +
>> +&hdmi_out {
>> +     hdmi_out_con: endpoint {
>> +             remote-endpoint = <&hdmi_con_in>;
>> +     };
>> +};
>> +
>>  &gmac {
>
> And this is not ordered alphabetically.
ACK....arrgghhh
Will fix and repush soon.
BR,
CK
>
> maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
