From: Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH v9 4/5] xhci: mediatek: support MTK xHCI host controller
Date: Mon, 19 Oct 2015 14:25:49 +0300
Message-ID: <5624D33D.5090807@intel.com>
References: <1443495698-32233-1-git-send-email-chunfeng.yun@mediatek.com>	 <1443495698-32233-5-git-send-email-chunfeng.yun@mediatek.com>	 <561FBC40.7020100@linux.intel.com> <1445131519.17024.10.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445131519.17024.10.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: chunfeng yun <chunfeng.yun@mediatek.com>, Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Felipe Balbi <balbi@ti.com>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, John Crispin <blogic@openwrt.org>, Daniel Kurtz <djkurtz@chromium.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Kishon Vijay Abraham I <kishon@ti.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

>>
>> So basically we are trying to use as many microframes as possible with as few packets
>> per microframe as possible.
>>
>> Did I understand this correctly?
> Yes, you are right.
>
>> How will devices react if they expect to get 16 packets every 16th microframe,
>> but they get one packet every microframe instead?
> I think that the synchronous endpoint must specify its period by
> bInterval, but can't specify how data should be transfered during the
> period by the host, and it just only receives data passively. So the
> device can receive data correctly in the case(bInterval is 5).
>
> quote from usb3_r1.0 section4.4.8 Isochronous Transfers:
> "The host can request data from the device or send data to the device at
> any time during the service interval for a particular endpoint on that
> device"
>

As I understand the 4.4.8 section it just means the device can't assume a fixed
time interval between transfers, meaning that the host can use the last microframe
in one esit and the first microframe in the next esit, but still only use 1 microframe
per esit.

Section 8.12.6.1 describes how a 11 packet isoc transfer is allowed to be split
to 1 burst of 11 packets, 2 burst (8 + 3),  3 burst (4+4+3) 6 bursts (2+2+2+2+2+1) or
11 bursts of 1. These are however all within the same microframe. Splitting the
transfer into several microframes in a esit kind of makes the whole interval concept pointless.

-Mathias



  
