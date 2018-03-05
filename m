From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
Subject: Re: [linux-sunxi] [PATCH v3 15/16] ARM: dts: sun8i: h3: Enable HDMI
 output on H3 boards
Date: Mon, 05 Mar 2018 19:24:44 +0100
Message-ID: <24923386.1anQU1Bm90@jernej-laptop>
References: <20180301213442.16677-1-jernej.skrabec@siol.net>
 <20180301213442.16677-16-jernej.skrabec@siol.net>
 <57afe052-9a8c-f63b-ee43-5bad8cd1d193@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <57afe052-9a8c-f63b-ee43-5bad8cd1d193@iki.fi>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: joonas.kylmala@iki.fi
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie, mturquette@baylibre.com, wens@csie.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, sboyd@kernel.org, linux-sunxi@googlegroups.com, robh+dt@kernel.org, maxime.ripard@free-electrons.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi!

Dne ponedeljek, 05. marec 2018 ob 16:27:00 CET je Joonas Kylm=E4l=E4 napisa=
l(a):
> Jernej Skrabec:
> > +&hdmi_out {
> > +	hdmi_out_con: endpoint {
> > +		remote-endpoint =3D <&hdmi_con_in>;
> > +	};
> > +};
> =

> This node is added to all the DTS files you enabled HDMI on. Is it
> something that could be instead put to the DTSI file?

I guess that would mean also including connector node (hdmi_con_in) in DTSI=
, =

since it is referenced inside. However, not all boards have HDMI connector,=
 so =

I didn't include it in DTSI.

Best regards,
Jernej
