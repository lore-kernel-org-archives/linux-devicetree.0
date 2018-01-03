From: Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v5 0/5] Add OV5640 parallel interface and RGB565/YUYV support
Date: Wed, 3 Jan 2018 10:57:27 +0100
Message-ID: <1514973452-10464-1-git-send-email-hugues.fruchet@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Enhance OV5640 CSI driver to support also DVP parallel interface.
Add RGB565 (LE & BE) and YUV422 YUYV format in addition to existing
YUV422 UYVY format.
Some other improvements on chip identifier check and removal
of warnings in powering phase around gpio handling.

===========
= history =
===========
version 5:
  - Refine bindings as per Sakari suggestion:
    https://www.mail-archive.com/linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg124048.html

version 4:
  - Refine bindings as per Sakari suggestion:
    https://www.mail-archive.com/linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg123609.html
  - Parallel port control lines polarity can now be configured through
    devicetree

version 3:
  - Move chip identifier check at probe according to Fabio Estevam comment:
    https://www.mail-archive.com/linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg122575.html
  - Use 16 bits register read for this check as per Steve Longerbeam comment:
    https://www.mail-archive.com/linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg122692.html
  - Update bindings to document parallel mode support as per Fabio Estevam comment:
    https://www.mail-archive.com/linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg122576.html
  - Enable the whole 10 bits parallel output and document 8/10 bits support
    in ov5640_set_stream_dvp() to answer to Steve Longerbeam comment:
    https://www.mail-archive.com/linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg122693.html

version 2:
  - Fix comments from Sakari Ailus:
    https://www.mail-archive.com/linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg122259.html
  - Revisit ov5640_set_stream_dvp() to only configure DVP at streamon
  - Revisit ov5640_set_stream_dvp() implementation with fewer register settings

version 1:
  - Initial submission

Hugues Fruchet (5):
  media: ov5640: switch to gpiod_set_value_cansleep()
  media: ov5640: check chip id
  media: dt-bindings: ov5640: refine CSI-2 and add parallel interface
  media: ov5640: add support of DVP parallel interface
  media: ov5640: add support of RGB565 and YUYV formats

 .../devicetree/bindings/media/i2c/ov5640.txt       |  46 ++-
 drivers/media/i2c/ov5640.c                         | 325 ++++++++++++++++++---
 2 files changed, 324 insertions(+), 47 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
