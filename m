From: David Brown <davidb@codeaurora.org>
Subject: Re: [PATCH] ARM: msm: Fix gic irqdomain support
Date: Mon, 23 Apr 2012 16:09:49 -0700
Message-ID: <20120423230949.GA31173@codeaurora.org>
References: <1335221222-30879-1-git-send-email-davidb@codeaurora.org>
 <CACxGe6sPkW8WviMX=oJEj+-G7XMeaWaQYfe_hg2quB-Sh2gEDA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6sPkW8WviMX=oJEj+-G7XMeaWaQYfe_hg2quB-Sh2gEDA@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Daniel Walker <dwalker@fifo99.com>, Bryan Huntsman <bryanh@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 23, 2012 at 04:55:11PM -0600, Grant Likely wrote:
> On Mon, Apr 23, 2012 at 4:47 PM, David Brown <davidb@codeaurora.org> =
wrote:
> > As of
> >
> > =A0 =A0commit 75294957be1dee7d22dd7d90bd31334ba410e836
> > =A0 =A0Author: Grant Likely <grant.likely@secretlab.ca>
> > =A0 =A0Date: =A0 Tue Feb 14 14:06:57 2012 -0700
> >
> > =A0 =A0 =A0 =A0irq_domain: Remove 'new' irq_domain in favour of the=
 ppc one
> >
> > the ARM gic controller uses proper irq domains. =A0Fix the MSM gic
> > initialization and DT so that it works again.
> >
> > Signed-off-by: David Brown <davidb@codeaurora.org>
>=20
> Acked-by: Grant Likely <grant.likely@secretlab.ca>
>=20
> This should go via the arm-soc tree I think

I was planning on going that route.

Thanks

--=20
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora For=
um.
