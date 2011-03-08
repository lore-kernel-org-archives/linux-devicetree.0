From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH V2 2/3] arm/dt: add very basic dts file for babbage board
Date: Tue, 8 Mar 2011 11:11:55 +0800
Message-ID: <20110308031153.GA14370@S2101-09.ap.freescale.net>
References: <1299503160-9910-1-git-send-email-jason.hui@linaro.org>
	<1299503160-9910-3-git-send-email-jason.hui@linaro.org>
	<20110307145136.GC9978@S2101-09.ap.freescale.net>
	<AANLkTi=NO+=wa8m980Q_uEMQDOXOUwy7h8Fzi4KZJ+a0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTi=NO+=wa8m980Q_uEMQDOXOUwy7h8Fzi4KZJ+a0-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Jason Hui <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 08, 2011 at 10:20:33AM +0800, Jason Hui wrote:
> Hi, Shawn,
> =

> On Mon, Mar 7, 2011 at 10:51 PM, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrot=
e:
> > Aha, Jason. =A0Grant and I put many comments on v1 of this patch, but it
> > seems that v2 is identical to v1, except adding Rob Herring sign-off.
> =

> Please compare with v1 and say it once again, It should include the

Oops!  Sorry, I messed up with my local branches last night, probably
because it was late :)

> grant and your comments except the mxctty1
> due to I think that it's not one issue, So, I did not take your comments.
> =

I still think it's an issue that the dt kernel needs a different
console cmdline from the non-dt one.

> But I observed that some comments as Grant suggest to use decimal not
> hex value for #address-cells and #size-cells,
> not applied to this file globally, I will fix it in the V3 patch if need.
> =

> >
> > On Mon, Mar 07, 2011 at 09:05:59PM +0800, Jason Liu wrote:
> >> Signed-off-by: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> >> Singed-off-by: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> ---
> >> =A0arch/arm/boot/dts/babbage.dts | =A0110 ++++++++++++++++++++++++++++=
+++++++++++++
> >> =A01 files changed, 110 insertions(+), 0 deletions(-)

-- =

Regards,
Shawn
