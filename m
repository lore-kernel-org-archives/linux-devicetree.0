From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i: a83t: Add CPU regulator
 supplies for A83T boards
Date: Thu, 28 Jun 2018 11:10:17 +0800
Message-ID: <CAGb2v64FtpYbSK7gqbQmuRwUz1UrTRDY0KvT3VZGc9tv6sDecw@mail.gmail.com>
References: <20180627022709.27434-1-wens@csie.org> <20180627184539.3er4226lkbtudhwe@core>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBMFD2HMQKGQE4ODKURY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180627184539.3er4226lkbtudhwe@core>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 28, 2018 at 2:45 AM, Ond=C5=99ej Jirman
<doudahwezomiechahtah-DlDF6nMZSto@public.gmane.org> wrote:
> Hi,
>
> On Wed, Jun 27, 2018 at 10:27:09AM +0800, Chen-Yu Tsai wrote:
>> The OPPs for the A83T CPU cores were added in v4.17 in commit 2db639d8c1=
66
>> ("ARM: dts: sun8i: a83t: add stable OPP tables and CPUfreq"), but board
>> level regulator supplies for the CPU clusters were only added for the
>> TBS-A711 tablet. This means the other A83T boards do not benefit from
>> voltage scaling, or worse, if the implementation does not scale the
>> frequency when the voltage is fixed, no benefit at all.
>>
>> Add board level CPU cluster power supplies to all the A83T development
>> boards, so they can have proper dynamic CPU voltage and frequency scalin=
g.
>>
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts | 8 ++++++++
>>  arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts           | 8 ++++++++
>>  arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts       | 8 ++++++++
>>  3 files changed, 24 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts b/ar=
ch/arm/boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts
>> index 36ecebaff3c0..1c012a4def16 100644
>> --- a/arch/arm/boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts
>> +++ b/arch/arm/boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts
>> @@ -79,6 +79,14 @@
>>       };
>>  };
>>
>> +&cpu0 {
>> +     cpu-supply =3D <&reg_dcdc2>;
>> +};
>> +
>> +&cpu100 {
>> +     cpu-supply =3D <&reg_dcdc3>;
>> +};
>> +
>
> Shouldn't this be done for all CPU cores? Say you start the kernel with
> maxcpus=3D1 and then enable CPU5 later on, will the regulator get enabled=
,
> if it is not enabled by always-on setting?

As it stands, the cpufreq framework doesn't enable the regulator anyway.
There's nothing in the bindings that say how this should be set either.

ChenYu

>
> regards,
>   o.
>
>>  &ehci0 {
>>       status =3D "okay";
>>  };
>> diff --git a/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts b/arch/arm/boo=
t/dts/sun8i-a83t-bananapi-m3.dts
>> index 3b579d7567c8..c7ce4158d6c8 100644
>> --- a/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
>> +++ b/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
>> @@ -107,6 +107,14 @@
>>       };
>>  };
>>
>> +&cpu0 {
>> +     cpu-supply =3D <&reg_dcdc2>;
>> +};
>> +
>> +&cpu100 {
>> +     cpu-supply =3D <&reg_dcdc3>;
>> +};
>> +
>>  &de {
>>       status =3D "okay";
>>  };
>> diff --git a/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts b/arch/arm=
/boot/dts/sun8i-a83t-cubietruck-plus.dts
>> index 88decb0747ac..e5f0645e53a7 100644
>> --- a/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts
>> +++ b/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts
>> @@ -145,6 +145,14 @@
>>       };
>>  };
>>
>> +&cpu0 {
>> +     cpu-supply =3D <&reg_dcdc2>;
>> +};
>> +
>> +&cpu100 {
>> +     cpu-supply =3D <&reg_dcdc3>;
>> +};
>> +
>>  &ehci0 {
>>       /* GL830 USB-to-SATA bridge here */
>>       status =3D "okay";
>> --
>> 2.18.0
>>
>> --
>> You received this message because you are subscribed to the Google Group=
s "linux-sunxi" group.
>> To unsubscribe from this group and stop receiving emails from it, send a=
n email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
>> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
