From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Convert to using %pOF instead of full_name
Date: Wed, 19 Jul 2017 22:03:15 +1000
Message-ID: <878tjkiqgs.fsf@concordia.ellerman.id.au>
References: <20170718214339.7774-6-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170718214339.7774-6-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Anatolij Gustschin <agust@denx.de>, Scott Wood <oss@buserror.net>, Kumar Gala <galak@kernel.crashing.org>, Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Rob Herring <robh@kernel.org> writes:

> Now that we have a custom printf format specifier, convert users of
> full_name to use %pOF instead. This is preparation to remove storing
> of the full path string for each node.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Anatolij Gustschin <agust@denx.de>
> Cc: Scott Wood <oss@buserror.net>
> Cc: Kumar Gala <galak@kernel.crashing.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
...
>  79 files changed, 464 insertions(+), 490 deletions(-)


Is the plan that I'll merge this for 4.14 ?

cheers
