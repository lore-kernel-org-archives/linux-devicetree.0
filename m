From: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [GIT PULL] Qualcomm Fixes for 4.16
Date: Sun, 21 Jan 2018 16:02:37 -0600
Message-ID: <1516572157-968-1-git-send-email-andy.gross@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Loys Ollivier <lollivier-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Arnd/Olof/Kevin,

Please take this fix for 4.16.  This applies on top of the current next
(next-20190119).

Thanks,

Andy

The following changes since commit 761914dd2975bc443024f0ec10a66a26b7186ec2:

  Add linux-next specific files for 20180119 (2018-01-19 17:51:17 +1100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/agross/linux.git tags/qcom-fixes-for-4.16

for you to fetch changes up to a218c67e4eb95287129b56c20a94b9ea0d8917e5:

  of: platform: fix OF node refcount leak (2018-01-21 15:01:34 -0600)

----------------------------------------------------------------
Qualcomm Fixes for 4.16

* Fix OF node refcount leak

----------------------------------------------------------------
Sudeep Holla (1):
      of: platform: fix OF node refcount leak

 drivers/of/platform.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
