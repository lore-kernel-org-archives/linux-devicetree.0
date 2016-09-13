From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Subject: Re: [PATCH v2 1/2] ARM: dts: imx6ul: Add DTS for liteSOM module
Date: Tue, 13 Sep 2016 13:52:48 +0200
Message-ID: <5c6db9d0-e7b2-e3fd-11e6-be1bde6e65e7@armadeus.com>
References: <20160913094951.26394-1-m.niestroj@grinn-global.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160913094951.26394-1-m.niestroj@grinn-global.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marcin Niestroj <m.niestroj@grinn-global.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello,

On 09/13/2016 11:49 AM, Marcin Niestroj wrote:

> +
> +&cpu0 {
> +	arm-supply =3D <&reg_arm>;
> +	soc-supply =3D <&reg_soc>;
> +};

These supplies are already set in the imx6ul.dtsi file.

Regards,

-- =

S=E9bastien Szymanski
