From: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH 1/2] vfio: platform: Fix reset module leak in error path
Date: Mon, 26 Feb 2018 10:47:41 +0100
Message-ID: <9c79c6ba-c3a8-68f3-4ac6-00858bd1ccb5@redhat.com>
References: <1518539815-13774-1-git-send-email-geert+renesas@glider.be>
 <1518539815-13774-2-git-send-email-geert+renesas@glider.be>
 <2fe86be6-a3e2-9bd6-1d72-63cf0fe3a731@redhat.com>
 <CAMuHMdXm97QFTC8VYDoByHsXaG5BQqFdhwqMTuGVRKDe-oh8EQ@mail.gmail.com>
 <CAMuHMdVkTy=TELjG0Jh7HMDe5075EHSebpNUWqBDt+6ik_Aixw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVkTy=TELjG0Jh7HMDe5075EHSebpNUWqBDt+6ik_Aixw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Baptiste Reynal <b.reynal@virtualopensystems.com>, Alex Williamson <alex.williamson@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, KVM list <kvm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On 21/02/18 17:07, Geert Uytterhoeven wrote:
> Hi Eric,
> 
> On Wed, Feb 14, 2018 at 10:32 AM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Wed, Feb 14, 2018 at 9:36 AM, Auger Eric <eric.auger@redhat.com> wrote:
>>> If I am not wrong we also leak the reset_module if
>>> vfio_platform_get_reset() fails to find the reset function (of_reset ==
>>> NULL), in which case we should do the module_put() in
>>> vfio_platform_get_reset().
>>
>> Correct. Will look into fixing it...
> 
> Upon second look, I don't think there's a leak in vfio_platform_get_reset().
> 
> If try_module_get() succeeded, there will always be a valid reset function
> (unless someone registered a vfio_reset_handler with a NULL reset function).
Hum yes, you are right. So the code is fine as is. Sorry for the noise.

Thanks

Eric


> 
> Or do you mean the call to request_module()?
> That one doesn't do a module_get(), it merely tries to load a module.
> Hence there's no need to do a module_put() afterwards.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
