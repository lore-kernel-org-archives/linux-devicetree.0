From: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 0/2] media: add support for DW9768 VCM driver
Date: Mon, 22 Jul 2019 15:56:00 +0900
Message-ID: <CAHD77HkDrGgiTceE2jLX8Tqc8GH9R1UyRhiU83=HRvZKjoDYjw@mail.gmail.com>
References: <20190708100641.2702-1-dongchun.zhu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190708100641.2702-1-dongchun.zhu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, shengnan.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Louis Kuo <louis.kuo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sj Huang <sj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, dongchun.zhu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cao Bing Bu <bingbu.cao-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "list-Y9sIeH5OGRo@public.gmane.org:IOMMU DRIVERS <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>,
 Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, " <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 8, 2019 at 7:12 PM <dongchun.zhu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>
> From: Dongchun Zhu <dongchun.zhu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>
> Hello,
>
> Add a v4l2 sub-device driver for Dongwoon's DW9768 lens voice coil.
> This is a voice coil module using the i2c bus to control the focus position.
>
> The DW9768 can control the position with 10 bits value and
> consists of two 8 bit registers show as below:
> register 0x04(DW9768_REG_POSITION):
>     +---+---+---+---+---+---+---+---+
>     |D07|D06|D05|D04|D03|D02|D01|D00|
>     +---+---+---+---+---+---+---+---+
> register 0x03:
>     +---+---+---+---+---+---+---+---+
>     |---|---|---|---|---|---|D09|D08|
>     +---+---+---+---+---+---+---+---+
>
> This driver support :
>  - set DW9768 to standby mode once suspend and turn it back to active if resume
>  - set the position via V4L2_CID_FOCUS_ABSOLUTE ctrl
>
> Dongchun Zhu (2):
>   media: i2c: dw9768: Add DT support and MAINTAINERS entry
>   media: i2c: dw9768: Add DW9768 VCM driver
>
>  .../bindings/media/i2c/dongwoon,dw9768.txt         |   9 +
>  MAINTAINERS                                        |   8 +
>  drivers/media/i2c/Kconfig                          |  10 +
>  drivers/media/i2c/Makefile                         |   1 +
>  drivers/media/i2c/dw9768.c                         | 458 +++++++++++++++++++++
>  5 files changed, 486 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.txt
>  create mode 100644 drivers/media/i2c/dw9768.c
>
> --
> 2.9.2
>

Gentle ping. Some help with review would be appreciated!

Best regards,
Tomasz
