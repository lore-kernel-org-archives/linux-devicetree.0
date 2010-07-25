From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] of: Provide default of_node_to_nid() when CONFIG_NUMA is
	not set
Date: Sun, 25 Jul 2010 14:37:38 -0600
Message-ID: <AANLkTinE4X0iAJAiatc7Qtj2QP6dhyBKo9fqxqUt40Y6@mail.gmail.com>
References: <20100724154331.22701.3409.stgit@angua> <20100725130723.a5192793.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20100725130723.a5192793.sfr@canb.auug.org.au>
Sender: sparclinux-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: monstr@monstr.eu, microblaze-uclinux@itee.uq.edu.au, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, benh@kernel.crashing.org, sparclinux@vger.kernel.org, davem@davemloft.net
List-Id: devicetree@vger.kernel.org

On Sat, Jul 24, 2010 at 9:07 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Grant,
>
> On Sat, 24 Jul 2010 09:43:31 -0600 Grant Likely <grant.likely@secretl=
ab.ca> wrote:
>>
>> of_node_to_nid() is only relevant for NUMA. =A0Don't force architect=
ures to
>> implement it if CONFIG_NUMA is not set.
>
> Why not just do:
>
> #ifndef of_node_to_nid
> static inline int of_node_to_nid(struct device_node *device) { return=
 0; }
> #define of_node_to_nid =A0of_node_to_nid
> #endif
>
> in include/linux/of.h
>
> and then add:
>
> #define of_node_to_nid =A0of_node_to_nid
>
> Where it is declared/defined for each arch ...
> (it would be nice if all the archs were consistent in where it was
> declared).

Two reasons; I had started doing that in topology.h, but it caused a
bunch of collateral damage with files missing the include, so I punted
and took the easy way out.  Also, I didn't know if that was an
acceptable or safe pattern for override symbols.

I'll spin it again with this pattern and see what it looks.

g.


> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
> http://www.canb.auug.org.au/~sfr/
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
--
To unsubscribe from this list: send the line "unsubscribe sparclinux" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
