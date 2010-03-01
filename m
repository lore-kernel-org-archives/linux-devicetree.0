From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Mon, 1 Mar 2010 15:25:04 -0700
Message-ID: <fa686aa41003011425i734ee434m95b62d57a271bd1f@mail.gmail.com>
References: <1222460748-20127-3-git-send-email-jdl@jdl.com>
	<20080930145537.GJ18313@secretlab.ca>
	<20081001034656.GF30810@yookeroo.seuss>
	<fa686aa41002200813o3fea9a34s198be367ad81b367@mail.gmail.com>
	<20100222013004.GM29038@yookeroo>
	<fa686aa41002212226i4c83376cn8d88a045dd13fe00@mail.gmail.com>
	<9696D7A991D0824DBA8DFAC74A9C5FA305B2021A@az33exm25.fsl.freescale.net>
	<4288fc0b-79a4-42fd-9e77-573dbad79210@SG2EHSMHS004.ehs.local>
	<4B8C2C4C.8070901@freescale.com>
	<4d16ecf4-27b2-4c73-a3be-5b2a8ff95820@VA3EHSMHS010.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4d16ecf4-27b2-4c73-a3be-5b2a8ff95820-+Ck8Kgl/v0+J1bAq5m18RLjjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 1, 2010 at 3:03 PM, Stephen Neuendorffer
<stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> From: Scott Wood [mailto:scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org]
>> If sequential operations within a tree are supported, I'm not sure
> that there's
>> any remaining need for separate top-level trees -- you could express
> the same
>> thing as top-level property/node redefinitions.
>
> I agree, *IF* sequential operations are supported.
> But then you have a sequential programming language, not a structured
> data
> description. =A0I think this is a bad idea.

Indeed.  We've got lots of sequential programming languages.  I don't
want us to create for ourselves a new (and poorly implemented)
language.

>> I'd rather make them actually behave like immediate commands, though.
>
> But the question is, what is the semantics of the 'command language'
> (where ordering matters)
> from the 'structure language' (where ordering is unimportant). =A0My
> suggestion is to cleanly separate
> these two. =A0The only ordering that is defined is between sequential
> trees. =A0Within a sequential tree,
> only things which have the same meaning in any ordering of sub-nodes and
> properties should be allowed.

Yes, I think I agree with this.  The only ordering that matters is the
ordering of top level node redefinition blocks.

>> > Which brings up the question 'undeletion question'. =A0Can you do:
>> >
>> > d-label: delete(bar);
>> > delete(&d-label);
>>
>> I'd say no -- delete operates on data, not commands.
>
> This implies that data and commands are different. =A0And commands have to
> be ordered, which means that you have
> to keep the order of everything under a node, which chucks alot of the
> beauty of device trees, IMHO.

Right, well said.  I think the right thing to do is to avoid the
concept of commands entirely from the tree.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
