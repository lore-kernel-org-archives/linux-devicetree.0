From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: powerpc: dts: replace 'linux,stdout-path' with 'stdout-path'
Date: Tue, 20 Mar 2018 21:15:30 +1100 (AEDT)
Message-ID: <40582V6byxz9sZ5@ozlabs.org>
References: <20180228224406.7049-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180228224406.7049-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, 2018-02-28 at 22:44:06 UTC, Rob Herring wrote:
> 'linux,stdout-path' has been deprecated for some time in favor of
> 'stdout-path'. Now dtc will warn on occurrences of 'linux,stdout-path'.
> Search and replace all the of occurrences with 'stdout-path'.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/78e5dfea84dc15d69940831b3981b3

cheers
