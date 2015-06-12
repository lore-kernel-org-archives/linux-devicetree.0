From: Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCH v2] w1: masters: omap_hdq: Add support for 1-wire mode
Date: Fri, 12 Jun 2015 10:53:35 +0530
Message-ID: <557A6CD7.7060404@ti.com>
References: <1431950959-19606-1-git-send-email-vigneshr@ti.com> <5562AFDB.1080701@ti.com> <1072261434036874@web13o.yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1072261434036874@web13o.yandex.ru>
Sender: linux-doc-owner@vger.kernel.org
To: Evgeniy Polyakov <zbr@ioremap.net>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Tony Lindgren <tony@atomide.com>, NeilBrown <neilb@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Fabian Frederick <fabf@skynet.be>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thursday 11 June 2015 09:04 PM, Evgeniy Polyakov wrote:
> Hi
> 
> 25.05.2015, 08:15, "Vignesh R" <vigneshr@ti.com>:
>>>  HDQ mode remains unchanged.
>>>
>>>  Signed-off-by: Vignesh R <vigneshr@ti.com>
> 
> I have no experience with omap_hdq platform, but there are quite a few questions
> related to IO - you never check whether write was successful or read returned actually
> valid data, is it ok? I mean is it correct to assume that read can not return 0xff for example
> and it is a sign that something is wrong, or this can not happen?
> 

Referring to AM437x TRM SPRUHL7C
(www.ti.com/lit/ug/spruhl7c/spruhl7c.pdf) section 23.3.5.4, Successful
or failed completion is not indicated for write operation, so there is
no way to verify whether write succeeded (though TX_COMPLETE interrupt
bit is set on transaction completion). But, as for as read operation is
concerned, the TRM says, if RX_COMPLETE bit is set, then read is
successful and I think that implies valid data is present in RX reg. My
patch does look for TX/RX_COMPLETE bits to be set after write/read
operations.

> As for me, I have no objection, but this patch must go via omap tree imo.
> 

Andrew Morton has already picked this patch (its on linux-next).
Although he has a minor comment on use of mutex_lock_interruptible. But
that comment applies to many places in the existing driver code. I plan
to cleanup all those mutex calls in near future.

Regards
Vignesh
