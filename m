From: Peter Shih <pihsun@chromium.org>
Subject: Re: [RFC v2 1/6] dt-bindings: Add a binding for Mediatek SCP
Date: Wed, 16 Jan 2019 12:00:16 +0800
Message-ID: <CANdKZ0fbP1Nm3GkO1ujeuaj4zAOQCdJ3MPowDQ-fJCUZ42a3dA@mail.gmail.com>
References: <20190108052606.59426-1-pihsun@chromium.org>
 <20190108052606.59426-2-pihsun@chromium.org>
 <20190115203448.GA32546@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190115203448.GA32546@bogus>
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@chromium.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Erin Lo <erin.lo@mediatek.com>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 16, 2019 at 4:34 AM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Jan 08, 2019 at 01:26:01PM +0800, Pi-Hsun Shih wrote:
> > From: Erin Lo <erin.lo@mediatek.com>
> >
> > Add a DT binding documentation of SCP for the
> > MT8183 SoC from Mediatek.
> >
> > Signed-off-by: Erin Lo <erin.lo@mediatek.com>
> > ---
> > Changes from v1:
> >  - no change
>
> No answer to my question on v1?
>

Sorry I missed the last mail.

Yes there would be additional optional properties. For the current patch
series, the "cros-ec-rpmsg" entry would not be listed in the device tree, but
there would be a "mediatek,mt8183-rpmsg" under this node.

Would update this in v3.

> > ---
> >  .../devicetree/bindings/remoteproc/mtk,scp.txt         | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
> >
> > diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
> > new file mode 100644
> > index 00000000000000..b07e5c4ca9af1d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
> > @@ -0,0 +1,10 @@
> > +Mediatek SCP Bindings
> > +----------------------------------------
> > +
> > +This binding provides support for ARM Cortex M4 Co-processor found on some
> > +Mediatek SoCs.
> > +
> > +Required properties:
> > +- compatible         Should be "mediatek,mt8183-scp"
> > +- clocks             Clock for co-processor (See: ../clock/clock-bindings.txt)
> > +
> > --
> > 2.20.1.97.g81188d93c3-goog
> >
