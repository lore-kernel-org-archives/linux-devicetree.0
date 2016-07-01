From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 02/21] usb: ulpi: Support device discovery via DT
Date: Thu, 30 Jun 2016 19:59:15 -0500
Message-ID: <20160701005817.GA31363@rob-hp-laptop>
References: <20160626072838.28082-1-stephen.boyd@linaro.org>
 <20160626072838.28082-3-stephen.boyd@linaro.org>
 <20160628205642.GP3737@rob-hp-laptop>
 <146715176149.31418.10938517376423447782@sboyd-linaro>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <146715176149.31418.10938517376423447782@sboyd-linaro>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <stephen.boyd@linaro.org>
Cc: Felipe Balbi <balbi@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <narmstrong@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Gross <andy.gross@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 28, 2016 at 03:09:21PM -0700, Stephen Boyd wrote:
> Quoting Rob Herring (2016-06-28 13:56:42)
> > On Sun, Jun 26, 2016 at 12:28:19AM -0700, Stephen Boyd wrote:
> > > The qcom HSIC ulpi phy doesn't have any bits set in the vendor or
> > > product id ulpi registers. This makes it impossible to make a
> > > ulpi driver match against the id registers. Add support to
> > > discover the ulpi phys via DT to help alleviate this problem.
> > > We'll look for a ulpi bus node underneath the device registering
> > > the ulpi viewport (or the parent of that device to support
> > > chipidea's device layout) and then match up the phy node
> > > underneath that with the ulpi device that's created.
> > > 
> > > The side benefit of this is that we can use standard DT
> > > properties in the phy node like clks, regulators, gpios, etc.
> > > because we don't have firmware like ACPI to turn these things on
> > > for us. And we can use the DT phy binding to point our phy
> > > consumer to the phy provider.
> > > 
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > Cc: <devicetree@vger.kernel.org>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
> > > ---
> > >  Documentation/devicetree/bindings/usb/ulpi.txt | 20 +++++++++
> > >  drivers/usb/common/ulpi.c                      | 56 +++++++++++++++++++++++++-
> > >  2 files changed, 74 insertions(+), 2 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/usb/ulpi.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/usb/ulpi.txt b/Documentation/devicetree/bindings/usb/ulpi.txt
> > > new file mode 100644
> > > index 000000000000..ca179dc4bd50
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/usb/ulpi.txt
> > > @@ -0,0 +1,20 @@
> > > +ULPI bus binding
> > > +----------------
> > > +
> > > +Phys that are behind a ULPI connection can be described with the following
> > > +binding. The host controller shall have a "ulpi" named node as a child, and
> > > +that node shall have one enabled node underneath it representing the ulpi
> > > +device on the bus.
> > 
> > This needs to co-exist with the USB bus binding which has the controller 
> > ports for the child nodes. Maybe use the phy binding?
> 
> Which binding is that? bindings/usb/usb-device.txt? 

Yes.

> This ulpi binding is
> to describe phys that are accessed through the ulpi "viewport" in the
> usb controller. So controller ports don't come into the picture here.

You just need to confirm that there's no collision with child nodes like 
it assumes all children are ports.

Rob
