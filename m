From: Jacob Chen <jacobchen110-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 02/16] media: doc: add document for rkisp1 meta buffer
 format
Date: Thu, 8 Mar 2018 17:59:44 +0800
Message-ID: <CAFLEztSPXP6DsyZAiwS8j4-g4Qxjuku_9wfrOYs1o-0w=s5Wpg@mail.gmail.com>
References: <1514533978-20408-1-git-send-email-zhengsq@rock-chips.com>
 <1514533978-20408-3-git-send-email-zhengsq@rock-chips.com>
 <917c22c0-773e-5fe5-5625-86678f7c8521@xs4all.nl>
 <CAFLEztR1XyFMS_Gf-qT7vs9OHipeBfuXQ7mXJoCBDyBSvTWUag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAFLEztR1XyFMS_Gf-qT7vs9OHipeBfuXQ7mXJoCBDyBSvTWUag-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: Jose Abreu <Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eddie Cai <eddie.cai.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joao Pinto <Joao.Pinto-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jacob Chen <jacob-chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Luis Oliveira <Luis.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?B?6ZKf5Lul5bSH?= <zyc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Allon Huang <allon.huang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shunqian Zheng <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Hans,

2018-02-06 22:27 GMT+08:00 Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>:
> On 12/29/17 08:52, Shunqian Zheng wrote:
>> From: Jacob Chen <jacob2.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>
>> This commit add docuemnt for rkisp1 meta buffer format
>>
>> Signed-off-by: Jacob Chen <jacob-chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>>  Documentation/media/uapi/v4l/meta-formats.rst          |  2 ++
>>  .../media/uapi/v4l/pixfmt-meta-rkisp1-params.rst       | 17 +++++++++++++++++
>>  .../media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst         | 18 ++++++++++++++++++
>>  3 files changed, 37 insertions(+)
>>  create mode 100644 Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
>>  create mode 100644 Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
>>
>> diff --git a/Documentation/media/uapi/v4l/meta-formats.rst b/Documentation/media/uapi/v4l/meta-formats.rst
>> index 01e24e3..1b82814 100644
>> --- a/Documentation/media/uapi/v4l/meta-formats.rst
>> +++ b/Documentation/media/uapi/v4l/meta-formats.rst
>> @@ -14,3 +14,5 @@ These formats are used for the :ref:`metadata` interface only.
>>
>>      pixfmt-meta-vsp1-hgo
>>      pixfmt-meta-vsp1-hgt
>> +    pixfmt-meta-rkisp1-params
>> +    pixfmt-meta-rkisp1-stat
>> diff --git a/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst b/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
>> new file mode 100644
>> index 0000000..ed344d4
>> --- /dev/null
>> +++ b/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
>> @@ -0,0 +1,17 @@
>> +.. -*- coding: utf-8; mode: rst -*-
>> +
>> +.. _v4l2-meta-fmt-rkisp1-params:
>> +
>> +*******************************
>> +V4L2_META_FMT_RK_ISP1_PARAMS
>> +*******************************
>> +
>> +Rockchip ISP1 Parameters Data
>> +
>> +Description
>> +===========
>> +
>> +This format describes input parameters for the Rockchip ISP1.
>> +
>> +The data use c-struct :c:type:`rkisp1_isp_params_cfg`, which is defined in
>> +the ``linux/rkisp1-config.h`` header file, See it for details.
>
> One more question: does the ISP produce a reasonable picture if it doesn't
> receive these params? If not (i.e. you always need to provide params), then
> I think you should provide a default rkisp1_isp_params_cfg struct that
> can be used as a template for application writers.
>
> Perhaps it can be part of the driver as the initial params config.
>
> I think even if the ISP does work without params it is still worthwhile
> doing this. The params are complex and having an example on how to initialize
> it would be helpful.
>

The ISP don't need a default rkisp1_isp_params_cfg to produce picture,
those params just effect image quality and stats data.

The params are not very complex.
They consist of multiple modules and each of modules can be
enabled/disable/updated individually.

> Regards,
>
>         Hans
>
>> diff --git a/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst b/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
>> new file mode 100644
>> index 0000000..5ecc403
>> --- /dev/null
>> +++ b/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
>> @@ -0,0 +1,18 @@
>> +.. -*- coding: utf-8; mode: rst -*-
>> +
>> +.. _v4l2-meta-fmt-rkisp1-stat:
>> +
>> +*******************************
>> +V4L2_META_FMT_RK_ISP1_STAT_3A
>> +*******************************
>> +
>> +Rockchip ISP1 Statistics Data
>> +
>> +Description
>> +===========
>> +
>> +This format describes image color statistics information generated by the Rockchip
>> +ISP1.
>> +
>> +The data use c-struct :c:type:`rkisp1_stat_buffer`, which is defined in
>> +the ``linux/cifisp_stat.h`` header file, See it for details.
>>
>
