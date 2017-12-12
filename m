From: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Subject: Re: [PATCH v4 2/2] clocksource: sprd: Add timer driver for Spreadtrum
 SC9860 platform
Date: Tue, 12 Dec 2017 13:44:21 +0100
Message-ID: <CAOFm3uE0Tpwnyi0a9FhSKhdzDNdCA3YRc6SSxvKByy=JGV6gSA@mail.gmail.com>
References: <346a731ce967b56514b0838bbbd8b4f500cea040.1513075872.git.baolin.wang@spreadtrum.com>
 <c5948e4bec5b281fd61d8168bad8d35eb254476d.1513075872.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c5948e4bec5b281fd61d8168bad8d35eb254476d.1513075872.git.baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Baolin,

On Tue, Dec 12, 2017 at 12:28 PM, Baolin Wang
<baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org> wrote:
> The Spreadtrum SC9860 platform will use the architected timers as local
> clock events, but we also need a broadcast timer device to wakeup the
> cpus when the cpus are in sleep mode.
>
> The Spreadtrum timer can support 32bit or 64bit counter, as well as
> supporting period mode or one-shot mode.
>
> Signed-off-by: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> ---
[....]
>  - Change the license format according to Linus[1][2][3],
>  Thomas[4] and Greg[5] comments on the topic.
>  [1] https://lkml.org/lkml/2017/11/2/715
>  [2] https://lkml.org/lkml/2017/11/25/125
>  [3] https://lkml.org/lkml/2017/11/25/133
>  [4] https://lkml.org/lkml/2017/11/2/805
>  [5] https://lkml.org/lkml/2017/10/19/165

Thank you for this. For this only:

Acked-by: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
