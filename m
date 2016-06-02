From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] of: use pr_fmt prefix for all console printing
Date: Thu, 02 Jun 2016 13:10:06 -0700
Message-ID: <1464898206.9273.2.camel@perches.com>
References: <1464880499-29864-1-git-send-email-robh@kernel.org>
	 <57506DDC.3060804@gmail.com>
	 <CAL_JsqLrC27EOkWfRtzUOZox5wkRU=qEb+b3z2JQG++e5uSGSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLrC27EOkWfRtzUOZox5wkRU=qEb+b3z2JQG++e5uSGSg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>
List-Id: devicetree@vger.kernel.org

On Thu, 2016-06-02 at 14:56 -0500, Rob Herring wrote:
> On Thu, Jun 2, 2016 at 12:33 PM, Frank Rowand <frowand.list@gmail.com=
> wrote:
[]
> > > @@ -355,8 +355,6 @@ int of_overlay_create(struct device_node *tre=
e)
> > >=20
> > > =A0=A0=A0=A0=A0=A0id =3D idr_alloc(&ov_idr, ov, 0, 0, GFP_KERNEL)=
;
> > > =A0=A0=A0=A0=A0=A0if (id < 0) {
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pr_err("%s: idr_alloc() f=
ailed for tree@%s\n",
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0__func__, tree->full_name);
> > Every other error in of_overlay_create() results in a pr_err().
> > (The other cases of removing pr_err() in this file are fine, becaus=
e
> > the errors are already reported in the functions called from this
> > function.)
> >=20
> > I would recommend leaving in the pr_err() for idr_alloc() failure.
> I was thinking idr_alloc is going to call kmalloc which will print
> errors on failure, but there may be some case it doesn't.

Only if __GFP_NOWARN is used.
And it's not used in any idr_alloc call.
