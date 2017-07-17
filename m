From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3.1 1/2] extcon: cros-ec: Add extcon-cros-ec driver to
 support display out.
Date: Mon, 17 Jul 2017 19:08:13 +0900
Message-ID: <32ac2a89-37a1-44f5-f73a-45f0ac78ced6@samsung.com>
References: <CGME20170717094153epcas4p14893c032ba1719063772e38feb2682bb@epcas4p1.samsung.com>
        <20170717094140.6596-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20170717094140.6596-1-enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Content-language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lee,

On 2017년 07월 17일 18:41, Enric Balletbo i Serra wrote:
> From: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> 
> This is the driver for the USB Type C cable detection mechanism
> built into the ChromeOS Embedded Controller on systems that
> have USB Type-C ports.
> 
> At present, this allows for the presence of display out, but in
> future, it may also be used to notify host and device type cables
> and the presence of power.
> 
> Signed-off-by: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> Acked-by: Chanwoo Choi <cw00.chio-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---

Applied these patches on extcon-next branch.
I created the immutable branch both extcon and mfd
because this patch handled the 'linux/mfd/cros_ec_commands.h' file.
(branch name ib-extcon-mfd-4.14)

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics


The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

  Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon.git ib-extcon-mfd-4.14

for you to fetch changes up to 77daeeddd3db21906b53ae77c6d2d2342470af9d:

  dt-bindings: extcon: Add support for cros-ec device (2017-07-17 19:02:43 +0900)

----------------------------------------------------------------
Benson Leung (2):
      extcon: cros-ec: Add extcon-cros-ec driver to support display out.
      dt-bindings: extcon: Add support for cros-ec device

 .../bindings/extcon/extcon-usbc-cros-ec.txt        |  24 ++
 drivers/extcon/Kconfig                             |   7 +
 drivers/extcon/Makefile                            |   1 +
 drivers/extcon/extcon-usbc-cros-ec.c               | 415 +++++++++++++++++++++
 include/linux/mfd/cros_ec_commands.h               |  75 ++++
 5 files changed, 522 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/extcon/extcon-usbc-cros-ec.txt
 create mode 100644 drivers/extcon/extcon-usbc-cros-ec.c


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
