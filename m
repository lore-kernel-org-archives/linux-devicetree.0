From: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 0/3] iio:pressure:ms5611: fix and enhancements
Date: Tue, 1 Mar 2016 11:31:35 +0100
Message-ID: <cover.1456828051.git.gregor.boirie@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
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
* fix oops at regulator probing time if regulator support not compiled-=
in
* complete device-tree support and documentation
* remove continuous sampling support (see Jonathan's "kthread tight loo=
p
  trigger" proposal)
* checkpatch'ed

Gregor Boirie (2):
  iio:pressure:ms5611: fix oops when probing regulator
  iio:pressure:ms5611: oversampling rate support

Gr=C3=A9gor Boirie (1):
  iio:pressure:ms5611: complete DT support

 .../devicetree/bindings/iio/pressure/ms5611.txt    |  19 ++++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/iio/pressure/ms5611.h                      |  20 ++--
 drivers/iio/pressure/ms5611_core.c                 | 113 +++++++++++++=
+++++++-
 drivers/iio/pressure/ms5611_i2c.c                  |  25 +++--
 drivers/iio/pressure/ms5611_spi.c                  |  32 ++++--
 6 files changed, 185 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/pressure/ms56=
11.txt

--=20
2.1.4
