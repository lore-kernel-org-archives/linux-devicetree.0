From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/2] Character literal parsing
Date: Wed, 20 Jul 2011 23:44:40 +1000
Message-ID: <20110720134440.GL6399@yookeroo.fritz.box>
References: <1308871239-32683-1-git-send-email-robotboy@chromium.org>
	<8yawrgb3smr.fsf@huya.qualcomm.com>
	<BANLkTi=iUqMwag-A6t1ubDgSAN9xqWuTMwLG32EKKWuwVbigyg@mail.gmail.com>
	<8yafwmz3pg3.fsf@huya.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8yafwmz3pg3.fsf-AOX6H5vLt3Uj8izMo0bVsAC/G2K4zDHf@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Anton Staaf <robotboy-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 24, 2011 at 02:11:08PM -0700, David Brown wrote:
> On Fri, Jun 24 2011, Anton Staaf wrote:
> =

> > On Fri, Jun 24, 2011 at 1:02 PM, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wr=
ote:
> >
> >
> >     Does this mean that the dtc inside the kernel is going to be the
> >     required tool to use to build device trees? =A0This change doesn't =
change
> >     the DTB format, so it's as much of a concern, but was wondering if =
we're
> >     intending to keep things compatible.
> >
> >
> > To be honest, I don't know enough to say either way. =A0I am using the =
character
> > literals in a device tree that is used to configure a single firmware i=
mage for
> > multiple boards. =A0That device tree is not currently passed on to the =
kernel.
> >
> > Your question makes me think that there are two device tree compilers t=
hat I
> > should be paying attention to, is that the case? =A0Or was it a more ge=
neral
> > comment about diverging from a historic syntax for device tree source f=
iles?
> =

> Both, really.  There is a dtc at
> git://git.kernel.org/pub/scm/linux/kernel/git/galak/dtc.git but it seems
> older than the one in the kernel.
> =

> Also, the dts form is defined in the ePAPR documents, and this would be
> a (minor) divergence from that.

That's fine as long as the change is backwards compatible.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
