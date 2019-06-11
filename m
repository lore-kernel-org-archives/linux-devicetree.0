From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 2/2] edac: add support for Amazon's Annapurna Labs EDAC
Date: Tue, 11 Jun 2019 13:59:00 +0200
Message-ID: <20190611115900.GE31772@zn.tnic>
References: <1559211329-13098-3-git-send-email-hhhawa@amazon.com>
 <DB09EE2A-7397-4063-B925-66658D0105A5@alien8.de>
 <bfbc12fb68eea9d8d4cc257c213393fd4e92c33a.camel@amazon.com>
 <20190531051400.GA2275@cz.tnic>
 <ce01a2bc-7973-5978-b033-a6bdc61b9d4b@amazon.com>
 <32431fa2-2285-6c41-ce32-09630205bb54@arm.com>
 <9a2aaf4a9545ed30568a0613e64bc3f57f047799.camel@kernel.crashing.org>
 <20190608090556.GA32464@zn.tnic>
 <1ae5e7a3464f9d8e16b112cd371957ea20472864.camel@kernel.crashing.org>
 <07977a4a-0927-3427-e102-5a850b2f6dce@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <07977a4a-0927-3427-e102-5a850b2f6dce@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Hawa, Hanna" <hhhawa@amazon.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, James Morse <james.morse@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "Woodhouse, David" <dwmw@amazon.co.uk>, "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "davem@davemloft.net" <davem@davemloft.net>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Shenhar, Talel" <talel@amazon.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Chocron, Jonathan" <jonnyc@amazon.com>, "Krupnik, Ronen" <ronenk@amazon.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 11, 2019 at 10:29:55AM +0300, Hawa, Hanna wrote:
> In the near future we plan to push EDAC drivers for L1/L2 and memory
> controller. There's no common resources/shared data between them.

Ok, you should be safe then. If you need to do more involved interaction
in the future, you know what the issues are.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
