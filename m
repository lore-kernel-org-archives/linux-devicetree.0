From: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>
Subject: Re: [PATCH] ARM: dts: OMAP4: Cleanup and move GIC outside of the OCP node
Date: Mon, 3 Sep 2012 22:47:51 -0700
Message-ID: <CAMQu2gz7M7zWogTdCtR6K3n-9CPoLf7NO4a314WmKhN-BeXCiQ@mail.gmail.com>
References: <5044D8E5.5010705@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <5044D8E5.5010705@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Benoit Cousson <b-cousson@ti.com>
Cc: "tony@atomide.com" <tony@atomide.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 3, 2012 at 9:20 AM, Benoit Cousson <b-cousson@ti.com> wrote:
> Remove a useless comment and move GIC controller outside
> of the OCP node since it does use the MPU internal bus and
> not the OCP.
> This will not change the functionality but will reflect the
> reality more accurately.
>
> Signed-off-by: Benoit Cousson <b-cousson@ti.com>
> ---
>
Make sense.
Acked-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
