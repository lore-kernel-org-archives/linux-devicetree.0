Return-Path: <SRS0=T75w=N2=synopsys.com=thinh.nguyen@kernel.org>
From: Thinh Nguyen <thinh.nguyen@synopsys.com>
Subject: Re: [PATCH v6 2/3] usb: dwc3: Add disabling of start_transfer
 failure quirk
Date: Thu, 15 Nov 2018 07:00:43 +0000
Message-ID: <30102591E157244384E984126FC3CB4F639A2915@us01wembx1.internal.synopsys.com>
References: <cover.1541707248.git.thinhn@synopsys.com>
 <ead428b935b52df74dbe386185e1b8298b0135b4.1541707248.git.thinhn@synopsys.com>
 <87va4zj38a.fsf@linux.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Felipe Balbi <balbi@kernel.org>, Thinh Nguyen <thinh.nguyen@synopsys.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: John Youn <john.youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

Hi,=0A=
=0A=
On 11/14/2018 3:41 AM, Felipe Balbi wrote:=0A=
> Thinh Nguyen <thinh.nguyen@synopsys.com> writes:=0A=
>=0A=
>> DWC_usb31 peripheral v1.70a-ea06 and prior needs a SW workaround for=0A=
>> isoc START TRANSFER command failure. However, some affected versions may=
=0A=
>> have RTL patches to fix this without a SW workaround. Add this quirk to=
=0A=
>> disable the SW workaround when it is not needed.=0A=
>>=0A=
>> Synopsys STAR 9001202023: Wrong microframe number for isochronous IN=0A=
>> endpoints.=0A=
>>=0A=
>> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>=0A=
> unfortunately, does't apply to testing/next. Could you rebase??=0A=
>=0A=
Done.=0A=
=0A=
Thanks,=0A=
Thinh=0A=
