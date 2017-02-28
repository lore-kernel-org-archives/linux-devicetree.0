From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 01/17] dt-bindings: Add vendor prefix for Actions Semi
Date: Mon, 27 Feb 2017 18:11:14 -0600
Message-ID: <20170228001114.s4nrgjhfaxxvw76q@rob-hp-laptop>
References: <20170224034055.18807-1-afaerber@suse.de>
 <20170224034055.18807-2-afaerber@suse.de>
 <06838745-f8f2-756f-9719-2e7da8964203@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <06838745-f8f2-756f-9719-2e7da8964203@suse.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, support@lemaker.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, arm@kernel.org, mp-cs@actions-semi.com, 96boards@ucrobotics.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 27, 2017 at 03:57:19PM +0100, Andreas F=E4rber wrote:
> Am 24.02.2017 um 04:40 schrieb Andreas F=E4rber:
> > Actions Semiconductor was listed on NASDAQ as ACTS until Dec 16, 2016.
> > =

> > Cc: mp-cs@actions-semi.com
> > Signed-off-by: Andreas F=E4rber <afaerber@suse.de>
> > ---
> >  v1 -> v2:
> >  * Reverted from "acts" to "actions" (cf. IAP140 "mrvl" vs. "marvell")
> >  =

> >  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > =

> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Do=
cumentation/devicetree/bindings/vendor-prefixes.txt
> > index a76b981..64f8469 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > @@ -6,6 +6,7 @@ using them to avoid name-space collisions.
> >  abcn	Abracon Corporation
> >  abilis	Abilis Systems
> >  active-semi	Active-Semi International Inc
> > +actions	Actions Semiconductor Co., Ltd.
> =

> If the use of "actions" gets ack'ed, I realize it should move one line up.

With that fix,

Acked-by: Rob Herring <robh@kernel.org>
