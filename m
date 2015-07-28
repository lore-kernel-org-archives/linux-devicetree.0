From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V3 3/3] devicetree: da9062: Add device tree bindings for
 DA9062 OnKey
Date: Tue, 28 Jul 2015 09:41:37 +0100
Message-ID: <20150728084137.GN14943@x1>
References: <cover.1437668261.git.stwiss.opensource@diasemi.com>
 <6bfae9b4f5475b59bddc4b71091121f1c0697a2d.1437668261.git.stwiss.opensource@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-input-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6bfae9b4f5475b59bddc4b71091121f1c0697a2d.1437668261.git.stwiss.opensource@diasemi.com>
Sender: linux-input-owner@vger.kernel.org
To: S Twiss <stwiss.opensource@diasemi.com>
Cc: DEVICETREE <devicetree@vger.kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, LINUXINPUT <linux-input@vger.kernel.org>, LINUXKERNEL <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, RTCLINUX <rtc-linux@googlegroups.com>, Rob Herring <robh+dt@kernel.org>, David Dajun Chen <david.chen@diasemi.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Support Opensource <support.opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

On Thu, 23 Jul 2015, S Twiss wrote:

> From: S Twiss <stwiss.opensource@diasemi.com>
>=20
> Add device tree bindings for the DA9062 OnKey driver component
>=20
> Signed-off-by: Steve Twiss <stwiss.opensource@diasemi.com>
>=20
> ---
> Changes in V3:
>  - Child driver specifics separated out into separate document
>    in this case ../input/da9062-onkey.txt
> Changes in V2:
>  - No change
>=20
> This patch applies against linux-next and next-20150708=20
>=20
>=20
>  .../devicetree/bindings/input/da9062-onkey.txt     | 36 ++++++++++++=
++++++++++
>  Documentation/devicetree/bindings/mfd/da9062.txt   |  3 ++

=46or the MFD part:
  Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-input" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
