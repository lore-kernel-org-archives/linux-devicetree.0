From: Stephen Boyd <stephen.boyd@linaro.org>
Subject: Re: [PATCH v2 03/22] usb: ulpi: Support device discovery via device
 properties
Date: Fri, 05 Aug 2016 14:40:00 -0700
Message-ID: <147043320014.26915.7483025835695600714@sboyd-linaro>
References: <20160707222114.1673-1-stephen.boyd@linaro.org>
 <20160707222114.1673-4-stephen.boyd@linaro.org>
 <20160718022355.GA8568@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160718022355.GA8568@rob-hp-laptop>
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
Cc: Felipe Balbi <balbi@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <narmstrong@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Gross <andy.gross@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Rob Herring (2016-07-17 19:23:55)
> On Thu, Jul 07, 2016 at 03:20:54PM -0700, Stephen Boyd wrote:
> > +-------
> > +
> > +usb {
> > +     compatible = "vendor,usb-controller";
> > +
> > +     ulpi {
> > +             phy {
> > +                     compatible = "vendor,phy";
> > +                     ulpi-vendor = /bits/ 16 <0x1d6b>;
> > +                     ulpi-product = /bits/ 16 <0x0002>;
> > +             };
> > +     };
> 
> I'm still having concerns about describing both phys and devices. If I 
> have a controller with 2 ports and 2 devices attached, I'd have 
> something like this under the USB controller:
> 
> ulpi {
>         phy@1 {
>         };
>         phy@2 {
>         };
> };

My understanding is there would only be one status="ok" node on the ULPI
bus for the single phy that a usb controller would have. At the least,
the kernel's ULPI layer only seems to support one ULPI phy for a
controller right now. So even if there are two ports, it doesn't mean
there are two phys.

> 
> dev@1 {
> ...
> };
> 
> dev@2 {
> ...
> };
> 
> 
> That doesn't seem the best, but I don't have a better suggestion. Maybe 
> the device nodes need to go under the phy nodes?
> 

What if we moved the dev@1 and dev@2 to another sub node like "ports" or
"usb-devices"? Legacy code can support having those devices directly
underneath the usb controller, but future users would always need to put
them in a different sub-node so that we can easily differentiate the
different busses that a usb controller node may support?

I'm not sure I see any need to relate the phy to the ports that are on
the controller, but if that is needed then perhaps you're right and we
should move the ports underneath the phy. USB core could be modified to
go through the legacy path or through the phy, if it even exists, to
find ports.

Do we typically do this for other phy designs like sata or pci? The phy
always seemed like a parallel thing to the logical bus that the phy is
used for.
