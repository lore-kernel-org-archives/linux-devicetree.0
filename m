From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: powerpc: wii.dts: Add drive slot LED
Date: Sun,  1 Apr 2018 01:03:59 +1100 (AEDT)
Message-ID: <40D0b40XzBz9s1S@ozlabs.org>
References: <20180317150617.26913-1-j.neuschaefer@gmx.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180317150617.26913-1-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>
List-Id: devicetree@vger.kernel.org

On Sat, 2018-03-17 at 15:06:17 UTC, =?utf-8?q?Jonathan_Neusch=C3=A4fer?= wrote:
> The Wii has a blue LED in the disk drive slot, which is controlled via a
> GPIO line. Add this LED to wii.dts, and mark it as a panic-indicator.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/041413b88d6e9c66582d0a38d0e82f

cheers
