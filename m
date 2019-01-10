From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH v2 5/5] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Thu, 10 Jan 2019 07:18:50 +0000
Message-ID: <BYAPR07MB4709A8E20953E24E67A801EADD840@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1545577992-4013-1-git-send-email-pawell@cadence.com>
 <1545577992-4013-6-git-send-email-pawell@cadence.com>
 <CAL411-oF2j1Xjz60Q3B1beBoUoFUxN+rBi9_Z0nx7R2P0p_3tg@mail.gmail.com>
 <20190110065738.GA28817@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190110065738.GA28817@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <hzpeterchen@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, lkml <linux-kernel@vger.kernel.org>, "adouglas@cadence.com" <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

Hi,=20

>On Thu, Jan 10, 2019 at 09:30:41AM +0800, Peter Chen wrote:
>> On Mon, Dec 24, 2018 at 12:44 AM Pawel Laszczak <pawell@cadence.com> wro=
te:
>> - debugfs is nice to have feature, I suggest removing it at this
>> initial version. Besides, role switch
>> through /sys is normal feature, the end user may use it at real
>> product, so, it is better at device's
>> /sys entry instead of debugfs.
>>
>> - I don't know why you add "disable" at debugfs, please comment.
>
>As you imply here, no real-world functionality should ever be in
>debugfs as it is an optional system component and kernel code should
>work just fine without it being enabled (as more and more systems are
>disabling it due to the obvious security problems it has.)
>
"disable" it's not required. It's used for testing. It allows to enable/dis=
able the current role.
It can be used for testing eg. connect/disconnect event.=20

I mainly test the driver remotely and I can't do connect/disconnect by USB =
cable.=20
"disable" allow me to get trace log from host/device without disconnecting =
cable:
I'm using the fallowing sequence:
 - load cdns3.ko modules=20
 - echo 1 > disable - disable current role
 - echo cdns3:* tracing/set_event=20
 - echo 0 > disable  - enable role again=20
 - cat tracing/trace.=20

Pawel
