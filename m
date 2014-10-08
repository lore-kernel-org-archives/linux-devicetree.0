From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3 2/3] ARM: shmobile: koelsch: enable HS-USB
Date: Wed, 08 Oct 2014 22:07:50 +0400
Message-ID: <54357D76.4050104@cogentembedded.com>
References: <1511869.4ca9KHmSFr@wasted.cogentembedded.com> <8674731.7YYzQeH0h1@wasted.cogentembedded.com> <20141008180513.GJ22688@saruman>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <20141008180513.GJ22688@saruman>
Sender: linux-sh-owner@vger.kernel.org
To: balbi@ti.com
Cc: horms@verge.net.au, linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com
List-Id: devicetree@vger.kernel.org

Hello.

On 10/08/2014 10:05 PM, Felipe Balbi wrote:

>> From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

>> Enable HS-USB device for the Koelsch board, defining the GPIO that the driver
>> should check when probing (which is the ID output from MAX3355 OTG chip).

>> Note that there will be pinctrl-related error messages if both internal PCI
>> and HS-USB drivers are enabled but they should be just ignored.

>> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> [Sergei: added pin function/group and prop, moved device node, fixed summary,
>> added changelog]
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

>> ---
>> Changes in version 3:
>> - added pinctrl-related properties;

> did you miss pinctrl here ?

     No, AFAICS. Or what do you mean?

WBR, Sergei

