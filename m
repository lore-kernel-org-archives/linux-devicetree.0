From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/3] ipmi/bt-bmc: change compatible
	node to 'aspeed, ast2400-ibt-bmc'
Date: Wed, 09 Nov 2016 17:09:12 +0100
Message-ID: <2278270.0oJqDfoDd9@wuerfel>
References: <1478073426-3714-1-git-send-email-clg@kaod.org>
	<a886778e-a85e-758e-3a61-c4909652e39d@kaod.org>
	<c749ff0a-bc71-bc9f-0e8c-326db2cea0fb@acm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <openipmi-developer-bounces@lists.sourceforge.net>
In-Reply-To: <c749ff0a-bc71-bc9f-0e8c-326db2cea0fb@acm.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/openipmi-developer>,
	<mailto:openipmi-developer-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=openipmi-developer>
List-Post: <mailto:openipmi-developer@lists.sourceforge.net>
List-Help: <mailto:openipmi-developer-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/openipmi-developer>,
	<mailto:openipmi-developer-request@lists.sourceforge.net?subject=subscribe>
Errors-To: openipmi-developer-bounces@lists.sourceforge.net
To: minyard@acm.org
Cc: devicetree@vger.kernel.org, arm <arm@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rob Herring <robh+dt@kernel.org>, olof@lixom.net, openipmi-developer@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org, Joel Stanley <joel@jms.id.au>
List-Id: devicetree@vger.kernel.org

On Tuesday, November 8, 2016 12:15:57 PM CET Corey Minyard wrote:
> On 11/08/2016 09:52 AM, C=E9dric Le Goater wrote:
> > O
> snip
> =

> >>>> While we're modifying the binding, should we add a compat string for
> >>>> the ast2500?
> >>> Well, if the change in this patch is fine for all, may be we can add
> >>> the ast2500 compat string in a followup patch ?
> >> Sounds good to me.
> > OK. So, how do we proceed with this patch ? Who would include it in its
> > tree ?
> =

> I don't have anything for 4.9 at the moment.  Arnd, if you have =

> something, can
> you take this?  Otherwise I will.
> =

> And I guess I should add:
> =

> Acked-by: Corey Minyard <cminyard@mvista.com>

Thanks, I've added it to my todo folder.

Olof, if you do fixes before I do, please pick up this patch with
Corey's Ack.

	Arnd

---------------------------------------------------------------------------=
---
Developer Access Program for Intel Xeon Phi Processors
Access to Intel Xeon Phi processor-based developer platforms.
With one year of Intel Parallel Studio XE.
Training and support from Colfax.
Order your platform today. http://sdm.link/xeonphi
