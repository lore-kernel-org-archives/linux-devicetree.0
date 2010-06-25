From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] of/flattree: Use common ALIGN() macro instead of
	archspecific _ALIGN
Date: Fri, 25 Jun 2010 17:34:17 -0600
Message-ID: <AANLkTik_lg0H4-ajyuCmH9LwhY0nAfo4-sax8ETC984h@mail.gmail.com>
References: <20100625220300.6903.3519.stgit@angua> <b392c10f-78bb-466d-a3e0-cf5b95edb4cb@VA3EHSMHS014.ehs.local>
	<AANLkTilvOpCVrbT4YPaw3NZUCnKgUN7IUQzQGMfihbSG@mail.gmail.com>
	<bb9a6620-ccf1-4f5b-a1cd-97f93bad4baa@SG2EHSMHS007.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bb9a6620-ccf1-4f5b-a1cd-97f93bad4baa@SG2EHSMHS007.ehs.local>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Neuendorffer <stephen.neuendorffer@xilinx.com>
Cc: benh@kernel.crashing.org, monstr@monstr.eu, microblaze-uclinux@itee.uq.edu.au, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, jeremy.kerr@canonical.com, sfr@canb.auug.org.au
List-Id: devicetree@vger.kernel.org

On Fri, Jun 25, 2010 at 5:18 PM, Stephen Neuendorffer
<stephen.neuendorffer@xilinx.com> wrote:
>> -----Original Message-----
>> From: glikely@secretlab.ca [mailto:glikely@secretlab.ca] On Behalf O=
f Grant Likely
>> Sent: Friday, June 25, 2010 4:16 PM
>> To: Stephen Neuendorffer
>> Cc: benh@kernel.crashing.org; monstr@monstr.eu; microblaze-uclinux@i=
tee.uq.edu.au; devicetree-
>> discuss@lists.ozlabs.org; linux-kernel@vger.kernel.org; jeremy.kerr@=
canonical.com;
>> sfr@canb.auug.org.au
>> Subject: Re: [PATCH] of/flattree: Use common ALIGN() macro instead o=
f archspecific _ALIGN
>>
>> On Fri, Jun 25, 2010 at 4:49 PM, Stephen Neuendorffer
>> <stephen.neuendorffer@xilinx.com> wrote:
>> > Grant,
>> >
>> > I need this for the PCI project. =A0I also have a couple of other
>> > generalizations of the drivers/of code
>> > to get it to run after boot time in an X86 system...
>>
>> Send me your patches! =A0:-) =A0Get them to me soon and I'll queue t=
hem up
>> for the next merge window.
>>
>> g.
>
> Dangit, I just got the code compiling, and now I find out that X86 do=
esn't support out_be32()... =A0:)
> You'd think that somewhere somebody might have realized that all the =
duplicated driver macros that
> do that are a bad idea...

:-)

I think iowrite32be should be cross-arch safe.  in_*, out_* was mostly
a powerpc/sparc thing.

g.
