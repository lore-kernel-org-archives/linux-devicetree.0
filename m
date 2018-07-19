From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [RESEND, 1/3] powerpc: dts: use 'atmel' as at24 anufacturer for pdm360ng
Date: Thu, 19 Jul 2018 16:07:36 +1000 (AEST)
Message-ID: <41WNpc2DKrz9s4w@ozlabs.org>
References: <20180621083305.5322-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180621083305.5322-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Cc: devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2018-06-21 at 08:33:03 UTC, Bartosz Golaszewski wrote:
> Using 'at' as the <manufacturer> part of the compatible string is now
> deprecated. Use a correct string: 'atmel,<model>'.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/835b706bab95141e2663b046f2fc59

cheers
