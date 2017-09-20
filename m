From: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH 9/9 v2] usb: usb251xb: Use GPIO descriptor consumer
 interface
Date: Thu, 21 Sep 2017 00:29:28 +0300
Message-ID: <20170920212928.GC3547@mobilestation>
References: <20170915233113.17855-1-fancer.lancer@gmail.com>
 <20170916104220.3742-1-fancer.lancer@gmail.com>
 <20170916104220.3742-10-fancer.lancer@gmail.com>
 <20170920133735.k3yzh2m6zb5qzhn2@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170920133735.k3yzh2m6zb5qzhn2@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: richard.leitner@skidata.com, gregkh@linuxfoundation.org, mark.rutland@arm.com, Sergey.Semin@t-platforms.ru, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 20, 2017 at 03:52:57PM -0500, Rob Herring <robh@kernel.org> wrote:
> On Sat, Sep 16, 2017 at 01:42:20PM +0300, Serge Semin wrote:
> > The driver used to be developed with legacy GPIO API support. It's
> > better to use descriptor-based interface for several reasons. First
> > of all the legacy API doesn't support the ACTIVE_LOW/HIGH flag of dts
> > nodes, which is essential since different hardware may have different
> > GPIOs connectivity including the logical value inversion. Secondly,
> > by requesting the reset GPIO descriptor the driver prevent the other
> > applications from changing its value. And last but not least the
> > legacy GPIO interface should be avoided in the new code due to it
> > obsolescence.
> 
> All this has nothing to do with the binding. Please make the binding 
> change separate and state why it should be optional.
> 

Ok.

> > 
> > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/usb/usb251xb.txt |  2 +-
> >  drivers/usb/misc/usb251xb.c                        | 34 +++++++++-------------
> >  2 files changed, 15 insertions(+), 21 deletions(-)
