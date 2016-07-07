From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v7 1/4] MAINTAINERS: Add entry for APM X-Gene SoC PMU
 driver
Date: Wed, 06 Jul 2016 17:43:44 -0700
Message-ID: <1467852224.8360.60.camel@perches.com>
References: <1467850045-10584-1-git-send-email-ttnguyen@apm.com>
 <1467850045-10584-2-git-send-email-ttnguyen@apm.com>
 <1467850751.8360.56.camel@perches.com>
 <CACgAJHyvusvRPKNaxHLFK=gWw2UUtjV80H175eRu6EieutxNiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACgAJHyvusvRPKNaxHLFK=gWw2UUtjV80H175eRu6EieutxNiw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tai Tri Nguyen <ttnguyen@apm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, catalin.marinas@arm.com, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, patches <patches@apm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2016-07-06 at 17:35 -0700, Tai Tri Nguyen wrote:
> Hi Joe,

Ch=E0o Tai.

> On Wed, Jul 6, 2016 at 5:19 PM, Joe Perches <joe@perches.com> wrote:
> > On Wed, 2016-07-06 at 17:07 -0700, Tai Nguyen wrote:
[]
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > []
> > > =

> > > @@ -8593,6 +8593,14 @@ L:=A0=A0=A0=A0=A0linux-scsi@vger.kernel.org
> > > =A0S:=A0=A0=A0Supported
> > > =A0F:=A0=A0=A0drivers/scsi/pm8001/
> > > =

> > > +PMU-XGENE
> > > +APPLIED MICRO (APM) X-GENE SOC PMU
> > One line section header please.
> Is this strictly required?

Yes.

get_maintainer.pl doesn't like multiple line section headers.
