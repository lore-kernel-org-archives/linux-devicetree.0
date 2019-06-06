From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 2/2] edac: add support for Amazon's Annapurna Labs EDAC
Date: Thu, 6 Jun 2019 12:03:12 +0200
Message-ID: <20190606100312.GD26146@zn.tnic>
References: <1559211329-13098-1-git-send-email-hhhawa@amazon.com>
 <1559211329-13098-3-git-send-email-hhhawa@amazon.com>
 <DB09EE2A-7397-4063-B925-66658D0105A5@alien8.de>
 <bfbc12fb68eea9d8d4cc257c213393fd4e92c33a.camel@amazon.com>
 <20190531051400.GA2275@cz.tnic>
 <ce01a2bc-7973-5978-b033-a6bdc61b9d4b@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ce01a2bc-7973-5978-b033-a6bdc61b9d4b@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Hawa, Hanna" <hhhawa@amazon.com>
Cc: "Herrenschmidt, Benjamin" <benh@amazon.com>, "james.morse@arm.com" <james.morse@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "Woodhouse, David" <dwmw@amazon.co.uk>, "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "davem@davemloft.net" <davem@davemloft.net>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Shenhar, Talel" <talel@amazon.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Chocron, Jonathan" <jonnyc@amazon.com>, "Krupnik, Ronen" <ronenk@amazon.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 06, 2019 at 10:53:42AM +0300, Hawa, Hanna wrote:
> Disagree. The various drivers don't depend on each other.
> I think we should keep the drivers separated as they are distinct and
> independent IP blocks.

This topic comes up each time someone submits a new ARM EDAC driver:
EDAC can't support different drivers because of the limitations it has.
And a single platform driver works - see altera_edac.

Again, James has a good write up with example how this can work so be
patient.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
