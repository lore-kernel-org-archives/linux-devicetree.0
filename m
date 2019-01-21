From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: gnss: add mediatek binding
Date: Mon, 21 Jan 2019 15:51:36 -0600
Message-ID: <CAL_JsqKVgWnLXGWxydj5HKiKeZ5Vf7HAgyr8+PkvrviUAwNW8w@mail.gmail.com>
References: <1547744074-28308-1-git-send-email-lollivier@baylibre.com>
 <1547744074-28308-3-git-send-email-lollivier@baylibre.com>
 <20190121171019.GA2903@bogus> <86imyhapl9.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <86imyhapl9.fsf@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Loys Ollivier <lollivier@baylibre.com>
Cc: devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 21, 2019 at 11:29 AM Loys Ollivier <lollivier@baylibre.com> wrote:
>
>
> On Mon 21 Jan 2019 at 17:10, Rob Herring wrote:
>
> > On Thu, 17 Jan 2019 17:54:32 +0100, Loys Ollivier wrote:
> >> Add binding for Mediatek-based GNSS receivers.
> >>
> >> Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
> >> ---
> >>
> >> v2:
> >> Renamed bindings from Globaltop/gtop to Mediatek/mtk.
> >> Moved current-speed as an optional propertie.
> >> Removed the status line in the example.
> >> Added "mediatek,mt3339" compatible.
> >>
> >>  .../devicetree/bindings/gnss/mediatek.txt          | 39
> >>  ++++++++++++++++++++++
> >>  1 file changed, 39 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/gnss/mediatek.txt
> >>
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
>
> Thanks Rob,
> If there are no objections by others, I'll stop sending these two patch
> (1/4 and 2/4) and reference any new patch serie for 3 and 4 as depending
> on those two.

Generally, you should just resend the whole series unless the
maintainer has applied some of the patches. I could apply this but
usually the whole series goes in together.

Rob
