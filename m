From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH V6 1/2] dt-bindings: mailbox: add binding doc for the ARM
 SMC/HVC mailbox
Date: Wed, 18 Sep 2019 09:19:46 -0500
Message-ID: <CABb+yY3drgYHk2_SZMgGhgSisB7wMVKFSx8VVabCcXkGByvgwg@mail.gmail.com>
References: <1568626884-5189-1-git-send-email-peng.fan@nxp.com>
 <1568626884-5189-2-git-send-email-peng.fan@nxp.com> <20190917183115.3e40180f@donnerap.cambridge.arm.com>
 <CABb+yY2CP1i9fZMoPua=-mLCUpYrcO28xF5UXDeRD2XTYe7mEg@mail.gmail.com> <20190918104347.285bd7ad@donnerap.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190918104347.285bd7ad@donnerap.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andre Przywara <andre.przywara@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 18, 2019 at 4:44 AM Andre Przywara <andre.przywara@arm.com> wro=
te:

>
> > which needs 9 arguments to work. The fact that the fist argument is
> > always going to be same on a platform is just the way we use this
> > instruction.
> >
> > > We should be as strict as possible to avoid any security issues.
> > >
> > Any example of such a security issue?
>
> Someone finds a way to trick some mailbox client to send a crafted messag=
e to the mailbox.
>
What if someone finds a way to trick the block layer to erase 'sda' ?
 That is called "bug in the code".
It does happen in every subsystem but we don't stop implementing new
features .... we write flexible code and then fix any bug.


> Do you have any example of a use case where the mailbox client needs to p=
rovide the function ID?
>
FSL_SIP_SCMI_1/2 ?
But that is not the main point, which is to be consistent (not
ignoring first argument because someone may find a bug to exploit) and
flexible.


> > > The firmware certainly knows the function ID it implements. The firmw=
are controls the DT. So it is straight-forward to put the ID into the DT. T=
he firmware could even do this at boot time, dynamically, before passing on=
 the DT to the non-secure world (bootloader or kernel).
> > >
> > > What would be the use case of this functionality?
> > >
> > At least for flexibility and consistency.
>
> I appreciate the flexibility idea, but when creating an interface, especi=
ally a generic one to any kind of firmware, you should be as strict as poss=
ible, to avoid clashes in the future.
>
I really don't see how there can be clashes with more complete and
flexible implementation.

Thanks.
