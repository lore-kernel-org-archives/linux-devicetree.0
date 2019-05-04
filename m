Return-Path: <SRS0=ik/T=TE=intel.com=lkp@kernel.org>
Date: Sat, 4 May 2019 20:25:00 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [RFC PATCH] allegro: nal_h264_write_start_code_prefix() can be static
Message-ID: <20190504122500.GA82569@lkp-kbuild10>
References: <20190503122010.16663-6-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190503122010.16663-6-m.tretter@pengutronix.de>
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: kbuild-all@01.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org, tfiga@chromium.org, dshah@xilinx.com, hverkuil@xs4all.nl
List-ID: <devicetree@vger.kernel.org>


Fixes: eba69588199f ("allegro: add SPS/PPS nal unit writer")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 nal-h264.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/nal-h264.c b/drivers/media/platform/allegro-dvt/nal-h264.c
index fed1180c..a78c633 100644
--- a/drivers/media/platform/allegro-dvt/nal-h264.c
+++ b/drivers/media/platform/allegro-dvt/nal-h264.c
@@ -430,7 +430,7 @@ static void nal_h264_rbsp_trailing_bits(struct rbsp *rbsp)
 		  &rbsp_alignment_zero_bit);
 }
 
-void nal_h264_write_start_code_prefix(struct rbsp *rbsp)
+static void nal_h264_write_start_code_prefix(struct rbsp *rbsp)
 {
 	u8 *p = rbsp->data + DIV_ROUND_UP(rbsp->pos, 8);
 	int i = 4;
@@ -448,7 +448,7 @@ void nal_h264_write_start_code_prefix(struct rbsp *rbsp)
 	rbsp->pos += i * 8;
 }
 
-void nal_h264_read_start_code_prefix(struct rbsp *rbsp)
+static void nal_h264_read_start_code_prefix(struct rbsp *rbsp)
 {
 	u8 *p = rbsp->data + DIV_ROUND_UP(rbsp->pos, 8);
 	int i = 4;
@@ -466,7 +466,7 @@ void nal_h264_read_start_code_prefix(struct rbsp *rbsp)
 	rbsp->pos += i * 8;
 }
 
-void nal_h264_write_filler_data(struct rbsp *rbsp)
+static void nal_h264_write_filler_data(struct rbsp *rbsp)
 {
 	u8 *p = rbsp->data + DIV_ROUND_UP(rbsp->pos, 8);
 	int i;
@@ -477,7 +477,7 @@ void nal_h264_write_filler_data(struct rbsp *rbsp)
 	rbsp->pos += i * 8;
 }
 
-void nal_h264_read_filler_data(struct rbsp *rbsp)
+static void nal_h264_read_filler_data(struct rbsp *rbsp)
 {
 	u8 *p = rbsp->data + DIV_ROUND_UP(rbsp->pos, 8);
 
