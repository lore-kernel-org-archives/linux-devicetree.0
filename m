From: Jungo Lin <jungo.lin@mediatek.com>
Subject: [RFC,v5, 3/5] media: videodev2.h: Add new boottime timestamp type
Date: Mon, 2 Sep 2019 15:51:33 +0800
Message-ID: <20190902075135.1332-4-jungo.lin@mediatek.com>
References: <Jungo Lin <jungo.lin@mediatek.com>
 <20190902075135.1332-1-jungo.lin@mediatek.com>
Reply-To: Jungo Lin <jungo.lin@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190902075135.1332-1-jungo.lin@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: tfiga@chromium.org, hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com, matthias.bgg@gmail.com, mchehab@kernel.org
Cc: shik@chromium.org, devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, suleiman@chromium.org, Rynn.Wu@mediatek.com, srv_heupstream@mediatek.com, robh@kernel.org, ryan.yu@mediatek.com, Jerry-ch.Chen@mediatek.com, frankie.chiu@mediatek.com, jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org, linux-mediatek@lists.infradead.org, zwisler@chromium.org, ddavenport@chromium.org, frederic.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

For Camera AR(Augmented Reality) application requires camera timestamps
to be reported with CLOCK_BOOTTIME to sync timestamp with other sensor
sources.

The boottime timestamp is identical to monotonic timestamp,
except it also includes any time that the system is suspended.

Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
---
 Documentation/media/uapi/v4l/buffer.rst | 11 ++++++++++-
 include/uapi/linux/videodev2.h          |  2 ++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/media/uapi/v4l/buffer.rst b/Documentation/media/uapi/v4l/buffer.rst
index 1cbd9cde57f3..9e636f4118f5 100644
--- a/Documentation/media/uapi/v4l/buffer.rst
+++ b/Documentation/media/uapi/v4l/buffer.rst
@@ -649,13 +649,22 @@ Buffer Flags
       - 0x00002000
       - The buffer timestamp has been taken from the ``CLOCK_MONOTONIC``
 	clock. To access the same clock outside V4L2, use
-	:c:func:`clock_gettime`.
+	:c:func:`clock_gettime` using clock IDs ``CLOCK_MONOTONIC``.
     * .. _`V4L2-BUF-FLAG-TIMESTAMP-COPY`:
 
       - ``V4L2_BUF_FLAG_TIMESTAMP_COPY``
       - 0x00004000
       - The CAPTURE buffer timestamp has been taken from the corresponding
 	OUTPUT buffer. This flag applies only to mem2mem devices.
+    * .. _`V4L2_BUF_FLAG_TIMESTAMP_BOOTIME`:
+
+      - ``V4L2_BUF_FLAG_TIMESTAMP_BOOTIME``
+      - 0x00008000
+      - The buffer timestamp has been taken from the ``CLOCK_BOOTTIME``
+	clock. To access the same clock outside V4L2, use
+	:c:func:`clock_gettime` using clock IDs ``CLOCK_BOOTTIME``.
+	Identical to CLOCK_MONOTONIC, except it also includes any time that
+	the system is suspended.
     * .. _`V4L2-BUF-FLAG-TSTAMP-SRC-MASK`:
 
       - ``V4L2_BUF_FLAG_TSTAMP_SRC_MASK``
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 9d9705ceda76..a4fd271348e7 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1043,6 +1043,8 @@ static inline __u64 v4l2_timeval_to_ns(const struct timeval *tv)
 #define V4L2_BUF_FLAG_TIMESTAMP_UNKNOWN		0x00000000
 #define V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC	0x00002000
 #define V4L2_BUF_FLAG_TIMESTAMP_COPY		0x00004000
+#define V4L2_BUF_FLAG_TIMESTAMP_BOOTIME		0x00008000
+
 /* Timestamp sources. */
 #define V4L2_BUF_FLAG_TSTAMP_SRC_MASK		0x00070000
 #define V4L2_BUF_FLAG_TSTAMP_SRC_EOF		0x00000000
-- 
2.18.0
