From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH V2 2/3] arm/dt: add very basic dts file for babbage board
Date: Tue, 15 Mar 2011 00:55:24 -0600
Message-ID: <20110315065524.GA23050@angua.secretlab.ca>
References: <1299503160-9910-1-git-send-email-jason.hui@linaro.org>
	<1299503160-9910-3-git-send-email-jason.hui@linaro.org>
	<20110307145136.GC9978@S2101-09.ap.freescale.net>
	<AANLkTi=NO+=wa8m980Q_uEMQDOXOUwy7h8Fzi4KZJ+a0@mail.gmail.com>
	<20110308031153.GA14370@S2101-09.ap.freescale.net>
	<AANLkTimSxsdWSvtWS00BbXOjvHS5g6CeYo+kH=K4VP7m@mail.gmail.com>
	<20110308034646.GC14370@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110308034646.GC14370-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 08, 2011 at 11:46:47AM +0800, Shawn Guo wrote:
> On Tue, Mar 08, 2011 at 11:31:07AM +0800, Jason Hui wrote:
> > Hi, Shawn,
> > =

> > On Tue, Mar 8, 2011 at 11:11 AM, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wr=
ote:
> > > On Tue, Mar 08, 2011 at 10:20:33AM +0800, Jason Hui wrote:
> > >> Hi, Shawn,
> > >>
> > >> On Mon, Mar 7, 2011 at 10:51 PM, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>=
 wrote:
> > >> > Aha, Jason. =A0Grant and I put many comments on v1 of this patch, =
but it
> > >> > seems that v2 is identical to v1, except adding Rob Herring sign-o=
ff.
> > >>
> > >> Please compare with v1 and say it once again, It should include the
> > >
> > > Oops! =A0Sorry, I messed up with my local branches last night, probab=
ly
> > > because it was late :)
> > >
> > >> grant and your comments except the mxctty1
> > >> due to I think that it's not one issue, So, I did not take your comm=
ents.
> > >>
> > > I still think it's an issue that the dt kernel needs a different
> > > console cmdline from the non-dt one.
> > =

> > In fact, this is user defined, I think But why we need mxctty1 in dt
> > here, the reason is that,
> > =

> > uart3 will be probed first and then uart0, uart1, which lead to
> > mxctty0 ---> uart3,
> > =

> > mxctty1---> uart0 and mxctty2 --->uart1.
> > =

> > The debug uart of mx51 babbage board is uart0, so we need define
> > mxctty1 in the kernel command line.
> > =

> > We can put spba@70000000 at the back of aips@73f00000, but it will
> > make the memory address not sorted
> > from lower to higher.
> > =

> So we probably need one more number in 'reg' to tell the port id?

As discussed in my other reply; it is a bad idea to try and encoded
the port id into a device node.  Use /aliases instead.

g.
