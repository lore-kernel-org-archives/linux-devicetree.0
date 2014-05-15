From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH v6 17/17] ARM: mvebu: add Device Tree description of the
 EHCI controller on Armada 375
Date: Thu, 15 May 2014 15:44:45 +0200
Message-ID: <5374C4CD.40902@free-electrons.com>
References: <1400149062-32661-1-git-send-email-gregory.clement@free-electrons.com> <1400149062-32661-18-git-send-email-gregory.clement@free-electrons.com> <5374C08C.7040700@cogentembedded.com> <20140515133444.GN27822@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140515133444.GN27822@titan.lakedaemon.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 15/05/2014 15:34, Jason Cooper wrote:
> On Thu, May 15, 2014 at 05:26:36PM +0400, Sergei Shtylyov wrote:
>> Hello.
>>
>> On 05/15/2014 02:17 PM, Gregory CLEMENT wrote:
>>
>>> The Marvell Armada 375 SoCs contains one EHCI controller. This commit
>>
>>    However, you're adding two. :-)
> 
> So it would seem.  Gregory, I'll fix it up when I pull it in.  No need
> to respin.

Sergei is absolutely right. Jason thank you to take care of it

Gregory

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
