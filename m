From: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH V6 1/2] dt-bindings: mailbox: add binding doc for the
 ARM SMC/HVC mailbox
Date: Wed, 18 Sep 2019 15:46:54 +0100
Message-ID: <20190918154654.6fb7e7f5@donnerap.cambridge.arm.com>
References: <1568626884-5189-1-git-send-email-peng.fan@nxp.com>
        <1568626884-5189-2-git-send-email-peng.fan@nxp.com>
        <20190917183115.3e40180f@donnerap.cambridge.arm.com>
        <CABb+yY2CP1i9fZMoPua=-mLCUpYrcO28xF5UXDeRD2XTYe7mEg@mail.gmail.com>
        <20190918104347.285bd7ad@donnerap.cambridge.arm.com>
        <CABb+yY3drgYHk2_SZMgGhgSisB7wMVKFSx8VVabCcXkGByvgwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABb+yY3drgYHk2_SZMgGhgSisB7wMVKFSx8VVabCcXkGByvgwg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Peng Fan <peng.fan@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, 18 Sep 2019 09:19:46 -0500
Jassi Brar <jassisinghbrar@gmail.com> wrote:

Hi,

> On Wed, Sep 18, 2019 at 4:44 AM Andre Przywara <andre.przywara@arm.com> wrote:
> 
> >  
> > > which needs 9 arguments to work. The fact that the fist argument is
> > > always going to be same on a platform is just the way we use this
> > > instruction.
> > >  
> > > > We should be as strict as possible to avoid any security issues.
> > > >  
> > > Any example of such a security issue?  
> >
> > Someone finds a way to trick some mailbox client to send a crafted message to the mailbox.
> >  
> What if someone finds a way to trick the block layer to erase 'sda' ?

Yes, the Linux block driver control the whole block device, it can do whatever it wants.
The firmware provides an interface for multiple users, and the mailbox controller just uses *one part* of it. So we should make sure that it's the right part.

>  That is called "bug in the code".
> It does happen in every subsystem but we don't stop implementing new
> features .... we write flexible code and then fix any bug.
> 
> 
> > Do you have any example of a use case where the mailbox client needs to provide the function ID?
> >  
> FSL_SIP_SCMI_1/2 ?

Huh? Where does the SCPI or SCMI driver provide this? Those clients don't even provide any arguments. Adding some would defeat the whole point of having this mailbox in the first place, which was to provide a drop-in replacement for a hardware mailbox device used on other platforms.

> But that is not the main point, which is to be consistent (not
> ignoring first argument because someone may find a bug to exploit) and
> flexible.

Please read the SMCCC[1]: The first argument is in r1/w1/x1. r0/w0 is the function ID, and this is a specific value (fixed by the firmware implementation, see Peng's ATF patch) and not up to be guessed by a client.

Please keep in mind that we should *NOT* do smc calls without following the SMCCC spec.

> > > > The firmware certainly knows the function ID it implements. The firmware controls the DT. So it is straight-forward to put the ID into the DT. The firmware could even do this at boot time, dynamically, before passing on the DT to the non-secure world (bootloader or kernel).
> > > >
> > > > What would be the use case of this functionality?
> > > >  
> > > At least for flexibility and consistency.  
> >
> > I appreciate the flexibility idea, but when creating an interface, especially a generic one to any kind of firmware, you should be as strict as possible, to avoid clashes in the future.
> >  
> I really don't see how there can be clashes with more complete and
> flexible implementation.

Platform A uses PSCI, but no other SMCCC services, so in your scenario you assign a valid function ID say from the SIP range and tell the mailbox *client* to use it. Now you want to run this client on platform B, which happens to have chosen this very function ID for the "set fire on the device" SMCCC service.
So now you would need to assign different IDs to the *client*, depending on the platform? That doesn't make sense. The solution is that you just assign the function ID to the controller, in the (platform specific) DT, so it naturally matches the platform requirements. You can even change it over time, as long as you change both the DT and firmware at the same time.
The client (SCPI, for instance) is totally ignorant about this communication detail, it just needs some mailbox to request services.

That's why I think the function ID (which is part of the SMCCC protocol, not of the mailbox service!) should just be set in the controller DT node and nowhere else.

Cheers,
Andre.

[1] http://infocenter.arm.com/help/topic/com.arm.doc.den0028b/ARM_DEN0028B_SMC_Calling_Convention.pdf
