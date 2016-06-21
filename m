From: Florian Vaussard <florian.vaussard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] iio: potentiometer: mcp4531: New parts and device tree
Date: Tue, 21 Jun 2016 08:55:34 +0200
Message-ID: <1466492137-32683-1-git-send-email-florian.vaussard@heig-vd.ch>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Slawomir Stepien <sst-IjDXvh/HVVUAvxtiuMwx3w@public.gmane.org>, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cristina Moraru <cristina.moraru09-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This series first adds support for parts missing from mcp4531 driver
(MCP454x, MCP456x, MCP464x and MCP466x). It then introduces the necessary
device tree binding to perform DT boot.

Tested with MCP4561-103 and MCP4561-503 (DT boot).

Best regards,
Florian

Florian Vaussard (3):
  iio: potentiometer: mcp4531: Add support for MCP454x, MCP456x, MCP464x
    and MCP466x
  iio: potentiometer: mcp4531: Add device tree binding documentation
  iio: potentiometer: mcp4531: Add device tree binding

 .../bindings/iio/potentiometer/mcp4531.txt         |  84 +++++++++++
 drivers/iio/potentiometer/Kconfig                  |   6 +-
 drivers/iio/potentiometer/mcp4531.c                | 155 ++++++++++++++++++++-
 3 files changed, 242 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/potentiometer/mcp4531.txt

-- 
2.5.0
