From: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Subject: Re: [PATCH 09/11] ARM: at91/dt: define main xtal frequency of the
 at91sam9261ek board
Date: Thu, 20 Mar 2014 11:09:53 +0100
Message-ID: <CACh+v5Psjgs=v2feP3oETXgxUXw6JsVDXBKhEG4OPCP1-YM1aQ@mail.gmail.com>
References: <1395173924-3648-1-git-send-email-b.brezillon.dev@gmail.com>
 <1395173924-3648-10-git-send-email-b.brezillon.dev@gmail.com>
 <CACh+v5OF52ZuDBpkqpev1Jxv0DJ1ckRR+DjcX500i3o0o4HE9A@mail.gmail.com>
 <532AB9EC.1030507@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <532AB9EC.1030507@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Boris BREZILLON <b.brezillon.dev@gmail.com>
Cc: devicetree <devicetree@vger.kernel.org>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, linux-doc@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Mike Turquette <mturquette@linaro.org>, Boris BREZILLON <brezillonboris@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

That's right. I keep forgetting this.

2014-03-20 10:50 GMT+01:00 Boris BREZILLON <b.brezillon.dev@gmail.com>:
>
> Le 20/03/2014 10:24, Jean-Jacques Hiblot a =E9crit :
>
>> 2014-03-18 21:18 GMT+01:00 Boris BREZILLON <brezillonboris@gmail.com>:
>>>
>>> Define at91sam9261ek main crystal frequency.
>>>
>>> Signed-off-by: Boris BREZILLON <b.brezillon.dev@gmail.com>
>>> ---
>>>   arch/arm/boot/dts/at91sam9261ek.dts |    4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/at91sam9261ek.dts
>>> b/arch/arm/boot/dts/at91sam9261ek.dts
>>> index 2ce527e..7175986 100644
>>> --- a/arch/arm/boot/dts/at91sam9261ek.dts
>>> +++ b/arch/arm/boot/dts/at91sam9261ek.dts
>>> @@ -29,6 +29,10 @@
>>>                          compatible =3D "atmel,osc", "fixed-clock";
>>>                          clock-frequency =3D <18432000>;
>>>                  };
>>> +
>>> +               main_xtal: main_xtal {
>>> +                       clock-frequency =3D <18432000>;
>>> +               };
>>>          };
>>>
>>>          ahb {
>>> --
>>> 1.7.9.5
>>>
>> You forgot to remove the old fixed-clock definition for the main_clock:
>> clock@0
>
>
> We need this clock when CCF is disabled (when using the old at91 clk
> implementation).
> I'm afraid we'll have to keep it until we move all sam9 SoCs and boards to
> CCF (and DT).
>
> Best Regards,
>
> Boris
>
>>
>> Otherwise:
>> Acked-by: Jean-Jacques HIBLOT <jjhiblot@traphandler.com>
>
>
