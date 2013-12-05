From: Daniel Tang <dt.tangr@gmail.com>
Subject: Re: [PATCH 1/2] usb: chipidea: fix mistake in device tree binding of nspire-usb to use vendor name 'lsi' instead of SoC name 'zevio'
Date: Thu, 5 Dec 2013 16:45:03 +1100
Message-ID: <ABF0DEB7-5FAD-417D-80EA-BF1A52C3612A@gmail.com>
References: <1386148808-15065-1-git-send-email-dt.tangr@gmail.com> <20131204121849.GM16025@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20131204121849.GM16025@e106331-lin.cambridge.arm.com>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 04/12/2013, at 11:18 PM, Mark Rutland <mark.rutland@arm.com> wrote:

>> 
>> 
>> Required properties:
>> -- compatible: Should be "zevio,nspire-usb"
>> +- compatible: Should be "lsi,nspire-usb"
> 
> Surely this should be lsi,zevio-usb, matching the lsi,zevio-timer
> binding?

You're right. I'll fix up the patch and send it back in.

> 
> Thanks,
> Mark.

Cheers,
Daniel Tang
