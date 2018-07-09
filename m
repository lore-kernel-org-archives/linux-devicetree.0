Return-Path: <SRS0=6VMM=JZ=vanmierlo.com=m.brock@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 09 Jul 2018 15:44:41 +0200
From: Maarten Brock <m.brock@vanmierlo.com>
Subject: Re: [PATCH 3/4] doc: uartlite: Add binding for the driver
In-Reply-To: <20180703224239.GA6756@rob-hp-laptop>
References: <1530102225-6459-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <1530102225-6459-3-git-send-email-shubhrajyoti.datta@xilinx.com>
 <20180703224239.GA6756@rob-hp-laptop>
Message-ID: <cbcc75219d9c9721341f237f31f44549@vanmierlo.com>
To: Rob Herring <robh@kernel.org>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, shubhrajyoti.datta@gmail.com, linux-serial-owner@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 2018-07-04 00:42, Rob Herring wrote:
> On Wed, Jun 27, 2018 at 05:53:44PM +0530, Shubhrajyoti Datta wrote:
>> +
>> +Optional properties:
>> +- port-number          : Set Uart port number
> 
> Nope. Use aliases.

You may not like the current implementation, but that is no reason to 
deny
this documentation of the current state.

Personally I don't get this preference for aliases. It is a one way 
mapping
in the wrong direction if you ask me. If e.g. you have serial0 pointing 
to
a 16550 it will give /dev/ttyS0. This prevents you to create 
/dev/ttyUL0,
because serial0 is already taken. Note that ttySx and ttyULx are in
different namespaces. It would only make sense if ttyULx was an illegal
name for a UART.

Maarten
