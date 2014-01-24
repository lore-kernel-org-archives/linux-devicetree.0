From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH V2 1/8] SPEAr13xx: Set dt field entry <stmmac,phy-addr>
 for phy probe
Date: Fri, 24 Jan 2014 14:02:35 +0800
Message-ID: <CAGb2v64pSvoRBzrpzXT5yywqWSw8ryQiuVop2tMSRpU2=YMLiw@mail.gmail.com>
References: <cover.1390471111.git.mohit.kumar@st.com> <12754927160d11063aad96c011c4807cb0aa1775.1390471111.git.mohit.kumar@st.com>
 <CAOh2x=mQLyMV_0Swf3o2c9bW_DNCLT-fQFc3Qs6yt1+9prabmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOh2x=mQLyMV_0Swf3o2c9bW_DNCLT-fQFc3Qs6yt1+9prabmw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>, Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Jan 24, 2014 at 1:02 PM, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Jan 23, 2014 at 4:02 PM, Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org> wrote:
>> DT field name for the phy address changed since kernel 3.10. Set the
>> snps,phy-addr to 0xffffffff so that the driver probes for the phy.

This will no longer be required. The default behavior for
DT based setups has been changed to auto-detecting the phy.

See http://patchwork.ozlabs.org/patch/312063/


Cheers
ChenYu

>>
>> Signed-off-by: Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>
>> Cc: Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>
>> Cc: Viresh Kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Cc: spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org
>> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> ---
>>  arch/arm/boot/dts/spear13xx.dtsi |    1 +
>>  1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/spear13xx.dtsi b/arch/arm/boot/dts/spear13xx.dtsi
>> index 4382547..3518803 100644
>> --- a/arch/arm/boot/dts/spear13xx.dtsi
>> +++ b/arch/arm/boot/dts/spear13xx.dtsi
>> @@ -155,6 +155,7 @@
>>
>>                 gmac0: eth@e2000000 {
>>                         compatible = "st,spear600-gmac";
>> +                       snps,phy-addr = <0xffffffff>;
>>                         reg = <0xe2000000 0x8000>;
>>                         interrupts = <0 33 0x4
>>                                       0 34 0x4>;
>
> Acked-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
