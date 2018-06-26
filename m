From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/5] RFC: Mezzanine handling for 96boards
Date: Tue, 26 Jun 2018 11:03:22 +0200
Message-ID: <CACRpkdbEqcdHeLMbM-3eMv-cRUo=17DaqwWMm2HX0vENt3Ku6w@mail.gmail.com>
References: <20180618074556.6944-1-linus.walleij@linaro.org>
 <CAL_JsqK2DKPbaFvUPSU2E7oh1_pryrRXPMg8OASmK722jmznwA@mail.gmail.com>
 <174ecf08-7665-8183-07b4-790bdfcf5662@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <174ecf08-7665-8183-07b4-790bdfcf5662@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Michal Simek <michal.simek@xilinx.com>, dev <dev@lists.96boards.org>, Rob Herring <robh+dt@kernel.org>, John Stultz <john.stultz@linaro.org>, Andy Shevchenko <andy@infradead.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 21, 2018 at 3:02 PM Frank Rowand <frowand.list@gmail.com> wrote:

> Agreeing with Rob (despite my other reply asking why the current
> devicetree mechanisms can't be used)

I think I answer also your comments in my reply to Rob,
please check!

> that we do have a desire to
> have the ability to create bindings for connectors - this has been
> discussed before.

Let's create bindings for connectors.

But I have this caveat: let's create a binding for connectors
that does not stipulate that its children must be populated
using overlays, but could optionally be bound to driver that
populate the children any way the OS want to do this.

Yours,
Linus Walleij
