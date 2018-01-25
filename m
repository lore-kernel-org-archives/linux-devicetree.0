From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 5/5] arm64: allwinner: a64: Add DAI nodes
Date: Thu, 25 Jan 2018 09:29:04 +0100
Message-ID: <20180125082904.t4sqob626kyzw4ga@flea.lan>
References: <20180124103943.2062-1-codekipper@gmail.com>
 <20180124103943.2062-6-codekipper@gmail.com>
 <20180124110222.cdglyg5m7644xiem@flea.lan>
 <CAEKpxBk8NXJn4KxEGXx7UddqpUMC65kdEgx1phZDWyUd3ER_3Q@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="524y73kqbp3m57eg"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB3FKU3JQKGQETU5BDCY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAEKpxBk8NXJn4KxEGXx7UddqpUMC65kdEgx1phZDWyUd3ER_3Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--524y73kqbp3m57eg
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Wed, Jan 24, 2018 at 12:39:31PM +0100, Code Kipper wrote:
> On 24 January 2018 at 12:02, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > Hi,
> >
> > On Wed, Jan 24, 2018 at 11:39:43AM +0100, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> >> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>
> >> Add the DAI blocks to the device tree. I2S0 and I2S1 are for
> >> connecting to an external codec.
> >>
> >> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> ---
> >>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 26 ++++++++++++++++++++++++++
> >>  1 file changed, 26 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >> index f060a58f374c..f3354f8c2026 100644
> >> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >> @@ -419,6 +419,32 @@
> >>                       status = "disabled";
> >>               };
> >>
> >> +             i2s0: i2s@1c22000 {
> >> +                     #sound-dai-cells = <0>;
> >> +                     compatible = "allwinner,sun8i-h3-i2s";
> >
> > Same remark than for the spdif, please add a soc-specific compatible.
> 
> Is that really necessary?..

Yes.

> for example on the a20 the functionality of the i2s is the same as
> the a10 so it is down as "allwinner,sun4i-a10-i2s", likewise here
> it's the same as the changes required for the H3. I was planning on
> using the compatible "allwinner,sun50i-a64-i2s" for the audio codec
> as there are some quirks that need to be addressed.

And this is exactly why it is necessary. If we ever find a quirk in
the future, supporting that quirk will be smooth if we already have a
compatible for that SoC in the DT, and a pain if we don't.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--524y73kqbp3m57eg--
