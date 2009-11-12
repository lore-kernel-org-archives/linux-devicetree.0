From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: PCI bus node location
Date: Wed, 11 Nov 2009 22:54:32 -0700
Message-ID: <fa686aa40911112154w1b86a124ja709e540ca66363c@mail.gmail.com>
References: <B7D31A24-3361-4B80-81C4-5A815F09D42F@semihalf.com>
	<fa686aa40911091836s2a6b763aq14ece296cd7368db@mail.gmail.com>
	<20091110031218.GG26042@yookeroo.seuss>
	<839C8AA0-A8B5-434E-9175-16D2B84D74BD@semihalf.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <839C8AA0-A8B5-434E-9175-16D2B84D74BD-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rafal Jaworowski <raj-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 10, 2009 at 9:55 AM, Rafal Jaworowski <raj-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org> wrote:
>
> On 2009-11-10, at 04:12, David Gibson wrote:
>> Under the new scheme, the "soc" node is really a historical misnomer -
>> it represents just the things within the IMMR, not everything on the
>> SoC. =A0A number of chips also have the localbus controller as a
>> separate node, likewise within the SoC but not within the IMMR, so not
>> a child of the soc node.
>
> Hm, how do we know whether something belongs under the IMMR/CCSR node or =
not
> (even though it physically sits there :-)?
>
> Is the 'soc' node going to be named something less confusing then?
>
>> Note also that 4xx chips, unlike the Freescale ones do have the PCI
>> host bridge under the plb node (which represents the main bus on the
>> SoC).
>
> Yea, I noticed, which made me even more confused, so thanks again for
> clarifications.

The whole point of the IMMR node is to group things that are
relocatable together.  It was chosen as a matter of convenience, but
it would be absolutely valid to eliminate the IMMR node entirely just
make all the internal devices peers of the root node.  Except for a
few bugs that would probably be exposed, the current kernel would
parse that device tree just fine.

So, while the expressed ideal is to describe the exact bus topology,
the reality is that there are many reasons why the .dts hierarchy will
not match the physical hierarchy exactly (ie. omitting nodes for
transparent bridges which software has no control over, or adding
nodes to group logically related devices together, or as with
Freescale PCI moving the nodes out entirely because adding all the PCI
ranges to the IMMR node seems 'wrong').  However, it still works
because there are well established conventions, and device drivers
generally stick to the published device binding without making
assumptions about the node layout.  As long as common code parses
'reg' and 'ranges' correctly, then the whole system works.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
