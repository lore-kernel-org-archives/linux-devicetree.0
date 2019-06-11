From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: How to inject fwnode/oftree/acpi data by platform driver ?
Date: Tue, 11 Jun 2019 21:44:23 +0300
Message-ID: <CAHp75Vc_FnSaqq_Xu_Y3uXBYY=HbGsthVOAqyt4c-dH7sRGVVw@mail.gmail.com>
References: <c15a9872-4ad4-1b7e-e34f-14549b5b55eb@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c15a9872-4ad4-1b7e-e34f-14549b5b55eb@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

+Cc: Heikki.
Heikki, can you help here with swnodes?

On Sat, Jun 1, 2019 at 5:17 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
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
> wired to buttons and LEDs. The board can only be detected via DMI
> string, no way to probe the platform devices - have to be initialized
> explicitly (that's how I'm already doing it now).
>
> The nicest way, IMHO, would be if I could just write some piece of DTS
> and some fancy magic all the rest under the hood. Such thing doesn't
> seem to exist yet. Does it make sense to implement that ? How could
> we do it ?
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



-- 
With Best Regards,
Andy Shevchenko
