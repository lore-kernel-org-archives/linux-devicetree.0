From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 4/4] of/fdt: only store the device node basename in full_name
Date: Wed, 26 Jul 2017 20:26:36 +1000
Message-ID: <87r2x35w9v.fsf@concordia.ellerman.id.au>
References: <20170725214427.25768-1-robh@kernel.org> <20170725214427.25768-5-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170725214427.25768-5-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
List-Id: devicetree@vger.kernel.org

Rob Herring <robh@kernel.org> writes:

> With dependencies on a statically allocated full path name converted to
> use %pOF format specifier, we can store just the basename of node, and
> the unflattening of the FDT can be simplified.
>
> This commit will affect the remaining users of full_name. After
> analyzing these users, the remaining cases should only change some print
> messages. The main users of full_name are providing a name for struct
> resource. The resource names shouldn't be important other than providing
> /proc/iomem names.
>
> We no longer distinguish between pre and post 0x10 dtb formats as either
> a full path or basename will work. However, less than 0x10 formats have
> been broken since the conversion to use libfdt (and no one has cared).

For the record - yes we did care. It broke booting with old versions of
kexec, and it was a royal P.I.T.# to debug :D

cheers
