From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 03/25] dt-bindings: timer: Document Owl timer
Date: Fri, 3 Mar 2017 00:20:58 -0600
Message-ID: <20170303062058.yvekr5kawqtzxgpn@rob-hp-laptop>
References: <20170228063535.32069-1-afaerber@suse.de>
 <20170228063535.32069-4-afaerber@suse.de>
 <20170228123908.GG3691@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170228123908.GG3691@leverpostej>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: support@lemaker.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, arm@kernel.org, mp-cs@actions-semi.com, 96boards@ucrobotics.com, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 28, 2017 at 12:39:08PM +0000, Mark Rutland wrote:
> On Tue, Feb 28, 2017 at 07:35:13AM +0100, Andreas F=E4rber wrote:
> > The Actions Semi S500 SoC contains a timer block with two 2 Hz and two
> > 32-bit timers. The S900 SoC timer block has four 32-bit timers.
> > =

> > Signed-off-by: Andreas F=E4rber <afaerber@suse.de>
> > ---
> >  v2 -> v3:
> >  * Adopted interrupt-names
> >  * Changed compatible for S500
> >  * Added S900 compatible and interrupt names
> >  =

> >  v2: new
> >  =

> >  .../devicetree/bindings/timer/actions,owl-timer.txt  | 20 ++++++++++++=
++++++++
> >  1 file changed, 20 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/timer/actions,owl=
-timer.txt
> > =

> > diff --git a/Documentation/devicetree/bindings/timer/actions,owl-timer.=
txt b/Documentation/devicetree/bindings/timer/actions,owl-timer.txt
> > new file mode 100644
> > index 0000000..5b4834d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/timer/actions,owl-timer.txt
> > @@ -0,0 +1,20 @@
> > +Actions Semi Owl Timer
> > +
> > +Required properties:
> > +- compatible      :  "actions,s500-timer" for S500
> > +                     "actions,s900-timer" for S900
> > +- reg             :  Offset and length of the register set for the dev=
ice.
> > +- interrupts      :  Should contain the interrupts.
> > +- interrupt-names :  Valid names are: "2Hz0", "2Hz1",
> > +                                      "Timer0", "Timer1", "Timer2", "T=
imer3"
> =

> Sticking to lower case for the names would be preferable.

With that,

Acked-by: Rob Herring <robh@kernel.org>
