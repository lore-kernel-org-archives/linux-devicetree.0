From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 2/2] edac: add support for Amazon's Annapurna Labs EDAC
Date: Thu, 6 Jun 2019 13:22:17 +0200
Message-ID: <20190606112217.GE26146@zn.tnic>
References: <1559211329-13098-1-git-send-email-hhhawa@amazon.com>
 <1559211329-13098-3-git-send-email-hhhawa@amazon.com>
 <DB09EE2A-7397-4063-B925-66658D0105A5@alien8.de>
 <bfbc12fb68eea9d8d4cc257c213393fd4e92c33a.camel@amazon.com>
 <20190531051400.GA2275@cz.tnic>
 <ce01a2bc-7973-5978-b033-a6bdc61b9d4b@amazon.com>
 <32431fa2-2285-6c41-ce32-09630205bb54@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <32431fa2-2285-6c41-ce32-09630205bb54@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Morse <james.morse@arm.com>
Cc: "Hawa, Hanna" <hhhawa@amazon.com>, "Herrenschmidt, Benjamin" <benh@amazon.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "Woodhouse, David" <dwmw@amazon.co.uk>, "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "davem@davemloft.net" <davem@davemloft.net>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Shenhar, Talel" <talel@amazon.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Chocron, Jonathan" <jonnyc@amazon.com>, "Krupnik, Ronen" <ronenk@amazon.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>Han
List-Id: devicetree@vger.kernel.org

On Thu, Jun 06, 2019 at 11:33:30AM +0100, James Morse wrote:
> All these are integration choices between the two IP blocks, done as separate drivers we
> don't have anywhere to store that information. Even if you don't care about this, making
> them separate drivers should only be done to make them usable on other platforms,

... that we can do with a separately integratable object like
fsl_ddr_edac.c does it, for example, where it is shared between
two different platform drivers.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
