From: Boris BREZILLON <b.brezillon.dev@gmail.com>
Subject: Re: [PATCH 09/11] ARM: at91/dt: define main xtal frequency of the
 at91sam9261ek board
Date: Thu, 20 Mar 2014 10:50:36 +0100
Message-ID: <532AB9EC.1030507@gmail.com>
References: <1395173924-3648-1-git-send-email-b.brezillon.dev@gmail.com>	<1395173924-3648-10-git-send-email-b.brezillon.dev@gmail.com> <CACh+v5OF52ZuDBpkqpev1Jxv0DJ1ckRR+DjcX500i3o0o4HE9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACh+v5OF52ZuDBpkqpev1Jxv0DJ1ckRR+DjcX500i3o0o4HE9A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Boris BREZILLON <brezillonboris@gmail.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, Mike Turquette <mturquette@linaro.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, devicetree <devicetree@vger.kernel.org>, linux-doc@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Le 20/03/2014 10:24, Jean-Jacques Hiblot a =E9crit :
> 2014-03-18 21:18 GMT+01:00 Boris BREZILLON <brezillonboris@gmail.com>=
:
>> Define at91sam9261ek main crystal frequency.
>>
>> Signed-off-by: Boris BREZILLON <b.brezillon.dev@gmail.com>
>> ---
>>   arch/arm/boot/dts/at91sam9261ek.dts |    4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/at91sam9261ek.dts b/arch/arm/boot/dts=
/at91sam9261ek.dts
>> index 2ce527e..7175986 100644
>> --- a/arch/arm/boot/dts/at91sam9261ek.dts
>> +++ b/arch/arm/boot/dts/at91sam9261ek.dts
>> @@ -29,6 +29,10 @@
>>                          compatible =3D "atmel,osc", "fixed-clock";
>>                          clock-frequency =3D <18432000>;
>>                  };
>> +
>> +               main_xtal: main_xtal {
>> +                       clock-frequency =3D <18432000>;
>> +               };
>>          };
>>
>>          ahb {
>> --
>> 1.7.9.5
>>
> You forgot to remove the old fixed-clock definition for the main_cloc=
k: clock@0

We need this clock when CCF is disabled (when using the old at91 clk=20
implementation).
I'm afraid we'll have to keep it until we move all sam9 SoCs and boards=
=20
to CCF (and DT).

Best Regards,

Boris
>
> Otherwise:
> Acked-by: Jean-Jacques HIBLOT <jjhiblot@traphandler.com>
