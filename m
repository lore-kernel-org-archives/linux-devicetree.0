From: Emil Medve <Emilian.Medve@Freescale.com>
Subject: Re: [PATCH 2/4] dt/bindings: Introduce the FSL QorIQ DPAA BMan portal(s)
Date: Fri, 24 Oct 2014 04:26:37 -0500
Message-ID: <544A1B4D.3050904@Freescale.com>
References: <1413986972-621-1-git-send-email-Emilian.Medve@Freescale.com>
 <1413986972-621-2-git-send-email-Emilian.Medve@Freescale.com>
 <20141022142931.GA4010@leverpostej> <54480DE6.4090604@Freescale.com>
 <20141023111622.GB13690@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20141023111622.GB13690@leverpostej>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "scottwood@freescale.com" <scottwood@Freescale.com>, "galak@kernel.crashing.org" <galak@kernel.crashing.org>, "corbet@lwn.net" <corbet@lwn.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, Pawel Moll <Pawel.Moll@arm.com>, "Geoff.Thorpe@freescale.com" <Geoff.Thorpe@Freescale.com>, "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello Mark,


On 10/23/2014 06:16 AM, Mark Rutland wrote:
>>>> +NOTE:	The bindings described in this document are preliminary and subject to
>>>> +	change
>>>
>>> While we've tried that elsewhere, unstable DT bindings have been shown
>>> to be a major source of pain.
>>
>> Agreed
>>
>>> I'd feel rather uncomfortable accepting a
>>> binding that we already believe to be insufficient to describe the
>>> hardware.
>>>
>>> What do you expect to change?
>>
>> Related bindings seem incomplete. As such, the PAMU binding (pamu.txt)
>> covers incompletely a dynamic LIODN assignment/programming model. The
>> current driver uses a static assignment scheme that the binding needs to
>> include. I also suspect that once the driver starts supporting the
>> dynamic LIODN assignment/programming we might find some wrinkles
> 
> Ok. Given that the driver doesn't seem to be in mainline (per a quick
> grep), just put "DO NOT MERGE" or something like that in the commit
> message. Once this is merged you're going to need to support it.

We have a driver and once the bindings get accepted we'll (update the
driver as needed and) post the code


Cheers,
