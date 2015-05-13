From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 1/4] mailbox: add support for System Control and Power
 Interface(SCPI) protocol
Date: Wed, 13 May 2015 22:22:41 +0530
Message-ID: <CABb+yY1KcrDNrhCHae=B7D+9jv2MEOqwF0VhDRKnZu7ATGfv2A@mail.gmail.com>
References: <1430134846-24320-1-git-send-email-sudeep.holla@arm.com>
	<1430134846-24320-2-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430134846-24320-2-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Liviu Dudau <Liviu.Dudau@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, "Jon Medhurst (Tixy)" <tixy@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 27, 2015 at 5:10 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
> This patch adds support for System Control and Power Interface (SCPI)
> Message Protocol used between the Application Cores(AP) and the System
> Control Processor(SCP). The MHU peripheral provides a mechanism for
> inter-processor communication between SCP's M3 processor and AP.
>
> SCP offers control and management of the core/cluster power states,
> various power domain DVFS including the core/cluster, certain system
> clocks configuration, thermal sensors and many others.
>
> This protocol driver provides interface for all the client drivers using
> SCPI to make use of the features offered by the SCP.
>
Is the SCPI specification available somewhere to look into?

> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> CC: Jassi Brar <jassisinghbrar@gmail.com>
> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Jon Medhurst (Tixy) <tixy@linaro.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../devicetree/bindings/mailbox/arm,scpi.txt       | 121 ++++
>  drivers/mailbox/Kconfig                            |  19 +
>  drivers/mailbox/Makefile                           |   2 +
>  drivers/mailbox/scpi_protocol.c                    | 694 +++++++++++++++++++++
>
Why in drivers/mailbox/ ? This is a 'consumer' driver and seems
Juno(ARM) specific.

-Jassi
