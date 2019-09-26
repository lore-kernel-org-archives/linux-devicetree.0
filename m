From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCHv4-next 0/3] Odroid c2 usb fixs rebase on linux-next
Date: Thu, 26 Sep 2019 16:23:08 +0530
Message-ID: <CANAwSgSvPmtzCzbaLC6LOfov9e32V9koUhF=5VAaKO87EHKw8A@mail.gmail.com>
References: <20190902054935.4899-1-linux.amoon@gmail.com> <7ha7asuj6q.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7ha7asuj6q.fsf@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Kevin,

On Thu, 26 Sep 2019 at 03:34, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Anand Moon <linux.amoon@gmail.com> writes:
>
> > Some time ago I had tired to enable usb bus 1 for Odroid C2/C1
> > but it's look like some more work is needed to u-boot and
> > usb_phy driver to initialize this port.
> >
> > Below patches tries to address the issue regarding usb bus 2 (4 port)
> > while disable the usb bus 1 on this board.
> >
> > Previous patch
> > [0] https://lkml.org/lkml/2019/1/29/325
> >
> > Re send below series based re based on linux-next-20190830.
> > For review and testing.
> >
> > [1] https://patchwork.kernel.org/cover/11113091/
> >
> > Small changes from previous series.
> > Fix the commit message for patch 1
>
> Queued for v5.5.
>
> I fixed up the typo in patch 2/3 when applying as suggested by Martin.
>
> Kevin

Thanks,

Best Regards
-Anand
