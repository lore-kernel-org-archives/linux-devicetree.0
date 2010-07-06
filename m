From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 2/4] sparc: break out some prom device-tree building code
	out into drivers/of
Date: Tue, 6 Jul 2010 02:17:32 -0600
Message-ID: <AANLkTil8dEyj5OQcpHy0HWGW_YrHCmo5CMvYx8_IL0K1@mail.gmail.com>
References: <20100707040734.05d625af@debxo> <20100705.192221.241453945.davem@davemloft.net>
	<AANLkTil3aZ0IF1KEc2h9MLHPZYW23pnWzEy4IiVb3zxT@mail.gmail.com>
	<20100706.001607.186316276.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100706.001607.186316276.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: dilinger@queued.net, devicetree-discuss@lists.ozlabs.org, sparclinux@vger.kernel.org, x86@kernel.org, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, cjb@laptop.org, wmb@laptop.org, pgf@laptop.org, linux-kernel@vger.kernel.org, benh@kernel.crashing.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 6, 2010 at 1:16 AM, David Miller <davem@davemloft.net> wrot=
e:
> From: Grant Likely <grant.likely@secretlab.ca>
> Date: Tue, 6 Jul 2010 01:00:06 -0600
>
>> I'm curious... what are your plans here? =A0Will you be keeping OF a=
live
>> between kexec()? =A0Will the new kernel get the entire device tree f=
rom
>> fdt, or will it still be talking to OF? =A0How will the fdt fragment=
s as
>> Andres described above fit into sparc kexec (as opposed to generatin=
g
>> one big tree as in his first option)?
>
> On certain sparc64 systems, I have to stop making PROM calls early
> in the boot right after I fetch the device tree into the kernel.
>
> So yes for a kexec() I'll have to pass an fdt or similar to the
> child kernel.
>
> It could be a big linear fdt buffer, or fragments, it really doesn't
> matter all that much actually.

Okay.  There is already support for getting the tree out of the kernel
and into fdt form via procfs.  Userspace can also modify it before
sending it back to kexec().  This will be easy no matter which
approach Andres uses.

g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
