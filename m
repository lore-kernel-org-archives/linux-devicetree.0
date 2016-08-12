From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH v5 0/5] da8xx USB PHY platform devices and clocks (was
 "da8xx UBS clocks")
Date: Fri, 12 Aug 2016 16:24:27 -0500
Message-ID: <CAOi56cWCZioi=qU-iaLvCfh-EmbPh4pwwTJ5tDK+9qfv5+8WuQ@mail.gmail.com>
References: <1462837612-7803-1-git-send-email-david@lechnology.com>
 <57431E73.5030304@lechnology.com> <57458A0A.5010100@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57458A0A.5010100@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>
Cc: David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>, petr@barix.com, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Bin Liu <b-liu@ti.com>, Lee Jones <lee.jones@linaro.org>, devicetree <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, May 25, 2016 at 6:18 AM, Sekhar Nori <nsekhar@ti.com> wrote:
> On Monday 23 May 2016 08:44 PM, David Lechner wrote:
>> On 05/09/2016 06:46 PM, David Lechner wrote:
>>> v5 changes: renamed "usbphy" to "usb_phy" or "usb-phy" as appropriate
>>>

[...]

>>
>> What should I be doing to keep this moving along?
>
> We need the related driver changes to be applied first. I could then use
> an immutable branch to push the platform changes against.
>
> I did take a look at the patches and they look good to me. Except the
> one comment from Sergei which I just now indicated that I agree with.

Just checking on the status of this.  I'm not seeing the driver
changes in mainline yet.

Any update?

Kevin
