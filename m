From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: macintosh: Convert to using %pOF instead of full_name
Date: Fri,  1 Sep 2017 23:29:49 +1000 (AEST)
Message-ID: <3xkKq15MV3z9t3t@ozlabs.org>
References: <20170718214339.7774-32-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170718214339.7774-32-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 2017-07-18 at 21:43:12 UTC, Rob Herring wrote:
> Now that we have a custom printf format specifier, convert users of
> full_name to use %pOF instead. This is preparation to remove storing
> of the full path string for each node.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: linuxppc-dev@lists.ozlabs.org

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/b6a945ae03fd3962b51b27ecedf4f1

cheers
