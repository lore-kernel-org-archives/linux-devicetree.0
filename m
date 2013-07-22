Return-Path: <devicetree-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.11.231]:42868 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755237Ab3GVUFk (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 22 Jul 2013 16:05:40 -0400
Message-ID: <51ED9092.6020709@codeaurora.org>
Date: Mon, 22 Jul 2013 14:05:38 -0600
From: Eric Holmberg <eholmber@codeaurora.org>
MIME-Version: 1.0
Subject: Re: [RFC] Driver configuration using Device Tree
References: <51DC6E52.3080102@codeaurora.org> <20130720060214.A7E853E16F1@localhost>
In-Reply-To: <20130720060214.A7E853E16F1@localhost>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree@vger.kernel.org, kramasub@codeaurora.org, mbohan@codeaurora.org
List-ID: <devicetree@vger.kernel.org>

On 7/20/2013 12:02 AM, Grant Likely wrote:
> On Tue, 09 Jul 2013 14:10:58 -0600, Eric Holmberg <eholmber@codeaurora.org> wrote:
>> I am trying to determine if Device Tree is an appropriate use for
>> configuring drivers and would like to request comments.  We currently
>> use Device Tree in our Shared Memory Driver (SMD) that manages up to 64
>> ports (where a port consists of an RX FIFO and a TX FIFO) between any
>> two processors and a pair of interrupts for each processor.  The shared
>> memory address and interrupt configuration is stored in Device Tree and
>> since this is hardware, this is considered an acceptable use.  However,
>> we also have two separate modules that use SMD and export devices to
>> userspace through either the TTY framework (SMD TTY) or through a
>> character device (SMD PKT).  For these drivers, the configuration has
>> less to do with hardware and more about which port to connect to in the
>> SMD driver and how to expose the port to userspace through a device
>> node.  This code is used in Linux-based phones.
>>
>> The DT configuration looks like this:
>>           qcom,smdtty {
>>                   compatible = "qcom,smdtty";
>>
>>                   qcom,smdtty-ds {
>>                           qcom,smdtty-port-name = "DS";
>>                           qcom,smdtty-edge = <0>;
>>                           qcom,smdtty-dev-idx = <0>;
>>                   };
>>                   . . .
>>                  /* on the order of 10 more port config items */
>>         };
>>
>>
>> Question
>> --------
>> Is there a concern that DT should only be used for hardware
>> configuration and that this "driver configuration" is not an acceptable
>> use?  If it is not acceptable, should I go back to using platform
>> devices (seems like a step backwards) or some other method such as
>> exporting a control channel to userspace that can be configured using an
>> IOCTL?
>
> It still is a reasonable leap to say that the DT contains the known-sane
> configuration settings that are needed by the platform. It may not be
> /strictly/ a hardware description, but it is a description of the usage
> model of the platform.
That's a good, practical interpretation.  In particular, I feel that the 
"description of the usage model of the platform" hits the nail on the 
head for this use case.

>
> I would however say that you only want that configuration to appear once
> in the system. If, say, the linux host sets up and configures the SMD
> regions, then I would like to see the remote systems dynamically
> receiving the configuration from the linux host instead of having a
> separate configuration file.
>
> g.
>
The DT configuration for SMD itself just covers the shared memory 
addresses and interrupt configuration.  The SMD regions/channels are 
dynamically configured using tables in shared memory, so that should 
address your system-level duplication of configuration concern at the 
level of SMD itself.

At the level of SMD TTY and SMD PKT, these drivers are just exporting 
the SMD kernel API to userspace through either a TTY device or a 
character device.  Since this driver topology is OS-specific, each OS 
should have its own local configuration.  I think this addresses your 
system-level duplication of configuration concern at the level of SMD 
TTY and SMD PKT.


It sounds like the configuration presented here for SMD TTY and SMD PKT 
using DT is acceptable since it is a description of the usage model of 
the platform and there is no duplicate of configuration throughout the 
system.  We can always change it in the future if other configuration 
options show up that are a better fit.

Thanks,

Eric Holmberg
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, 
hosted by The Linux Foundation.
