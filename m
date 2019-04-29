From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 2/5] mtd: onenand/samsung: Make sure that bus clock is
 enabled
Date: Mon, 29 Apr 2019 10:18:15 +0200
Message-ID: <20190429101815.0f25830d@xps13>
References: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
        <20190426164224.11327-3-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190426164224.11327-3-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: kyungmin.park@samsung.com, bbrezillon@kernel.org, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Paweł,

Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com> wrote on Fri, 26 Apr 2019
18:42:21 +0200:

> From: Tomasz Figa <tomasz.figa@gmail.com>
> 
> This patch adds basic handling of controller bus clock to make sure that
> in device probe it is enabled and device can operate correctly. The
> clock is optional and driver behavior is identical as before this patch
> if not provided.
> 
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
