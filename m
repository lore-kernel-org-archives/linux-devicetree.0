From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [v3 PATCH] dt-binding: usb: add usb-role-switch property
Date: Mon, 20 May 2019 10:29:49 +0800
Message-ID: <1558319389.10179.347.camel@mhfsdcap03>
References: <c3596e996c9ab39c6b9bc14b93309244c4a55014.1557306151.git.chunfeng.yun@mediatek.com>
 <20190517132721.GB1887@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190517132721.GB1887@kuha.fi.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Felipe Balbi <felipe.balbi@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Yu Chen <chenyu56@huawei.com>, linux-kernel@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Min Guo <min.guo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 2019-05-17 at 16:27 +0300, Heikki Krogerus wrote:
> On Wed, May 08, 2019 at 05:17:44PM +0800, Chunfeng Yun wrote:
> > Add a property usb-role-switch to tell the driver that use
> > USB Role Switch framework to handle the role switch,
> > it's useful when the driver has already supported other ways,
> > such as extcon framework etc.
> > 
> > Cc: Biju Das <biju.das@bp.renesas.com>
> > Cc: Yu Chen <chenyu56@huawei.com>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> 
> Who is meant to pick this? 

> Can you include this in your series where
> you introduce that USB Type-B GPIO connector driver?
> 
Ok, I'll do it if need

> FWIW:
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> > ---
> > v3:
> >     add property type, modify description suggested by Heikki
> > 
> > v2:
> >     describe it in terms of h/w functionality suggested by Rob
> > 
> > v1:
> >     the property is discussed in:
> >     [v2,2/7] dt-bindings: usb: renesas_usb3: add usb-role-switch property
> >     https://patchwork.kernel.org/patch/10852497/
> > 
> >     Mediatek and Hisilicon also try to use it:
> >     [v4,3/6] dt-bindings: usb: mtu3: add properties about USB Role Switch
> >     https://patchwork.kernel.org/patch/10918385/
> >     [v4,6/6] usb: mtu3: register a USB Role Switch for dual role mode
> >     https://patchwork.kernel.org/patch/10918367/
> > 
> >     [v6,10/13] usb: dwc3: Registering a role switch in the DRD code
> >     https://patchwork.kernel.org/patch/10909981/
> > ---
> >  Documentation/devicetree/bindings/usb/generic.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
> > index 0a74ab8dfdc2..cf5a1ad456e6 100644
> > --- a/Documentation/devicetree/bindings/usb/generic.txt
> > +++ b/Documentation/devicetree/bindings/usb/generic.txt
> > @@ -30,6 +30,10 @@ Optional properties:
> >  			optional for OTG device.
> >   - adp-disable: tells OTG controllers we want to disable OTG ADP, ADP is
> >  			optional for OTG device.
> > + - usb-role-switch: boolean, indicates that the device is capable of assigning
> > +			the USB data role (USB host or USB device) for a given
> > +			USB connector, such as Type-C, Type-B(micro).
> > +			see connector/usb-connector.txt.
> >  
> >  This is an attribute to a USB controller such as:
> >  
> > -- 
> > 2.21.0
> 
> thanks,
> 
