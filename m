From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 26/30 v2] soc: ixp4xx: Add DT bindings for IXP4xx NPE
Date: Fri, 22 Feb 2019 11:37:35 +0100
Message-ID: <CACRpkdZ5Sm53AbWf1a3sL4bfrsgrkbxXwajO4c=ZQbH6w_BmEA@mail.gmail.com>
References: <20190221154458.23763-1-linus.walleij@linaro.org>
 <20190221154458.23763-27-linus.walleij@linaro.org>
 <CAL_JsqKxEu6AhqEXhXSMwSFcfd3oZ2pZMmT_wwZZvvX9e=jUDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqKxEu6AhqEXhXSMwSFcfd3oZ2pZMmT_wwZZvvX9e=jUDg@mail.gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 21, 2019 at 10:48 PM Rob Herring <robh@kernel.org> wrote:

> > +$id: "http://devicetree.org/schemas/firmware/intel-ixp4xx-network-processing-engine.yaml#"
>
> firmware? firmware/ is for things like psci, optee, etc. I'm not sure
> this fits as it has some sort of h/w interface. Wouldn't networking be
> a better fit?

You would think so, but the NPE, despite being named something
with "network" and primarily intended for that is also used for e.g.
crypto acceleration which is generic and can as well be used for
disk encryption. Intel names it a "hardware multi-threaded
processor engine".

Each unit has quite elaborate microcode and is clearly containing
its own CPU somekindof, it clearly has a Harvard architecture.

Yours,
Linus Walleij
