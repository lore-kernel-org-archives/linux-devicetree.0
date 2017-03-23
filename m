From: Jon Mason <jon.mason@broadcom.com>
Subject: Re: [RFC 0/3] thermal: broadcom: complete and extend to NSP
Date: Thu, 23 Mar 2017 15:29:31 -0400
Message-ID: <20170323192930.GA9494@broadcom.com>
References: <1490296728-14733-1-git-send-email-jon.mason@broadcom.com>
 <CACna6rwPAwMrrocNMbNko6iMhz+3BqGGrZdEgY1hBKrBisGu3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACna6rwPAwMrrocNMbNko6iMhz+3BqGGrZdEgY1hBKrBisGu3g@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 23, 2017 at 08:21:57PM +0100, Rafał Miłecki wrote:
> On 23 March 2017 at 20:18, Jon Mason <jon.mason@broadcom.com> wrote:
> > This patch series is intended to complete the implementation submitted
> > in http://www.spinics.net/lists/devicetree/msg168813.html
> > It lacked the Kconfig select options and DT bindings for BCM5301X.
> > Also, it did not allow for NSP to be selected.  This series addresses
> > that.
> >
> > I'm sending this as an RFC, as that series has not been included (or
> > reviewed) yet.  If Rafal wants to include these in a v2 of his series,
> > then I am agreeable with that.
> 
> This sounds great, but I think dts changes should go through separated
> (Florian's) tree. So my plan is to combine my patch with your 1/3.
> 
> Does it sound OK to you?

Sounds great.  I can send that as a follow-on, after your patch series
is accepted.

Thanks,
Jon

BTW, I mean to show the console output in my 0/3 email.  For NSP, it
is
# cat /sys/class/thermal/thermal_zone0/temp
46036
