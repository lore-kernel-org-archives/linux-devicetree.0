From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH V6 1/2] dt-bindings: mailbox: add binding doc for the ARM
 SMC/HVC mailbox
Date: Wed, 18 Sep 2019 10:31:57 -0500
Message-ID: <CABb+yY3gJpK5ghS1u-e=f-msO+=oVvX=zDNj3Jg2i0-uJHrLiA@mail.gmail.com>
References: <1568626884-5189-1-git-send-email-peng.fan@nxp.com>
 <1568626884-5189-2-git-send-email-peng.fan@nxp.com> <20190917183115.3e40180f@donnerap.cambridge.arm.com>
 <CABb+yY2CP1i9fZMoPua=-mLCUpYrcO28xF5UXDeRD2XTYe7mEg@mail.gmail.com>
 <20190918104347.285bd7ad@donnerap.cambridge.arm.com> <CABb+yY3drgYHk2_SZMgGhgSisB7wMVKFSx8VVabCcXkGByvgwg@mail.gmail.com>
 <20190918154654.6fb7e7f5@donnerap.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190918154654.6fb7e7f5@donnerap.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andre Przywara <andre.przywara@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 18, 2019 at 9:46 AM Andre Przywara <andre.przywara@arm.com> wro=
te:
>
> On Wed, 18 Sep 2019 09:19:46 -0500
> Jassi Brar <jassisinghbrar@gmail.com> wrote:
>
> Hi,
>
> > On Wed, Sep 18, 2019 at 4:44 AM Andre Przywara <andre.przywara@arm.com>=
 wrote:
> >
> > >
> > > > which needs 9 arguments to work. The fact that the fist argument is
> > > > always going to be same on a platform is just the way we use this
> > > > instruction.
> > > >
> > > > > We should be as strict as possible to avoid any security issues.
> > > > >
> > > > Any example of such a security issue?
> > >
> > > Someone finds a way to trick some mailbox client to send a crafted me=
ssage to the mailbox.
> > >
> > What if someone finds a way to trick the block layer to erase 'sda' ?
>
> Yes, the Linux block driver control the whole block device, it can do wha=
tever it wants.
>
Sorry, it doesn't make any sense.

> >  That is called "bug in the code".
> > It does happen in every subsystem but we don't stop implementing new
> > features .... we write flexible code and then fix any bug.
> >
> >
> > > Do you have any example of a use case where the mailbox client needs =
to provide the function ID?
> > >
> > FSL_SIP_SCMI_1/2 ?
>
> Huh? Where does the SCPI or SCMI driver provide this? Those clients don't=
 even provide any arguments. Adding some would defeat the whole point of ha=
ving this mailbox in the first place, which was to provide a drop-in replac=
ement for a hardware mailbox device used on other platforms.
>
SCPI/SCMI implementation is broken. I did NAK it.
With the 'smc' mailbox you may get away without have to program the
channel before transmit, but not every controller is natively so.

> > But that is not the main point, which is to be consistent (not
> > ignoring first argument because someone may find a bug to exploit) and
> > flexible.
>
> Please read the SMCCC[1]: The first argument is in r1/w1/x1. r0/w0 is the=
 function ID, and this is a specific value (fixed by the firmware implement=
ation, see Peng's ATF patch) and not up to be guessed by a client.
>
The first argument of smc call is the function-id
  arm_smccc_hvc(function_id, arg0, arg1, arg2, arg3, arg4, arg5, 0, &res);


>
> That's why I think the function ID (which is part of the SMCCC protocol, =
not of the mailbox service!) should just be set in the controller DT node a=
nd nowhere else.
>
Actually that is the very reason func-id should be a client thing and
passed via client's DT node :)
It is general understanding that protocol specific bits should not be
a part of controller driver, but the client(protocol) driver.

Page-7 Function-ID specifies :-
1) The service to be invoked.
2) The function to be invoked.
3) The calling convention (32-bit or 64-bit) that is in use.
4) The call type (fast or yielding) that is in use.

Even if we turn blind to 2,3 & 4, but (1) shouts like a runtime property.

Thanks.
