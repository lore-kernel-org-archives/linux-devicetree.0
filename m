From: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/7] mfd: update on max8925 for DT support
Date: Fri, 23 Nov 2012 17:09:28 +0800
Message-ID: <CAN1soZzAZ9Od_5jC0ZFdw03c5P9Q+gJQswTwp0M1YWM_ti+9xw@mail.gmail.com>
References: <1352187305-9660-1-git-send-email-qingx@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1352187305-9660-1-git-send-email-qingx-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Qing Xu <qingx-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, cxie4-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 6, 2012 at 3:35 PM, Qing Xu <qingx-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org> wrote:
> From: Qing Xu <qingx-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
>
> 1. add irqdomain for max8925, it is necessary for dt support
> 2. bug fix in max8925 mfd devices'irq base and device registry failure
> 3. support DT for max8925 mfd devices
>
> Qing Xu (7):
>   mfd: max8925: add irqdomain for dt
>   mfd: max8925: fix mfd device register failure
>   mfd: max8925: fix onkey driver irq base
>   mfd: max8925: support dt for power supply
>   mfd: max8925: support dt for regulator
>   mfd: max8925: support dt for backlight
>   mfd: max8925: add dts
>
>  arch/arm/boot/dts/mmp2-brownstone.dts |  166 +++++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/mmp2.dtsi           |    4 +-
>  drivers/input/misc/max8925_onkey.c    |    3 -
>  drivers/mfd/max8925-core.c            |  107 +++++++++++++--------
>  drivers/mfd/max8925-i2c.c             |   32 ++++++-
>  drivers/power/max8925_power.c         |   57 ++++++++++-
>  drivers/regulator/max8925-regulator.c |   35 +++++++-
>  drivers/video/backlight/max8925_bl.c  |   31 ++++++-
>  include/linux/mfd/max8925.h           |   12 ++-
>  9 files changed, 389 insertions(+), 58 deletions(-)
>

No document on devicetree binding?
