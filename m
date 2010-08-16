From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2 1/2] MIPS: Add device tree support to MIPS
Date: Mon, 16 Aug 2010 14:42:11 -0600
Message-ID: <20100816204211.GA17571@angua.secretlab.ca>
References: <AANLkTi=74zoQziQTmAGo-cNtF9FAT77h+KZagsNEFjEf@mail.gmail.com>
	<7A9214B0DEB2074FBCA688B30B04400D013FA46D@XMB-RCD-208.cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7A9214B0DEB2074FBCA688B30B04400D013FA46D-2KNrN6/GZtCQwNoRDPPJJaBKnGwkPULj@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "Dezhong Diao (dediao)" <dediao-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, "David VomLehn (dvomlehn)" <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 28, 2010 at 03:47:20PM -0500, Dezhong Diao (dediao) wrote:
> Grant,
> =

> I agree with your approach. Please go ahead to make changes and get the p=
atches working with latest code in test tree. Or I am able to make changes =
in terms of your comments too.
> =

> It is best we can have MIPS OF support in 2.6.36, but I have you and Ralf=
 decide it.

Wasn't quite ready in time for 2.6.36, but .37 should be no problem.  All o=
f the pending devicetree core patches are now in Linus' tree, so it is a go=
od time to rebase.  When you repost I can pick them up into my tree to get =
some build test exposure.

I'll also make sure to start build testing on MIPS.  Ralf, any suggestions =
on defconfigs I should use?

Cheers,
g.


> =

> =

> Thanks.
> =

> =

> Dezhong  =

> =

> -----Original Message-----
> From: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of Gra=
nt Likely
> Sent: Wednesday, July 28, 2010 12:26 PM
> To: David Daney
> Cc: Dezhong Diao (dediao); devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; linux-mip=
s@linux-mips.org; ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org; David VomLehn (dvomlehn)
> Subject: Re: [PATCH v2 1/2] MIPS: Add device tree support to MIPS
> =

> On Wed, Jul 28, 2010 at 1:19 PM, David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org> =
wrote:
> > On 07/28/2010 11:54 AM, Grant Likely wrote:
> >>
> >> Hi Dezhong,
> >
> > [...]
> >>
> >> Very nice clean patch, thanks! =A0How/when would you like to see MIPS =

> >> OF support go into mainline?
> >>
> >
> > I can't speak for the patch authors, but my preference would be to =

> > have MIPS OF support go in to 2.6.36 if possible.
> >
> > How? To me it doesn't matter. =A0I would let you and Ralf fight it out.
> =

> It would probably be best if I at least pick up the first patch into my t=
est tree to give it a spin with the latest changes.  I'd be happy to take t=
he 2nd too to avoid ordering issues.
> =

> Cheers,
> g.
