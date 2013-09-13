From: =?ISO-8859-1?Q?Emilio_L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
Subject: Re: [PATCH] memory: add a basic OF-based memory driver
Date: Thu, 12 Sep 2013 22:31:08 -0300
Message-ID: <52326ADC.8040703@elopez.com.ar>
References: <1378863781-4235-1-git-send-email-emilio@elopez.com.ar> <1379032225-6425-1-git-send-email-emilio@elopez.com.ar> <CAOesGMiUMniKRLRgGPsimR0bXWQFbx+SL5dUJXOb8t0JfEcHsg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMiUMniKRLRgGPsimR0bXWQFbx+SL5dUJXOb8t0JfEcHsg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?ISO-8859-1?Q?David_Lanzend=F6rfer?= <david.lanzendoerfer-Z7Kmv9EsliU@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Olof,

El 12/09/13 21:57, Olof Johansson escribi=F3:
> On Thu, Sep 12, 2013 at 5:30 PM, Emilio L=F3pez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org=
> wrote:
>> This driver's only job is to claim and ensure the necessary clock
>> for memory operation on a DT-powered machine remains enabled.
>>
>> Signed-off-by: Emilio L=F3pez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
>> ---
>>
>> I believe this new patch should resolve all the concerns raised; as
>> always, all feedback is welcome :)
>
> I think you're going about this the wrong way.
>
> If you have a problem with a clock not staying on, shouldn't you just
> marking it appropriately in the clock table instead, making sure it's
> initialized with at least one reference to it?

If by "the clock table" you mean the tree as handled by the common cloc=
k=20
framework, there is no such flag available as of today; see Mike's repl=
y=20
for more information.

Personally I feel that if the general case can solve our problems (in=20
this case, having a consumer who prepares and enables the clock), we=20
should avoid adding special cases to the framework.

> I believe that is how
> some of the other platforms handle this, and it's a lot cleaner than
> adding a fake binding and a fake driver just to grab a single clock.

The binding doesn't have to be fake; it is actually describing the=20
memory controller hardware:

mc: mc@0123000 {
	compatible =3D "simple-memory-controller";
	reg =3D <0x0123000 0x400>;
	clocks =3D <&pll5 1>;
};

If one day we get docs and/or have any special features we may need fro=
m=20
the controller, we can use something like

mc: mc@0123000 {
	compatible =3D "vendor,awesome-mc", "simple-memory-controller";
	reg =3D <0x0123000 0x400>;
	clocks =3D <&pll5 1>;
};

Cheers,

Emilio

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
