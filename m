From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 15/17 v1] ARM: ixp4xx: Add DT bindings
Date: Fri, 8 Feb 2019 20:37:43 +0100
Message-ID: <CACRpkdb1oBuVueAi=kYd4Rn05H54m7OcisSFxACAzYeYtYefbg@mail.gmail.com>
References: <20190203214205.13594-1-linus.walleij@linaro.org>
 <20190203214205.13594-16-linus.walleij@linaro.org>
 <CAL_JsqKEWtDN0VYwZaJqajcvomptbML_rQeBavh_kCYeVFZSPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqKEWtDN0VYwZaJqajcvomptbML_rQeBavh_kCYeVFZSPQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Tim Harvey <tharvey@gateworks.com>, Krzysztof Halasa <khalasa@piap.pl>, Olof Johansson <olof@lixom.net>, Imre Kaloz <kaloz@openwrt.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 4, 2019 at 4:16 PM Rob Herring <robh@kernel.org> wrote:
> On Sun, Feb 3, 2019 at 3:42 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > This adds initial device tree bindings for the IXP4xx machines.
> > This time I tried something wild and crazy and try to make proper
> > JSON-style YAML bindings for the top level.
> >
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > I have no clear idea on how to auto-test this schema for validity,
> > since it is a bit of a new thing I hope to figure it out as
> > we go.
>
> Is Documentation/devicetree/writing-schema.md missing something on how to?

Yay! Now I finally got around to testing this, and it really works smooth!

I already had it help me find issues with my device trees and all.
This is really paying off from day one, a bit of threshold but it
delivers.

Yours,
Linus Walleij
