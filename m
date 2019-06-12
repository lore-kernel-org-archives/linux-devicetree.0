From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 2/2] edac: add support for Amazon's Annapurna Labs EDAC
Date: Wed, 12 Jun 2019 17:34:25 +0200
Message-ID: <20190612153425.GL32652@zn.tnic>
References: <20190611115651.GD31772@zn.tnic>
 <6df5a17bb1c900dc69b991171e55632f40d9426f.camel@kernel.crashing.org>
 <20190612034813.GA32652@zn.tnic>
 <08bd58dc0045670223f8d3bbc8be774505bd3ddf.camel@kernel.crashing.org>
 <20190612074242.53a4cf56@coco.lan>
 <20190612110039.GH32652@zn.tnic>
 <20190612084213.4fb9e054@coco.lan>
 <7705227ea831793cc9e45af32e0da8f5547cb14d.camel@kernel.crashing.org>
 <20190612122504.GI32652@zn.tnic>
 <6911a79a-bcd7-03e1-1c90-2adb88aaa1db@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6911a79a-bcd7-03e1-1c90-2adb88aaa1db@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Hawa, Hanna" <hhhawa@amazon.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, James Morse <james.morse@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "Woodhouse, David" <dwmw@amazon.co.uk>, "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "davem@davemloft.net" <davem@davemloft.net>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Shenhar, Talel" <talel@amazon.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Chocron, Jonathan" <jonnyc@amazon.com>, "Krupnik, Ronen" <ronenk@amazon.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 12, 2019 at 03:35:31PM +0300, Hawa, Hanna wrote:
> We have daemon script that collects correctable/uncorrectable errors from
> EDAC sysfs and reports to Amazon service that allow us to take action on
> specific error thresholds.

What does "take action" mean, more specifically? Is the script taking
action to poison/isolate memory or a guy goes down to the basement and
replaces parts? :-)

IOW, I'm interested in whether you guys need an additional recovery
action agent and if so, whether it would make sense to have something
generic in the tree, which can be shared with others...

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
