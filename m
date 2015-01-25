From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH V2] clockevents: rockchip: Add rockchip timer for rk3288
Date: Sun, 25 Jan 2015 22:28:21 +0100
Message-ID: <1728434.WELQfpY90C@diego>
References: <1422178979-12382-1-git-send-email-daniel.lezcano@linaro.org> <2285293.ZBcGIuxxDo@diego> <54C55D1A.9010706@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54C55D1A.9010706-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Daniel,

Am Sonntag, 25. Januar 2015, 22:16:10 schrieb Daniel Lezcano:
> On 01/25/2015 09:52 PM, Heiko St=FCbner wrote:
> > one big request and some more style nitpicks :-)
> >=20
> > With the nitpicks fixed
> > Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> >=20
> >=20
> > Before applying this patch could you drop the rk3288.dtsi change pl=
ease?
> > Instead I'd like to add the following patch separately to _my_ devi=
cetree
> > branch for 3.20.
> >=20
> > I already wasn't fast enough to prevent the ethernet controller cha=
nges
> > going through the network tree and would like to prevent a third tr=
ee
> > sending changes for the same dts area to Linus - merge conflicts an=
d all.
> >=20
> >=20
> > I don't think that neither the nitpicks nor dropping the dtsi segme=
nt need
> > another submission though.
>=20
> Hi Heiko,
>=20
> I removed the dtsi change, fixed the spaces indentation and pushed in=
 my
> tree the driver [1]

and I pushed the corresponding dt change to [2] and am going to send th=
e
pull request to arm-soc in the next days.


Heiko


[2] https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.g=
it/log/?h=3Dv3.20-armsoc/dts
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
