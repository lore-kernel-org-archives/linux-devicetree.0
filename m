From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] ARM: dts: pxa3xx: Add Raumfeld DTS files
Date: Fri, 30 Nov 2018 08:56:24 -0600
Message-ID: <CAL_JsqKYWV4C=M7P4+1dUz497=JN4dMRnwO1zocgLhG090WCNQ@mail.gmail.com>
References: <20181105194040.25406-1-daniel@zonque.org>
 <87in14lkzp.fsf@belgarion.home> <87pnv3ihqn.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <87pnv3ihqn.fsf@belgarion.home>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>, Daniel Mack <daniel@zonque.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat, Nov 17, 2018 at 2:14 PM Robert Jarzmik <robert.jarzmik@free.fr> wrote:
>
> Robert Jarzmik <robert.jarzmik@free.fr> writes:
>
> > Daniel Mack <daniel@zonque.org> writes:
> >
> >> This patch adds a set of DTS files that support all PXA3xx based Raumfeld
> >> audio hardware devices.
> >>
> >> Common nodes are factored out into 'common' and 'tuneable-clock' include
> >> files to keep the top-level DTS files smaller.
> >>
> >> Signed-off-by: Daniel Mack <daniel@zonque.org>
> > Hi Daniel,
> >
> > I will need someone from the devicetree to ack this one, Rob or anybody
> > maintaining the devicetree.
>
> Rob, Mark, would you be so kind as to have a look at this patch, I have no
> concerns taking it into the pxa/dt tree, but I'd rather be safe with someone
> from the devicetree maintainers reviewing it first.

I happened to see this, but generally I don't have the bandwidth to
review all the dts files. The subsystem maintainers have to do this.
For starters, just make sure new dts files aren't adding new warnings
when built with W=1 or W=12. This will be easier if the base SoC dtsi
files build cleanly.

Rob
