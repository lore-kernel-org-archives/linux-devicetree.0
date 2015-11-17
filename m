From: Rob Herring <robh@kernel.org>
Subject: Re: [Patch v4 2/2] media: v4l: ti-vpe: Document CAL driver
Date: Tue, 17 Nov 2015 15:22:12 -0600
Message-ID: <20151117212212.GA20622@rob-hp-laptop>
References: <1447631628-9459-1-git-send-email-bparrot@ti.com>
 <1447631628-9459-3-git-send-email-bparrot@ti.com>
 <20151116152615.GA9256@rob-hp-laptop>
 <20151116225249.GQ3999@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151116225249.GQ3999@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benoit Parrot <bparrot@ti.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 16, 2015 at 04:52:49PM -0600, Benoit Parrot wrote:
> Rob Herring <robh@kernel.org> wrote on Mon [2015-Nov-16 09:26:16 -0600]:
> > On Sun, Nov 15, 2015 at 05:53:48PM -0600, Benoit Parrot wrote:
> > > Device Tree bindings for the Camera Adaptation Layer (CAL) driver
> > 
> > Bindings are for h/w blocks, not drivers...
> 
> OK I'll fix that.
> 
> > 
> > > 
> > > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > > ---
> > >  Documentation/devicetree/bindings/media/ti-cal.txt | 70 ++++++++++++++++++++++
> > >  1 file changed, 70 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/ti-cal.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/ti-cal.txt b/Documentation/devicetree/bindings/media/ti-cal.txt
> > > new file mode 100644
> > > index 000000000000..680efadb6208
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/ti-cal.txt
> > > @@ -0,0 +1,70 @@
> > > +Texas Instruments DRA72x CAMERA ADAPTATION LAYER (CAL)
> > > +------------------------------------------------------
> > > +
> > > +The Camera Adaptation Layer (CAL) is a key component for image capture
> > > +applications. The capture module provides the system interface and the
> > > +processing capability to connect CSI2 image-sensor modules to the
> > > +DRA72x device.
> > > +
> > > +Required properties:
> > > +- compatible: must be "ti,cal"
> > 
> > Needs to be more specific.
> 
> See potential patch below.

Looks fine.

> > > +
> > > +		csi2_0: port@0 {
> > 
> > Multiple ports should be under a ports node.
> 
> The video-interfaces.txt bindings doc state:
> "All 'port' nodes can be grouped under optional 'ports' node"
> Doesn't that mean that 'ports' is then optional has show in the csi2
> example provide in the same documents?

Yes, but we may want to change that or at least what is recommended. 
Often when we don't group things, and we latter decide we want to. It 
makes things easier if you have other child nodes that are not port 
nodes.

Rob
