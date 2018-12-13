From: Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH v1 2/2] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Thu, 13 Dec 2018 01:21:29 +0000
Message-ID: <VI1PR04MB53277D6C8BAFD2ABCD76DB9D8BA00@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <1544445555-17325-1-git-send-email-pawell@cadence.com>
 <1544445555-17325-3-git-send-email-pawell@cadence.com>
 <87h8fkmfar.fsf@linux.intel.com>
 <BYAPR07MB47095110AF28CC11B4C9E144DDA60@BYAPR07MB4709.namprd07.prod.outlook.com>
 <CAL411-ryK2LLZVg5_sLkCYOuhwdHLVm5XavSyC9nbEXZah_43w@mail.gmail.com>
 <20181212155313.GA6502@uda0271908>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181212155313.GA6502@uda0271908>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bin Liu <b-liu@ti.com>, Peter Chen <hzpeterchen@gmail.com>
Cc: "pawell@cadence.com" <pawell@cadence.com>, "balbi@kernel.org" <balbi@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, lkml <linux-kernel@vger.kernel.org>, "adouglas@cadence.com" <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, "sureshp@cadence.com" <sureshp@cadence.com>, "pjez@cadence.com" <pjez@cadence.com>, "kurahul@cadence.com" <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

=20
> >
> > Felipe, I use Dynamic Debug for debugging, and show debug messages
> > with "dmesg" after testing/debugging. I see dwc3 using trace,  any
> > benefits for switching to trace?
>=20
> The benefits I see are
>=20

Thanks, bin.

> - *by default*, the debug log doesn't have to go through uart console,
>   which is slow.
>=20
>   I typically 'cat trace_pipe' from a telnet which is much faster then
>   uart. But Dynamic Debug log by default got printed on uart, I have to
>   set printk level to not print them, which is an extra step.
>=20

It depends on the rootfs's setting. By default, the debug message level sho=
uld be off (
console level =3D 7)

> - tracepoint uses one place to decode the message vs DD has to repeat
>   the similar print statement in the code; and tracepoint decodes it
>   offline which reduce the kernel runtime overhead too.
>=20

offline? You mean when you run "cat trace_pipe"?

> - with tracepoint, it is easier to turn on debug for a specific group of
>   messages.
>=20

The DD can, but we don't do it often.

https://www.kernel.org/doc/html/latest/admin-guide/dynamic-debug-howto.html=
?highlight=3Ddynamic%20debug

> - you can adjust the ftrace buffer size at runtime. can we do that for
>   printk? I don't remember.

It may can't. The log buf can only be changed by bootargs: log_buf_len

Peter
