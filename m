From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v8.1 1/6] dt-bindings: sram: describe option to reserve
 parts of the memory
Date: Thu, 27 Feb 2014 20:16:23 +0100
Message-ID: <201402272016.23521.arnd@arndb.de>
References: <21117503.1c6iOkvYSr@phil> <201402251419.31151.arnd@arndb.de>
 <2574291.evU61mFTUd@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2574291.evU61mFTUd@phil>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Sachin Kamat <sachin.kamat@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, arm@kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Grant Likely <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 26 February 2014, Heiko St=FCbner wrote:
> Some SoCs need parts of their sram for special purposes. So while being p=
art
> of the peripheral, it should not be part of the genpool controlling the s=
ram.
> =

> Therefore add the option to define reserved regions as subnodes of the
> sram-node similar to defining reserved global memory regions.
> =

> Originally
> Suggested-by: Rob Herring <robherring2@gmail.com>
> =

> Using subnodes for reserved regions
> Suggested-by: Grant Likely <grant.likely@linaro.org>
> =

> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Ulrich Prinz <ulrich.prinz@googlemail.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
