From: Alexander Holler <holler@ahsoftware.de>
Subject: Re: [RFC PATCH 0/9] dt: dependencies (for deterministic driver initialization
 order based on the DT)
Date: Wed, 14 May 2014 19:53:58 +0200
Message-ID: <5373ADB6.1070702@ahsoftware.de>
References: <1399913280-6915-1-git-send-email-holler@ahsoftware.de>	<20140514141914.446F7C4153D@trevor.secretlab.ca>	<53738580.7000902@ahsoftware.de>	<CACxGe6s4px_9CNk3bkc1OF1KGZGYdyh4gE_VufCKU5dLFBG48g@mail.gmail.com>	<53739871.9070407@ahsoftware.de> <CAL_JsqJB4CAO60m1HTGQGHQRYVWcARxm_roOhn-PJh+ZR7OONg@mail.gmail.com> <5373ABD2.9010508@ahsoftware.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5373ABD2.9010508@ahsoftware.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jon Loeliger <jdl@jdl.com>, Russell King <linux@arm.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Am 14.05.2014 19:45, schrieb Alexander Holler:

> One of the biggest problem of the deferred probe stuff is the problem
> how to identify real problems if everything ends up with a deferred
> probe when an error occurs? That means if you display an error whenever
> something is deferred, the log becomes almost unreadable. If you don't
> display an error, you never will see an error. And how do you display
> the real error when deferred probes finally do fail? The deferred probe
> stuff doesn't has any information about the underlying error, so it
> can't display it.

And that is a real problem. I've recently tried to identify why a driver 
failed and it was a nightmare because nothing offered any message (debug 
or not) when a probe was deferred. So I had to insert tons of printks to 
walk upwards to find the finally place where the probe failed. 
Everything afterwards just has forwarded the -EPROBE_DEFER without 
printing any message.

Regards,

Alexander Holler
