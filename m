From: Laurentiu Palcu <laurentiu.palcu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] staging: iio: light: isl29018: add support for other chips
Date: Fri, 29 Aug 2014 17:26:19 +0300
Message-ID: <1409322382-30021-1-git-send-email-laurentiu.palcu@intel.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Laurentiu Palcu <laurentiu.palcu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Teodora Baluta <teodora.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

This patchset adds support for 2 similar ALS chips: ISL29023 and ISL29035.

The chip I performed tests on was a ISL29035, since I didn't have eval boards, for the
other 2 chips, handy.

The registers tables for each chip can be found here:

ISL29018: [1] - page 10
ISL29023: [2] - page 8
ISL29035: [3] - page 10

[1] http://www.intersil.com/content/dam/Intersil/documents/isl2/isl29018.pdf
[2] http://www.intersil.com/content/dam/Intersil/documents/isl2/isl29023.pdf
[3] http://www.intersil.com/content/dam/Intersil/documents/isl2/isl29035.pdf

thanks,
laurentiu

Laurentiu Palcu (3):
  staging: iio: light: isl29018: fix typo
  staging: iio: light: isl29018: add support for isl29023 and isl29035
  staging: iio: light: isl29018: add ACPI support

 drivers/staging/iio/light/isl29018.c | 205 ++++++++++++++++++++++++++++++-----
 1 file changed, 179 insertions(+), 26 deletions(-)

-- 
1.9.1
