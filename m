From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2] of: restore old handling of cells_name=NULL in
 of_*_phandle_with_args()
Date: Thu, 19 Sep 2019 08:19:44 +0200
Message-ID: <20190919061943.ga7jwdn4ednulvgs@pengutronix.de>
References: <20190918063837.8196-1-u.kleine-koenig@pengutronix.de>
 <b00ca30f-2c06-7722-96b2-123d15751cb6@axentia.se>
 <20190918084748.hnjkiq7wc5b35wjh@pengutronix.de>
 <CAL_JsqJuJrOj+D4xkGACC1=zaB5OUkt=SNzCOiOiTVtM9E9z+A@mail.gmail.com>
 <20190918201954.2phyqxqhoj5jwklt@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190918201954.2phyqxqhoj5jwklt@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Frank Rowand <frowand.list@gmail.com>, Joerg Roedel <joro@8bytes.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, Peter Rosin <peda@axentia.se>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 18, 2019 at 10:19:54PM +0200, Uwe Kleine-König wrote:
> On Wed, Sep 18, 2019 at 03:09:06PM -0500, Rob Herring wrote:
> > Can I get a proper patch please.
> 
> I don't understand what is wrong with my patch. Can you please expand
> what you are missing? I just tried to git-am it and the result looks
> fine.

I see that the commit this patch is fixing isn't in Linus' tree yet. Do
you want instead of this commit fixing the previous one a single good
patch that replaces e42ee61017f5 ("of: Let of_for_each_phandle fallback
to non-negative cell_count")?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
