From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v2 00/11] da8xx USB clocks
Date: Wed, 23 Mar 2016 22:56:59 +0530
Message-ID: <56F2D1E3.6060608@ti.com>
References: <1458181615-27782-1-git-send-email-david@lechnology.com>
 <56EAB38C.9070905@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56EAB38C.9070905@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, David Lechner <david@lechnology.com>
Cc: Petr Kulhavy <petr@barix.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kevin Hilman <khilman@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bin Liu <b-liu@ti.com>, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, Robert Jarzmik <robert.jarzmik@free.fr>, Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi David,

On Thursday 17 March 2016 07:09 PM, Sergei Shtylyov wrote:
> On 3/17/2016 5:26 AM, David Lechner wrote:
> 
>> OK, ready for round two.
> 
>    You're quick... :-)
> 
>> I've added a new callback in the davinci clocks so that they can properly
>> handle clock muxing. The clock functions are pretty much the same as
>> in the
>> previous patch set other than clk_set_parent() now works.
>>
>> The next new thing is a phy driver for the CFGCHIP2 register that
>> controls the
>> SoC USB PHY (both USB 1.1 and USB 2.0). The ohci and musb drivers have
>> been
>> updated to use this new phy driver.
> 
>    Fantastic! At least there's some breakthru on this front.

+1 Thanks a bunch for resurrecting this code.

Regards,
Sekhar
