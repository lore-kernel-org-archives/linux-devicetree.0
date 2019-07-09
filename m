From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] dt-bindings: arm: Convert RDA Micro board/soc bindings
 to json-schema
Date: Wed, 10 Jul 2019 00:14:59 +0530
Message-ID: <20190709184459.GA11886@Mani-XPS-13-9360>
References: <20190618212229.32302-4-robh@kernel.org>
 <20190709171508.GA10127@Mani-XPS-13-9360>
 <CAL_Jsq+S9FEVq_ikLF2vWS3VkrGueFa8nPnbHhAjThemP+eajA@mail.gmail.com>
 <CAL_Jsq+=rAafEFq+3pUc3A35aLzf9gtgGzj1aheHzoQ+MSiO1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+=rAafEFq+3pUc3A35aLzf9gtgGzj1aheHzoQ+MSiO1Q@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 09, 2019 at 12:41:19PM -0600, Rob Herring wrote:
> On Tue, Jul 9, 2019 at 12:29 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Tue, Jul 9, 2019 at 11:15 AM Manivannan Sadhasivam
> > <manivannan.sadhasivam@linaro.org> wrote:
> > >
> > > Hi Rob,
> > >
> > > On Tue, Jun 18, 2019 at 03:22:28PM -0600, Rob Herring wrote:
> > > > Convert RDA Micro SoC bindings to DT schema format using json-schem=
a.
> > > >
> > > > Cc: "Andreas F=E4rber" <afaerber@suse.de>
> > > > Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > > ---
> > > > Andreas, Update the license on this one too to dual licensed if you
> > > > want.
> > >
> > > I'm fine with GPL-2.0. Since there isn't any other RDA specific patch=
es
> > > in my tree, you want to take this patch? Else I have to send the Pull
> > > Request to ARM SoC folks with this patch alone.
> >
> > Okay, I can take it. The preference is actually dual licensed which is
> > why I asked, but that can be done later.
> =

> And is that an ack from you?

Yes, here is the formal tag:

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Also, Andreas asked to switch to Dual license for Actions platform since he
is the maintainer of it. But for RDA he is not, so I don't think there will
be a concern here (I'm fine with GPL-2.0).

Thanks,
Mani
> =

> Rob
