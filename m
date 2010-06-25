From: Stephen Neuendorffer <stephen.neuendorffer@xilinx.com>
Subject: RE: [PATCH] of/flattree: Use common ALIGN() macro instead of archspecific _ALIGN
Date: Fri, 25 Jun 2010 16:36:21 -0700
Message-ID: <5facd128-d48a-4b9e-9b4e-83cabcf33921@SG2EHSMHS003.ehs.local>
References: <20100625220300.6903.3519.stgit@angua> <b392c10f-78bb-466d-a3e0-cf5b95edb4cb@VA3EHSMHS014.ehs.local> <AANLkTilvOpCVrbT4YPaw3NZUCnKgUN7IUQzQGMfihbSG@mail.gmail.com> <bb9a6620-ccf1-4f5b-a1cd-97f93bad4baa@SG2EHSMHS007.ehs.local> <AANLkTik_lg0H4-ajyuCmH9LwhY0nAfo4-sax8ETC984h@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Class: urn:content-classes:message
In-Reply-To: <AANLkTik_lg0H4-ajyuCmH9LwhY0nAfo4-sax8ETC984h@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: benh@kernel.crashing.org, monstr@monstr.eu, microblaze-uclinux@itee.uq.edu.au, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, jeremy.kerr@canonical.com, sfr@canb.auug.org.au
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: glikely@secretlab.ca [mailto:glikely@secretlab.ca] On Behalf Of=
 Grant Likely
> Sent: Friday, June 25, 2010 4:34 PM
> To: Stephen Neuendorffer
> Cc: benh@kernel.crashing.org; monstr@monstr.eu; microblaze-uclinux@it=
ee.uq.edu.au; devicetree-
> discuss@lists.ozlabs.org; linux-kernel@vger.kernel.org; jeremy.kerr@c=
anonical.com;
> sfr@canb.auug.org.au
> Subject: Re: [PATCH] of/flattree: Use common ALIGN() macro instead of=
 archspecific _ALIGN
>=20
> On Fri, Jun 25, 2010 at 5:18 PM, Stephen Neuendorffer
> <stephen.neuendorffer@xilinx.com> wrote:
> >> -----Original Message-----
> >> From: glikely@secretlab.ca [mailto:glikely@secretlab.ca] On Behalf=
 Of Grant Likely
> >> Sent: Friday, June 25, 2010 4:16 PM
> >> To: Stephen Neuendorffer
> >> Cc: benh@kernel.crashing.org; monstr@monstr.eu; microblaze-uclinux=
@itee.uq.edu.au; devicetree-
> >> discuss@lists.ozlabs.org; linux-kernel@vger.kernel.org; jeremy.ker=
r@canonical.com;
> >> sfr@canb.auug.org.au
> >> Subject: Re: [PATCH] of/flattree: Use common ALIGN() macro instead=
 of archspecific _ALIGN
> >>
> >> On Fri, Jun 25, 2010 at 4:49 PM, Stephen Neuendorffer
> >> <stephen.neuendorffer@xilinx.com> wrote:
> >> > Grant,
> >> >
> >> > I need this for the PCI project. =A0I also have a couple of othe=
r
> >> > generalizations of the drivers/of code
> >> > to get it to run after boot time in an X86 system...
> >>
> >> Send me your patches! =A0:-) =A0Get them to me soon and I'll queue=
 them up
> >> for the next merge window.
> >>
> >> g.
> >
> > Dangit, I just got the code compiling, and now I find out that X86 =
doesn't support out_be32()... =A0:)
> > You'd think that somewhere somebody might have realized that all th=
e duplicated driver macros that
> > do that are a bad idea...
>=20
> :-)
>=20
> I think iowrite32be should be cross-arch safe.  in_*, out_* was mostl=
y
> a powerpc/sparc thing.
>=20
> g.

See.. I told you it was a good idea to have that abstracted.. :)

S

This email and any attachments are intended for the sole use of the nam=
ed recipient(s) and contain(s) confidential information that may be pro=
prietary, privileged or copyrighted under applicable law. If you are no=
t the intended recipient, do not read, copy, or forward this email mess=
age or any attachments. Delete this email message and any attachments i=
mmediately.
