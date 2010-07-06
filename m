From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 2/4] sparc: break out some prom device-tree building code
	out into drivers/of
Date: Tue, 6 Jul 2010 01:00:06 -0600
Message-ID: <AANLkTil3aZ0IF1KEc2h9MLHPZYW23pnWzEy4IiVb3zxT@mail.gmail.com>
References: <20100629193618.5a840b8e@dev.queued.net> <AANLkTilme2uAoXjorUEzam9j_xosR8kl70W8PS71d-Th@mail.gmail.com>
	<20100707040734.05d625af@debxo> <20100705.192221.241453945.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20100705.192221.241453945.davem@davemloft.net>
Sender: sparclinux-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: dilinger@queued.net, devicetree-discuss@lists.ozlabs.org, sparclinux@vger.kernel.org, x86@kernel.org, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, cjb@laptop.org, wmb@laptop.org, pgf@laptop.org, linux-kernel@vger.kernel.org, benh@kernel.crashing.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 5, 2010 at 8:22 PM, David Miller <davem@davemloft.net> wrot=
e:
> From: Andres Salomon <dilinger@queued.net>
> Date: Wed, 7 Jul 2010 04:07:34 +0000
>
>> =A0- For the pdt, calling into the prom once for each property/node =
to
>> =A0 =A0create a fdt, and then unflattening it. =A0This is better tha=
n the
>> =A0 =A0previous option, but I don't think the prom->fdt code will be=
 very
>> =A0 =A0nice.
>
> I'll need this on sparc64 at some point to support kexec() anyways.
>
> So at least for sparc you can assume that a something-->fdt translato=
r
> is going to exist at some point in the future regardless of what
> happens here.

Hi David,

I'm curious... what are your plans here?  Will you be keeping OF alive
between kexec()?  Will the new kernel get the entire device tree from
fdt, or will it still be talking to OF?  How will the fdt fragments as
Andres described above fit into sparc kexec (as opposed to generating
one big tree as in his first option)?

Cheers,
g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
--
To unsubscribe from this list: send the line "unsubscribe sparclinux" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
