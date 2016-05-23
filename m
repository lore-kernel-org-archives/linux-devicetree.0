From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] uio: introduce devicetree bindings for
 uio_dmem_genirq
Date: Mon, 23 May 2016 15:36:22 -0500
Message-ID: <20160523203622.GA11818@rob-hp-laptop>
References: <1463476940-26791-1-git-send-email-viktorin@rehivetech.com>
 <1463476940-26791-4-git-send-email-viktorin@rehivetech.com>
 <20160518170105.GA4897@rob-hp-laptop>
 <20160519104556.739c3f68@pcviktorin.fit.vutbr.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160519104556.739c3f68@pcviktorin.fit.vutbr.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Viktorin <viktorin@rehivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "Hans J. Koch" <hjk@hansjkoch.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 19, 2016 at 10:45:56AM +0200, Jan Viktorin wrote:
> Hello Rob,
> 
> thank you for your opinion...
> 
> On Wed, 18 May 2016 12:01:05 -0500
> Rob Herring <robh@kernel.org> wrote:
> 
> > On Tue, May 17, 2016 at 11:22:19AM +0200, Jan Viktorin wrote:
> > > Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
> > > ---
> > >  .../devicetree/bindings/uio/uio_dmem_genirq.txt          | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/uio/uio_dmem_genirq.txt  
> > 
> > DT describes h/w. UIO is not a h/w block, so this does not belong in DT. 
> > A UIO vs. kernel driver is purely a kernel decision which shouldn't 
> > require a DT change.
> 
> I mostly agree and I don't say this is the very best solution... however,
> it is quite a straightforward one.
> 
> > 
> > The properties should be part of match data for a compatible string that 
> 
> True. But in case of probing from DT, where can I obtain those match data
> from? I have to patch the kernel... and that is what I tried to avoid.

spi-dev is a similar situation and we put compatible strings (and 
therefore potentially match data) in the kernel.

> With this patch set, you only modify your current device-tree (extend the
> appropriate devices by "uio,...") and reboot with this new one.

Generally speaking changing your kernel is as easy or easier than 
changing the DT.

Rebooting is not a very good choice either when it could easily be a 
module unload/reload instead.

> > needs them set. Or if they can be defined in a way that is actually a 
> > property of the h/w, then it would be acceptible. You'd still need to 
> > define compatible strings that the properties apply to.
> 
> If you look at uio_pdrv_genirq you can see that it has already been extended by
> the module param "of_id". I.e. it is possible to specify the compatible property
> it would match when doing insmod. So, it is possible to bind it to any platform
> device described by the device tree. And thus, there is no way how to define a
> list of compatible strings for it... (quite a long list, isn't it?)
> 
> The same (of_id) can be done for uio_dmem_genirq, however, there is no way how to
> specify the amount of dynamic memory to be used for a specific device. For me, it
> makes sense to use DT to obtain those two properties saying "those devices would
> use this amount of memory and not more".
> 
> Perhaps, another module param is a way to go here. Something like of_dmem_count=2,
> of_dmem_sizes=32k. Less flexible solution, however, if it is acceptable I'll rewrite
> the current one.

No issue with doing that, though they are not OF parameters at that 
point.

Rob
