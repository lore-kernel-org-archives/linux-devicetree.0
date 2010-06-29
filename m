From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: Using devices trees on X86
Date: Mon, 28 Jun 2010 22:56:14 -0700
Message-ID: <AANLkTikEJluwUSTmG64jgQYAt_8YI7-gVA2iqOPKrM9W@mail.gmail.com>
References: <0bcc23b9-2cbd-4465-b17c-7b3c2dff9fd3@VA3EHSMHS007.ehs.local>
	<20100629123843.5f94d477.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20100629123843.5f94d477.sfr@canb.auug.org.au>
Sender: sparclinux-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Stephen Neuendorffer <stephen.neuendorffer@xilinx.com>, devicetree-discuss@lists.ozlabs.org, David Miller <davem@davemloft.net>, sparclinux@vger.kernel.org, Michal Simek <monstr@monstr.eu>, microblaze-uclinux@itee.uq.edu.au, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 28, 2010 at 7:38 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Stephen,
>
> On Mon, 28 Jun 2010 10:57:33 -0700 Stephen Neuendorffer <stephen.neue=
ndorffer@xilinx.com> wrote:
>>
>> 2) config OF is currently implemented in the architecture code. =A0T=
his
>> should be non-architecture dependent and selected by the arches that
>> need it.
>>
>> Comments greatly appreciated, in particular if you have
>> likely-to-be-easy-to-get-accepted suggestions for 3), or feel like
>> carefully solving 2) in
>> a way which doesn't bork the existing of-based arches.
>
> See the following patch set. =A0Parts 1, 2 and 3 could be applied to =
the
> respective architecture trees as well as Grant's tree to aleviate som=
e
> conflict problems. =A0Part 5 could wait until a later time if necessa=
ry.
> However, this is relatively trivial, so we could just collect ACKs an=
d
> put it all in Grant's tree and live with any minor pain.
>
> Having OF in more than one Kconfig file should not cause any problems=
 as
> long as they are all the same.

I've got an Ack from David now.  I'll wait for more acks, and then
pull the whole series of 5 into my devicetree-next branch.  It's
certainly less invasive that some of the other changes arch changes
I've taken through my tree.

g.
--
To unsubscribe from this list: send the line "unsubscribe sparclinux" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
