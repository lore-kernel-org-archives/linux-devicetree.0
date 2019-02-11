From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH v3 2/6] usb:common Separated decoding functions from dwc3
 driver.
Date: Mon, 11 Feb 2019 13:30:41 +0000
Message-ID: <BYAPR07MB4709469C2D0EBC2D3D7DDF1ADD640@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1548935553-452-1-git-send-email-pawell@cadence.com>
 <1548935553-452-3-git-send-email-pawell@cadence.com>
 <20190204114502.GA28608@kroah.com> <87y36vmyeb.fsf@linux.intel.com>
 <BYAPR07MB4709A40204EF528F8A04E1EDDD640@BYAPR07MB4709.namprd07.prod.outlook.com>
 <87sgwu5unv.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87sgwu5unv.fsf@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

>
>Pawel Laszczak <pawell@cadence.com> writes:
>>>>> +/**
>>>>> + * usb_decode_ctrl - Returns human readable representation of contro=
l request.
>>>>> + * @str: buffer to return a human-readable representation of control=
 request.
>>>>> + *       This buffer should have about 200 bytes.
>>>>
>>>> "about 200 bytes" is not very specific.
>>>>
>>>> Pass in the length so we know we don't overflow it.
>>>
>>>agree.
>> I also agree and I will add such parameter.
>
>https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git/commit/?h=3D=
next&id=3D7790b3556fccc555ae422f1576e97bf34c8ab8b6

Cool :). Thanks.=20

--
Pawel
