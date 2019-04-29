From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 1/5] mtd: onenand/samsung: Unify resource order for
 controller variants
Date: Mon, 29 Apr 2019 10:16:44 +0200
Message-ID: <20190429101644.7c46c05d@xps13>
References: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
        <20190426164224.11327-2-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190426164224.11327-2-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: kyungmin.park@samsung.com, bbrezillon@kernel.org, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Paweł,

Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com> wrote on Fri, 26 Apr 2019
18:42:20 +0200:

> From: Tomasz Figa <tomasz.figa@gmail.com>
> 
> Before this patch, the order of memory resources requested by the driver
> was controller base as first and OneNAND chip base as second for
> S3C64xx/S5PC100 variant and the opposite for S5PC110/S5PV210 variant.
> 
> To make this more consistent, this patch swaps the order of resources
> for the latter and updates platform code accordingly. As a nice side
> effect there is a slight reduction in line count of probe function.
> 
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>

Thanks for the patch but it looks like you also are renaming fields in
the main onenand structure. Maybe it is worth doing it in a preliminary
patch.

Thanks,
Miquèl
