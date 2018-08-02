From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH] ARC: AXS10x/HSDK: Allow U-Boot to pass MAC-address to
 the kernel
Date: Thu, 2 Aug 2018 21:58:02 +0000
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075012B089D74@us01wembx1.internal.synopsys.com>
References: <20180802101937.6202-1-abrodkin@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 08/02/2018 03:19 AM, Alexey Brodkin wrote:=0A=
> Otherwise kernel uses random MAC which is not very conveniet.=0A=
=0A=
Curious what exactly is the issue - why does the user care what MAC is assi=
gned ?=0A=
=0A=
> With that change in place use might set desired MAC in U-Boot=0A=
> with "setenv ethaddr 11:22:33:44:55:66", save environment and=0A=
> then from boot to boot the same MAC will be used by the kernel.=0A=
>=0A=
=0A=
And what if one is running without uboot - it will resort to all zeros vs. =
random=0A=
yet working MAC ?=0A=
=0A=
=0A=
