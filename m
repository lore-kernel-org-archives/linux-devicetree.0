From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC v2 03/17] dt-bindings: timer: Document Owl timer
Date: Mon, 27 Feb 2017 18:15:47 -0600
Message-ID: <20170228001547.gzu2fzlx63dqesrg@rob-hp-laptop>
References: <20170224034055.18807-1-afaerber@suse.de>
 <20170224034055.18807-4-afaerber@suse.de>
 <0c3f94c0-b920-25f9-7347-b43407d66dfa@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <0c3f94c0-b920-25f9-7347-b43407d66dfa@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: Mark Rutland <mark.rutland@arm.com>, support@lemaker.org, devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, arm@kernel.org, mp-cs@actions-semi.com, 96boards@ucrobotics.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 27, 2017 at 03:40:07PM +0100, Andreas F=E4rber wrote:
> Am 24.02.2017 um 04:40 schrieb Andreas F=E4rber:
> > The Actions Semi S500 SoC contains a timer block with two timers.
> > =

> > Signed-off-by: Andreas F=E4rber <afaerber@suse.de>
> > ---
> >  v2: new
> >  =

> >  .../devicetree/bindings/timer/actions,owl-timer.txt      | 16 ++++++++=
++++++++
> >  1 file changed, 16 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/timer/actions,owl=
-timer.txt
> > =

> > diff --git a/Documentation/devicetree/bindings/timer/actions,owl-timer.=
txt b/Documentation/devicetree/bindings/timer/actions,owl-timer.txt
> > new file mode 100644
> > index 0000000..141bc7b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/timer/actions,owl-timer.txt
> > @@ -0,0 +1,16 @@
> > +Actions Semi Owl Timer
> > +
> > +Required properties:
> > +- compatible :  "actions,owl-timer"
> > +- reg        :  Offset and length of the register set for the device.
> > +- interrupts :  Should contain two timer interrupts.
> > +
> > +
> > +Example:
> > +
> > +		timer@b0168000 {
> > +			compatible =3D "actions,owl-timer";
> > +			reg =3D <0xb0168000 0x100>;
> > +			interrupts =3D <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
> > +			             <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> > +		};
> =

> I need to modify these bindings for upcoming v3 in the following ways:
> =

> * "actions,s500-timer", "actions,owl-timer" to deal with S500 vs. S900
> differences while keeping a single driver registration (or would two
> registrations be preferred, dropping the second compatible? they do
> share a common subset)

The former is fine.

> =

> * Use named interrupts to deal with 2x 2Hz + 2x Timer vs. 4x Timer for
> complete hardware description

The compatible should imply this difference.

Rob
