From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [1/3] ARM: dts: imx51-zii-common: create common include dtsi
Date: Sun, 1 Jul 2018 16:21:21 +0800
Message-ID: <20180701082119.GH4348@dragon>
References: <1529603100-31958-2-git-send-email-andrey.gusakov@cogentembedded.com>
 <5a3490a5-ee5c-a4da-8b54-b5234b7e50d0@yandex.ru>
 <CAHQ1cqH0o2rsVJWccR6dBXQCnp2-mmLNTNOi0uAOO2SSdz0+xA@mail.gmail.com>
 <CAOMZO5B5PS7a6SFfzX915AkRoDpeFVV7P0hrG9A51yWRFy5X_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5B5PS7a6SFfzX915AkRoDpeFVV7P0hrG9A51yWRFy5X_w@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Andrey Gusakov <andrey.gusakov@cogentembedded.com>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, nikita.yoush@yandex.ru, Fabio Estevam <fabio.estevam@nxp.com>, Chris Healy <cphealy@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 27, 2018 at 02:00:11PM -0300, Fabio Estevam wrote:
> On Wed, Jun 27, 2018 at 1:46 PM, Andrey Smirnov
> <andrew.smirnov@gmail.com> wrote:
> 
> > We are now starting to give Andrey Gusakov conflicting
> > recommendations. For the sake of moving forward, can we agree that
> > this and similar comments are relatively minor and defer to the
> > maintainers to make a call which way to go?
> > This way Andrey has a clear way on how to move forward with this set.
> 
> The approach in this patched looked fine to me as well.
> 
> Maybe we can have some feedback from Shawn?

I'm overall fine with the approach as well.  But I agree with Nikita's
comment that having pinctrl definition and usage spread in different
files makes reader's life harder.  So I would suggest that we have the
following properties in imx51-zii-rdu1.dts as well.

	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_swi2c>;

Shawn
