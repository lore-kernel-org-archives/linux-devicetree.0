Return-Path: <SRS0=DAzr=KV=vanmierlo.com=m.brock@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 06 Aug 2018 10:57:05 +0200
From: Maarten Brock <m.brock@vanmierlo.com>
Subject: Re: [PATCHv3 4/4] dt-bindings: serial: Add binding for uartlite
In-Reply-To: <20180716160251.GA11275@rob-hp-laptop>
References: <1531718634-17939-1-git-send-email-shubhrajyoti.datta@gmail.com>
 <1531718634-17939-4-git-send-email-shubhrajyoti.datta@gmail.com>
 <20180716160251.GA11275@rob-hp-laptop>
Message-ID: <a9896568bfe44758a8c71e811ebb95a0@vanmierlo.com>
To: Rob Herring <robh@kernel.org>
Cc: shubhrajyoti.datta@gmail.com, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, jacmet@sunsite.dk, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, linux-serial-owner@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 2018-07-16 18:02, Rob Herring wrote:
>> +Optional properties:
>> +- port-number		: Set Uart port number
>> +- clock-names		: Should be "s_axi_aclk"
>> +- clocks		: Input clock specifier. Refer to common clock bindings.
> 
> How do you calc baud rates if this is omitted?

The uartlite is fixed to some baud rate (actually divisor) in the fpga.
And btw. so are the number of data bits, stop bits and parity.

Maarten
