From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: Add YAML schemas for the
 generic RC bindings
Date: Tue, 20 Aug 2019 10:52:29 -0500
Message-ID: <CAL_JsqJaH5wWCHScNZwN4jxqY5Q_UDZLnq+fghecBgYY752Lnw@mail.gmail.com>
References: <20190819182619.29065-1-mripard@kernel.org>
 <20190820081525.celdosrgcvwoq6e7@gofer.mess.org>
 <20190820095028.l74sfvipwjjla6kq@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190820095028.l74sfvipwjjla6kq@flea>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <mripard@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Sean Young <sean@mess.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Linux Media Mailing List <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 20, 2019 at 4:50 AM Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi Sean,
>
> On Tue, Aug 20, 2019 at 09:15:26AM +0100, Sean Young wrote:
> > On Mon, Aug 19, 2019 at 08:26:18PM +0200, Maxime Ripard wrote:
> > > From: Maxime Ripard <maxime.ripard@bootlin.com>
> > >
> > > The RC controllers have a bunch of generic properties that are needed in a
> > > device tree. Add a YAML schemas for those.
> > >
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> >
> > For the series (both 1/2 and 2.2):
> >
> > Reviewed-by: Sean Young <sean@mess.org>
> >
> > How's tree should this go through?
>
> Either yours or Rob's, I guess?

Sean's because there are other changes to
Documentation/devicetree/bindings/media/sunxi-ir.txt in -next.

Rob
