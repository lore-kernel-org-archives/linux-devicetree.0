From: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v6 0/1] iio:pressure:ms5611: fix and enhancements
Date: Wed, 9 Mar 2016 12:34:06 +0100
Message-ID: <cover.1457522751.git.gregor.boirie@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Tomasz Duszynski <tduszyns-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Changes since v1:
* temperature compensation fix:
    * reword commit message
    * remove useless parenthesis
* power regulator: reword commit message
* add oversampling rate support

Changes since v2:
* remove non printable characters from commit messages

Changes since v3:
* drop first 3 patches since applied onto testing
* fix oops at regulator probing time if regulator support not compiled-in
* complete device-tree support and documentation
* remove continuous sampling support (see Jonathan's "kthread tight loop
  trigger" proposal)
* checkpatch'ed

Changes since v4:
* drop first 2 patches since applied
* amend commit to include "Fixes" tag

Changes since v5:
* reword patch subject line and include "Fixes" tag in commit message

Gregor Boirie (1):
  iio:pressure:ms5611: fix crash when probing regulator

 drivers/iio/pressure/ms5611_core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
2.1.4
