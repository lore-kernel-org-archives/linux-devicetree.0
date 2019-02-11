From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH v3 4/6] usb:common Simplify usb_decode_get_set_descriptor
 function.
Date: Mon, 11 Feb 2019 12:21:01 +0000
Message-ID: <BYAPR07MB4709A3ACFDC56A1B7B145A68DD640@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1548935553-452-1-git-send-email-pawell@cadence.com>
 <1548935553-452-5-git-send-email-pawell@cadence.com>
 <20190204114726.GC28608@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204114726.GC28608@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

>On Thu, Jan 31, 2019 at 11:52:31AM +0000, Pawel Laszczak wrote:
>> Patch moves switch responsible for decoding descriptor type
>> outside snprintf. It's little improves code readability.
>
>Should that last sentence read: "It improves code readability a little"?
>
Yes, it should.=20
Thanks=20

Pawel
