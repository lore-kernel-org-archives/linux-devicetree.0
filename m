From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 2/2] edac: add support for Amazon's Annapurna Labs EDAC
Date: Fri, 31 May 2019 07:14:00 +0200
Message-ID: <20190531051400.GA2275@cz.tnic>
References: <1559211329-13098-1-git-send-email-hhhawa@amazon.com>
 <1559211329-13098-3-git-send-email-hhhawa@amazon.com>
 <DB09EE2A-7397-4063-B925-66658D0105A5@alien8.de>
 <bfbc12fb68eea9d8d4cc257c213393fd4e92c33a.camel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bfbc12fb68eea9d8d4cc257c213393fd4e92c33a.camel@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Herrenschmidt, Benjamin" <benh@amazon.com>, "james.morse@arm.com" <james.morse@arm.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "Woodhouse, David" <dwmw@amazon.co.uk>, "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "Hawa, Hanna" <hhhawa@amazon.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "davem@davemloft.net" <davem@davemloft.net>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Shenhar, Talel" <talel@amazon.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Chocron, Jonathan" <jonnyc@amazon.com>, "Krupnik, Ronen" <ronenk@amazon.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "Hanoch, Uri" <hanochu@amazon.com>
List-Id: devicetree@vger.kernel.org

On Fri, May 31, 2019 at 01:15:33AM +0000, Herrenschmidt, Benjamin wrote:
> This isn't terribly helpful, there's nothing telling anybody which of
> those files corresponds to an ARM SoC :-)

drivers/edac/altera_edac.c is one example.

Also, James and I have a small writeup on how an arm driver should look
like, we just need to polish it up and post it.

James?

> That said ...
> 
> You really want a single EDAC driver that contains all the stuff for
> the caches, the memory controller, etc... ?

Yap.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply. Srsly.
