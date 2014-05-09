From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH V2 2/2] ARM: shmobile: r8a7791: add i2c2 bus to koelsch
 dt
Date: Sat, 10 May 2014 02:59:15 +0400
Message-ID: <536D5DC3.3070409@cogentembedded.com>
References: <1392633882-12142-1-git-send-email-wsa@the-dreams.de> <1392633882-12142-2-git-send-email-wsa@the-dreams.de> <536C1945.1000601@cogentembedded.com> <20140509050610.GB2624@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <20140509050610.GB2624@katana>
Sender: linux-sh-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>, Wolfram Sang <wsa@sang-engineering.com>
List-Id: devicetree@vger.kernel.org

Hello.

On 05/09/2014 09:06 AM, Wolfram Sang wrote:

>>> +	eeprom@50 {
>>> +		compatible = "renesas,24c02";

>>     This is not quite right: Renesas' part is called differently, and
>> you're carrying the other vendor's naming onto Renesas parts. I'd
>> just say "24c02" (which I'll do in the Henninger board patch).

> What about "generic"?

    I don't know, really. However, you're right in that there should be some 
vendor prefix -- I've just seen Documentation/devicetree/bindings/eeprom.txt.

WBR, Sergei

