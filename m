From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/3] ipmi/bt-bmc: change compatible
	node to 'aspeed, ast2400-ibt-bmc'
Date: Mon, 07 Nov 2016 14:02:01 +0100
Message-ID: <2368736.y6FyG1ESuP@wuerfel>
References: <1478073426-3714-1-git-send-email-clg@kaod.org>
	<CACPK8XcM1_xmmUu-cCZrSR67Y_qeXuSJ4Xmd_2gcgDT321LdBQ@mail.gmail.com>
	<ebeba60f-429f-fb84-b9da-c27d11d23094@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <openipmi-developer-bounces@lists.sourceforge.net>
In-Reply-To: <ebeba60f-429f-fb84-b9da-c27d11d23094@kaod.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/openipmi-developer>,
	<mailto:openipmi-developer-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=openipmi-developer>
List-Post: <mailto:openipmi-developer@lists.sourceforge.net>
List-Help: <mailto:openipmi-developer-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/openipmi-developer>,
	<mailto:openipmi-developer-request@lists.sourceforge.net?subject=subscribe>
Errors-To: openipmi-developer-bounces@lists.sourceforge.net
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: devicetree@vger.kernel.org, Corey Minyard <minyard@acm.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, openipmi-developer@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wednesday, November 2, 2016 3:28:01 PM CET C=E9dric Le Goater wrote:
> On 11/02/2016 02:56 PM, Joel Stanley wrote:
> > On Wed, Nov 2, 2016 at 11:45 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> >> On Wednesday 02 November 2016, C=E9dric Le Goater wrote:
> >>> The Aspeed SoCs have two BT interfaces : one is IPMI compliant and the
> >>> other is H8S/2168 compliant.
> >>>
> >>> The current ipmi/bt-bmc driver implements the IPMI version and we
> >>> should reflect its nature in the compatible node name using
> >>> 'aspeed,ast2400-ibt-bmc' instead of 'aspeed,ast2400-bt-bmc'. The
> >>> latter should be used for a H8S interface driver if it is implemented
> >>> one day.
> >>>
> >>> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> >>
> >> We generally try to avoid changing the compatible strings after the
> >> fact, but it's probably ok in this case.
> =

> As the device tree changes are not merged yet, we thought we had some =

> more time to fine tune the naming. =


Ok, I see. No problem then.

> >> I don't understand who decides which of the two interfaces is used:
> >> is it the same register set that can be driven by either one or the
> >> other driver, or do you expect to have two drivers that can both
> >> be active in the same system and talk to different hardware once
> >> you get there?
> > =

> > It's the second case. The H8S BT has a different register layout so it
> > would require a different driver.
> =

> yes.
>  =

> > We don't yet have a driver for the other BT device, but there was
> > recent talk of using it as an alternate (non-ipmi channel) between the
> > BMC and the host. Before that discussion I wasn't aware that the H8S
> > BT existed. I suggested we fix this up before it hits a final release.
> > =

> > C=E9dric, do you think ast2400-ibt-bmc or ast2400-ipmi-bt-bmc does a
> > better job of describing the hardware here?
> =

> The specs refer to the two interfaces as BT (non IPMI) and iBT (IPMI). =

> I think we can keep the same naming.

Ok

> > While we're modifying the binding, should we add a compat string for
> > the ast2500?
> =

> Well, if the change in this patch is fine for all, may be we can add =

> the ast2500 compat string in a followup patch ?

Sounds good to me.

	Arnd

---------------------------------------------------------------------------=
---
Developer Access Program for Intel Xeon Phi Processors
Access to Intel Xeon Phi processor-based developer platforms.
With one year of Intel Parallel Studio XE.
Training and support from Colfax.
Order your platform today. http://sdm.link/xeonphi
