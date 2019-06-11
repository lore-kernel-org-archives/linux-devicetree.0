MIME-Version: 1.0
Date: Tue, 11 Jun 2019 15:31:46 -0600
References: <c15a9872-4ad4-1b7e-e34f-14549b5b55eb@metux.net>
In-Reply-To: <c15a9872-4ad4-1b7e-e34f-14549b5b55eb@metux.net>
Message-ID: <CAL_JsqK=A7rH0wxsteU_5Kjenq7jHb5a3aAp-4UF4LG7Pd0jZQ@mail.gmail.com>
Subject: Re: How to inject fwnode/oftree/acpi data by platform driver ?
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-acpi@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Sat, Jun 1, 2019 at 8:14 AM Enrico Weigelt, metux IT consult <lkml@metux=
.net> wrote:
>
> Hi folks,
>
>
> I'm looking for a way to inject fwnode data from a platform driver,
> in order to initialize generic drivers w/ board specific configuration.
> The idea is getting rid of passing driver specific pdata structs
> (which, IIRC, seem to be deprecated).
>
> An example usecase is the APUv2/3 board, which have things like gpios

No idea what an APU board is...

> wired to buttons and LEDs. The board can only be detected via DMI
> string, no way to probe the platform devices - have to be initialized
> explicitly (that's how I'm already doing it now).

Detecting a board or attachment of some set of devices is a separate proble=
m from how we describe the devices.

> The nicest way, IMHO, would be if I could just write some piece of DTS
> and some fancy magic all the rest under the hood. Such thing doesn't
> seem to exist yet. Does it make sense to implement that ? How could
> we do it ?

Not the first time this has come up. The general idea is to use DT overlays=
, but support is not complete. There's at least 2 scenarios. A DT based pla=
tform and you are applying overlays to the base DT. The second scenario whi=
ch probably matches your use case is ov


>
> Which other options do we have ?
>
> Or should we just leave everything as it is and stick w/ pdata structs ?
>
>
> thx
> --mtx
>
> --
> Enrico Weigelt, metux IT consult
> Free software and Linux embedded engineering
> info@metux.net -- +49-151-27565287
