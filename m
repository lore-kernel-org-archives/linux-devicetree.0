From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 1/6] dt-bindings: connector: add optional properties
 for Type-B
Date: Fri, 26 Apr 2019 08:19:40 -0500
Message-ID: <CAL_Jsq+2jWJHm3-5BU6NUqFsSN=K15douOyYWeKoKseqhPDysw@mail.gmail.com>
References: <1556261237-13823-1-git-send-email-chunfeng.yun@mediatek.com> <1556261237-13823-2-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556261237-13823-2-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 26, 2019 at 1:47 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> Add id-gpios, vbus-gpios, vbus-supply and pinctrl properties for
> usb-b-connector
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v4 no changes
>
> v3 changes:
>  1. add GPIO direction, and use fixed-regulator for GPIO controlled
>     VBUS regulator suggested by Rob;
>
> v2 changes:
>   1. describe more clear for vbus-gpios and vbus-supply suggested by Hans
> ---
>  .../bindings/connector/usb-connector.txt           | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
