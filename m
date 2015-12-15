From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 1/3] extcon: arizona: Add device bindings for the micd
 configurations
Date: Tue, 15 Dec 2015 10:00:00 +0900
Message-ID: <566F6610.1050402@samsung.com>
References: <1450089433-11398-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1450089433-11398-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com, robh@kernel.org
List-Id: devicetree@vger.kernel.org

On 2015=EB=85=84 12=EC=9B=94 14=EC=9D=BC 19:37, Charles Keepax wrote:
> Add device bindings to support configuring the jack detection
> configurations. Each configuration needs to specify the connection of
> the mic det pins, which micbias should be used and the value of the
> micd polarity GPIO required to activate that configuration.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>=20
> Changes since v1:
>  - Report error from arizona_extcon_get_micd_configs
>=20
> Thanks,
> Charles
>=20
>  drivers/extcon/extcon-arizona.c | 56 +++++++++++++++++++++++++++++++=
++++++++--
>  1 file changed, 54 insertions(+), 2 deletions(-)

Applied it.

Thanks,
Chanwoo Choi
