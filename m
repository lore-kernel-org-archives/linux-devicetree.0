From: Prabhakar Lad <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] media: i2c: adv7343: fix the DT binding properties
Date: Sat, 14 Sep 2013 10:53:53 +0530
Message-ID: <CA+V-a8sVyJ1TrTSiaj8vpaD+f_qJ5Hp287E3HuHJ_pRzzmdAvg@mail.gmail.com>
References: <1379073471-7244-1-git-send-email-prabhakar.csengg@gmail.com>
	<523395DC.5080009@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <523395DC.5080009-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DLOS <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, LDOC <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LMML <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

This patch should have been marked as RFC.

Thanks for the review.

On Sat, Sep 14, 2013 at 4:16 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wro=
te:
> On 09/13/2013 05:57 AM, Prabhakar Lad wrote:
>> From: "Lad, Prabhakar" <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> This patch fixes the DT binding properties of adv7343 decoder.
>> The pdata which was being read from the DT property, is removed
>> as this can done internally in the driver using cable detection
>> register.
>>
>> This patch also removes the pdata of ADV7343 which was passed from
>> DA850 machine.
>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/adv7343.txt b/D=
ocumentation/devicetree/bindings/media/i2c/adv7343.txt
>
>>  Required Properties :
>>  - compatible: Must be "adi,adv7343"
>> +- reg: I2C device address.
>> +- vddio-supply: I/O voltage supply.
>> +- vddcore-supply: core voltage supply.
>> +- vaa-supply: Analog power supply.
>> +- pvdd-supply: PLL power supply.
>
> Old DTs won't contain those properties. This breaks the DT ABI if those
> properties are required. Is that acceptable?
>
As of now adv7343 via DT binding is not enabled in any platforms
so this wont break any DT ABI.

> If it is, I think we should document that older versions of the binding
> didn't require those properties, so they may in fact be missing.
>
> I note that this patch doesn't actually update the driver to
> regulator_get() anything. Shouldn't it?
>
As of now the driver isn=92t enabling/accepting the regulators,
so should I add those in DT properties or not ?

>>  Optional Properties :
>> -- adi,power-mode-sleep-mode: on enable the current consumption is reduc=
ed to
>> -                           micro ampere level. All DACs and the interna=
l PLL
>> -                           circuit are disabled.
>> -- adi,power-mode-pll-ctrl: PLL and oversampling control. This control a=
llows
>> -                        internal PLL 1 circuit to be powered down and t=
he
>> -                        oversampling to be switched off.
>> -- ad,adv7343-power-mode-dac: array configuring the power on/off DAC's 1=
..6,
>> -                           0 =3D OFF and 1 =3D ON, Default value when t=
his
>> -                           property is not specified is <0 0 0 0 0 0>.
>> -- ad,adv7343-sd-config-dac-out: array configure SD DAC Output's 1 and 2=
, 0 =3D OFF
>> -                              and 1 =3D ON, Default value when this pro=
perty is
>> -                              not specified is <0 0>.
>
> At a very quick glance, it's not really clear why those properties are
> being removed. They seem like HW configuration, so might be fine to put
> into DT. What replaces these?

Yes these were HW configuration but, its now internally handled in
the driver.  The 'ad,adv7343-power-mode-dac' property which enabled the
DAC's 1..6 , so now in the driver by default all the DAC's are enabled by
default and enable unconnected DAC auto power down. Similarly
'ad,adv7343-sd-config-dac-out' property enabled SD DAC's 1..2 but
now is enabled by reading the CABLE DETECT register which tells
the status of DAC1/2.

Regards,
--Prabhakar
