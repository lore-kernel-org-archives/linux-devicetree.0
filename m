From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 1/4] mailbox: add support for System Control and Power
 Interface(SCPI) protocol
Date: Thu, 14 May 2015 13:00:11 +0530
Message-ID: <CABb+yY0J1j=wMaKj+1nohU7qJpVS83BD_AX3Mf56T5+6V6+NOA@mail.gmail.com>
References: <1430134846-24320-1-git-send-email-sudeep.holla@arm.com>
	<1430134846-24320-2-git-send-email-sudeep.holla@arm.com>
	<CABb+yY1KcrDNrhCHae=B7D+9jv2MEOqwF0VhDRKnZu7ATGfv2A@mail.gmail.com>
	<55538540.1010505@arm.com>
	<CABb+yY1083thUrtKfMKg1ZP2=d3Jr4hqRczqejpAkba+40UnkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABb+yY1083thUrtKfMKg1ZP2=d3Jr4hqRczqejpAkba+40UnkA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Liviu Dudau <Liviu.Dudau@arm.com>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, "Jon Medhurst (Tixy)" <tixy@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 14, 2015 at 12:32 PM, Jassi Brar <jassisinghbrar@gmail.com> wrote:
>
> BTW is scpi_protocol.c meant/tested to work over arm_mhu.c? The spec
> says so but I don't see how because you pass 'struct scpi_xfer*' as
> the message whereas arm_mhu.c expects u32*
>
It seems your remote doesn't interpret the value in STAT register...
so it just works.
However the SCPI spec recommends seeing STAT register as '31 slots'
... maybe we should try to support that.

thanks.
