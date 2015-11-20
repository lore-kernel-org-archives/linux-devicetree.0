From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v3 0/6] Arizona Extcon Update Device Bindings
Date: Fri, 20 Nov 2015 11:07:34 +0900
Message-ID: <564E8066.8080006@samsung.com>
References: <1447947940-3054-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1447947940-3054-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Hi,

On 2015=EB=85=84 11=EC=9B=94 20=EC=9D=BC 00:45, Charles Keepax wrote:
> This patch chain adds device bindings for the jack and
> microphone detection system specific settings.
>=20
> Changes since v2:
>  - Now moved things over to the new extcon binding document
>=20
> Thanks,
> Charles
>=20
> Charles Keepax (6):
>   extcon: arizona: Add device binding to enable ADC mode micdet
>   extcon: arizona: Add device binding for the general purpose switch
>   extcon: arizona: Add device binding for jack detect polarity
>     inversion
>   extcon: arizona: Add device binding for second jack detect pin on
>     GPIO5
>   extcon: arizona: Update DT binding documentation for mic detection
>   extcon: arizona: Update DT binding documentation for jack detection
>=20
>  .../devicetree/bindings/extcon/extcon-arizona.txt  |   26 ++++++++++=
++++++++++
>  drivers/extcon/extcon-arizona.c                    |   13 ++++++++++
>  2 files changed, 39 insertions(+), 0 deletions(-)
>=20

Applied them.

Thanks,
Chanwoo Choi
