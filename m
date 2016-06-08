From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 resend 1/2] ehci-platform: Add support for controllers
 with multiple reset lines
Date: Wed, 8 Jun 2016 10:34:19 -0700
Message-ID: <20160608173419.GA9200@kroah.com>
References: <1464880446-5919-1-git-send-email-hdegoede@redhat.com>
 <1464880446-5919-2-git-send-email-hdegoede@redhat.com>
 <20160608052216.GA7766@kroah.com>
 <20236f14-549e-5acc-3f95-90db44b1f49d@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20236f14-549e-5acc-3f95-90db44b1f49d@redhat.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: devicetree <devicetree@vger.kernel.org>, Reinder de Haan <patchesrdh@mveas.com>, linux-usb <linux-usb@vger.kernel.org>, Tony Prisk <linux@prisktech.co.nz>, Alan Stern <stern@rowland.harvard.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 08, 2016 at 06:52:30PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 08-06-16 07:22, Greg Kroah-Hartman wrote:
> > On Thu, Jun 02, 2016 at 05:14:05PM +0200, Hans de Goede wrote:
> > > From: Reinder de Haan <patchesrdh@mveas.com>
> > > 
> > > At least the EHCI/OHCI found on the Allwinnner H3 SoC needs multiple
> > > reset lines, the controller will not initialize while the reset for
> > > its companion is still asserted, which means we need to de-assert
> > > 2 resets for the controller to work.
> > > 
> > > Signed-off-by: Reinder de Haan <patchesrdh@mveas.com>
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > ---
> > > Changes in v2:
> > > -Use the new reset_control_[de]assert_shared reset-controller functions
> > > ---
> > >  Documentation/devicetree/bindings/usb/usb-ehci.txt |  2 +-
> > >  drivers/usb/host/ehci-platform.c                   | 41 ++++++++++++----------
> > >  2 files changed, 24 insertions(+), 19 deletions(-)
> > 
> > This patch doesn't apply to my usb-testing branch at all, what went
> > wrong?
> 
> You merged this patch:
> 
> https://git.kernel.org/cgit/linux/kernel/git/gregkh/usb.git/commit/?id=d0e08b0077f49e209bc90305ddf1ca434ac6cc0e
> 
> Which does almost the same, except that it only supports dedicated reset
> controllers and not shared reset controllers.
> 
> I'll send a new patch which changes things to add support for shared
> reset controllers.
> 
> This will also bring the ehci-platform reset handling code inline
> with ohci-platform again.

Thanks, I've merged your new patch now.

greg k-h
