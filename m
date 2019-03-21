From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 0/4] ARM: da850: enable cpufreq in DT mode
Date: Thu, 21 Mar 2019 16:40:02 +0100
Message-ID: <CAMRc=MespSLpsknVrMwYVorv0NxAsSL+U9R049Fw_Wqe1_gqkw@mail.gmail.com>
References: <20190321141010.19612-1-brgl@bgdev.pl> <e4d51b63-bc07-c595-9d73-c4b09eb11341@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e4d51b63-bc07-c595-9d73-c4b09eb11341@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

czw., 21 mar 2019 o 16:29 David Lechner <david@lechnology.com> napisa=C5=82=
(a):
>
> On 3/21/19 9:10 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > This series adds cpufreq-dt operating points for da850 boards supported
> > with device tree (da850-lcdk, da850-lego-ev3, da850-evm) and also
> > includes a fix for the da850-evm boardfile which checks an unset variab=
le
> > to determine the highest available frequency for cpufreq.
>
>
> I can't find any old threads about this, but I recall that there was a
> problem with the USB OHCI controller breaking when switching frequencies.
> It didn't happen all of the time, but often enough that it made using
> cpufreq unusable for me. Is this still a problem?
>

Yes, it's still a problem, but it's bug-compatible with the legacy BSP
from TI (project arago). I've spent some time trying to figure out the
culprit at the time you were working on the clock driver, but
eventually gave up. I think it's some kind of a HW issue. The
controller would simple die after a couple transitions.

Bart

> Also, a big-picture question. On boards with fixed regulators, what is
> the benefit of enabling frequency scaling? The power savings aspect
> seems negligible (< 1% in my tests) since the voltage cannot be changed.
