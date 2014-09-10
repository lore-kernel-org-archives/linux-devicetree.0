From: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Subject: Re: [GIT PULL v2] STiH407 reset controller support
Date: Wed, 10 Sep 2014 15:46:05 +0200
Message-ID: <5410561D.9040707@st.com>
References: <20140909213651.GA591@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140909213651.GA591-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <pza-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Philipp,

On 09/09/2014 11:36 PM, Philipp Zabel wrote:
> Hi Maxime,
>
> I have rebased the STiH407 reset controller patches onto v3.17-rc1.
> The following changes since commit 7d1311b93e58ed55f3a31cc8f94c4b8fe988a2b9:
>
>    Linux 3.17-rc1 (2014-08-16 10:40:26 -0600)
>
> are available in the git repository at:
>
>    git://git.pengutronix.de/git/pza/linux.git tags/reset-for-sti-3.18
>
> for you to fetch changes up to a83a81838a294adbb5356e6b4a3adcda1439d98e:
>
>    reset: sti: Document sti-picophyreset controllers bindings. (2014-09-04 13:05:01 +0200)
>
> ----------------------------------------------------------------
> STiH407 reset controller support
>
> ----------------------------------------------------------------
> Peter Griffin (2):
>        reset: stih407: Add softreset, powerdown and picophy controllers
>        reset: sti: Document sti-picophyreset controllers bindings.
>
>   .../bindings/reset/st,sti-picophyreset.txt         |  42 ++++++
>   drivers/reset/sti/Kconfig                          |   4 +
>   drivers/reset/sti/Makefile                         |   1 +
>   drivers/reset/sti/reset-stih407.c                  | 158 +++++++++++++++++++++
>   .../dt-bindings/reset-controller/stih407-resets.h  |  61 ++++++++
>   5 files changed, 266 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/reset/st,sti-picophyreset.txt
>   create mode 100644 drivers/reset/sti/reset-stih407.c
>   create mode 100644 include/dt-bindings/reset-controller/stih407-resets.h
>

Thanks!

Merged into sti-dt-for-v3.18.
It will be available at:
git://git.stlinux.com/devel/kernel/linux-sti.git
in a couple of hours.

Best regards,
Maxime
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
