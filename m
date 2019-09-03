From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCHv1 0/3] Odroid c2 missing regulator linking
Date: Tue, 3 Sep 2019 21:07:42 +0200
Message-ID: <CAFBinCBY9SJKOaVYCV2HzDOrjngtcreM4Ftvk+hgr8KAGV_V+Q@mail.gmail.com>
References: <20190828202723.1145-1-linux.amoon@gmail.com> <8c40f334-c723-b524-857c-73734b7d0827@baylibre.com>
 <CANAwSgShr-K-44UzdxFC7pvpTye_pbEMdS6ug1eWwYhnsVNGdQ@mail.gmail.com>
 <101a12ac-1464-8864-4f8c-56bb46034a08@baylibre.com> <CANAwSgQwZg_AXAnAY4KwDzHpwcSA9up7SrR6jyv5Bem24wtaJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANAwSgQwZg_AXAnAY4KwDzHpwcSA9up7SrR6jyv5Bem24wtaJg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Anand,

On Fri, Aug 30, 2019 at 11:34 AM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> > SCPI works fine on all tested devices, except Odroid-C2, because Hardkernel left
> > the > 1.5GHz freq in the initial SCPI tables loaded by the BL2, i.e. packed with U-Boot.
> > Nowadays they have removed the bad frequencies, but still some devices uses the old
> > bootloader.
> >
> > But in the SCPI case we trust the table returned by the firmware and use it as-in,
> > and there is no (simple ?) way to override the table and set a max frequency.
> >
> > This is why we disabled SCPI.
> >
> > See https://patchwork.kernel.org/patch/9500175/
>
> I have quickly enable this on my board and here the cpufreq info
[...]
> Almost all the test case pass with this one as off now.
I suggest to send an RFC patch to (re-)enable DVFS on Odroid-C2
I find it easy to miss a DVFS discussion inside a "missing regulator" series

with a separate patch you can also get feedback from other Odroid-C2
owners who can help testing
coincidence or not: on Friday someone asked in the #linux-amlogic IRC
channel why Odroid-C2 didn't have DVFS enabled and what to do about it


Martin
