From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 2/2] ARM: shmobile: r8a7790: add EtherAVB DT support
Date: Thu, 02 Apr 2015 14:31:19 +0300
Message-ID: <551D2887.3020808@cogentembedded.com>
References: <1625400.M0MxPQybIy@wasted.cogentembedded.com> <8163383.0UU0Q5gsLE@wasted.cogentembedded.com> <20150331002113.GB16289@verge.net.au> <551AB78B.4000506@cogentembedded.com> <20150402013359.GB25445@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <20150402013359.GB25445@verge.net.au>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

On 4/2/2015 4:33 AM, Simon Horman wrote:

>> On 03/31/2015 03:21 AM, Simon Horman wrote:

>>>> Define the generic R8A7790 part of the EtherAVB device node.

>>> Please repost once this binding (and associated driver) has been accepted.

>>     OK, but will you merge patch #1?

> I would prefer to wait until we can exercise it with a driver.

    Then you'll have to wait long as the Lager board doesn't have support for 
Ethernet AVB. We've only tested it with the daughter boards.

WBR, Sergei

