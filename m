From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH linux v1 0/4] Seven segment display support
Date: Wed, 14 Dec 2016 04:56:41 -0800
Message-ID: <20161214125641.GA5379@kroah.com>
References: <1481702104-8617-1-git-send-email-jaghu@google.com>
 <20161214134530.2bd54a4e@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20161214134530.2bd54a4e@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: mark.rutland@arm.com, Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>, arnd@arndb.de, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, robh+dt@kernel.org, joel@jms.id.au, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 14, 2016 at 01:45:30PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 13 Dec 2016 23:55:00 -0800, Jaghathiswari Rankappagounder
> Natarajan wrote:
> 
> > Documentation for the binding which provides an interface for adding clock,
> > data and clear signal GPIO lines to control seven segment display.
> > 
> > The platform device driver provides an API for displaying on two 7-segment
> > displays, and implements the required bit-banging. The hardware assumed is
> > 74HC164 wired to two 7-segment displays.
> > 
> > The character device driver implements the user-space API for letting a user
> > write to two 7-segment displays including any conversion methods necessary
> > to map the user input to two 7-segment displays.
> > 
> > Adding clock, data and clear signal GPIO lines in the devicetree to control
> > seven segment display on zaius platform.
> > 
> > The platform driver matches on the device tree node; the platform driver also
> > initializes the character device.
> > 
> > Tested that the seven segment display works properly by writing to the
> > character device file on a EVB AST2500 board which also has 74HC164 wired
> > to two 7-segment displays.
> 
> FWIW, I proposed a driver for seven segment displays back in 2013:
> 
>    http://lists.infradead.org/pipermail/linux-arm-kernel/2013-January/139986.html
> 
> And the feedback from Greg KH was: we don't need a driver for that, do
> it from userspace. See:
> 
>    http://lists.infradead.org/pipermail/linux-arm-kernel/2013-January/139992.html
> 
> So: good luck :-)

Did anyone ever write a library for this type of thing?

Again, I don't want to see one-off drivers for random devices like this
that should be able to all be controlled from userspace in a common
manner.  Much like we did for fingerprint readers a long long time
ago...

thanks,

greg k-h
