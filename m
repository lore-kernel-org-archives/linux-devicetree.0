From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v3] of: Create asm-generic/of.h and provide default
	of_node_to_nid()
Date: Mon, 26 Jul 2010 16:51:01 -0600
Message-ID: <AANLkTikpON7WUkTLrnW4y2kghM=H8cLCAFst08S3cL_Z@mail.gmail.com>
References: <20100726220405.1550.63442.stgit@angua> <20100726222627.GA23501@merkur.ravnborg.org>
	<AANLkTikcV3jJUm_My-oK-drudSDz3M2iH1cWhxdt+W1s@mail.gmail.com>
	<20100726.154854.35052662.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100726.154854.35052662.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: sam@ravnborg.org, sfr@canb.auug.org.au, monstr@monstr.eu, microblaze-uclinux@itee.uq.edu.au, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, benh@kernel.crashing.org, sparclinux@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 26, 2010 at 4:48 PM, David Miller <davem@davemloft.net> wro=
te:
> From: Grant Likely <grant.likely@secretlab.ca>
> Date: Mon, 26 Jul 2010 16:42:20 -0600
>
>> It protects against some later include file doing a #define
>> of_node_to_nid and thus resulting in an inconsistent definition. =A0=
If
>> some code tries to do this then the preprocessor will complain. =A0T=
his
>> is the pattern that Stephen suggested.
>
> Also, it would be nice to unravel the "0" vs. "-1" default
> inconsistency.

Indeed.  I looked at it briefly, but it wasn't immediately clear what
the impact would be to switch powerpc over to -1, and it looked to me
like sparc depends on -1 to signify no node association.

g.
