From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [1/2] powerpc: wii.dts: Add interrupt-related properties to GPIO node
Date: Thu, 24 Jan 2019 14:40:26 +1100 (AEDT)
Message-ID: <43lSbb0ffyz9sNM@ozlabs.org>
References: <20190112162124.3341-2-j.neuschaefer@gmx.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190112162124.3341-2-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>
List-Id: devicetree@vger.kernel.org

On Sat, 2019-01-12 at 16:21:23 UTC, =?utf-8?q?Jonathan_Neusch=C3=A4fer?= wrote:
> The Hollywood GPIO controller is connected to the Hollywood PIC (&PIC1)
> at IRQs 10 and 11; IRQ 10 for GPIO lines that are configured for access
> by the PPC, 11 for GPIO lines that are configured for access by the
> ARM926.
> 
> Signed-off-by: Jonathan NeuschÃ¤fer <j.neuschaefer@gmx.net>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/8de7547e03059281fda075355c114694

cheers
