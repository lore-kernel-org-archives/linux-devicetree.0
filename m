From: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 4/4] Documentation: DT: lis302: update wakeup binding
Date: Fri, 13 Dec 2013 21:54:54 +0100
Message-ID: <1386968094-24554-5-git-send-email-sre@debian.org>
References: <1386968094-24554-1-git-send-email-sre@debian.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386968094-24554-1-git-send-email-sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Eric Piel <eric.piel-VkQ1JFuSMpfAbQlEx87xDw@public.gmane.org>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This updated the documentation of the DT binding to
describe the added wakeup threshold and second wakeup
engine.

It also adds a note, that the axis values may be
negative.

Signed-off-by: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/misc/lis302.txt | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/misc/lis302.txt b/Documentation/devicetree/bindings/misc/lis302.txt
index 6def86f..2a19bff 100644
--- a/Documentation/devicetree/bindings/misc/lis302.txt
+++ b/Documentation/devicetree/bindings/misc/lis302.txt
@@ -46,11 +46,18 @@ Optional properties for all bus drivers:
 				interrupt 2
  - st,wakeup-{x,y,z}-{lo,hi}:	set wakeup condition on x/y/z axis for
 				upper/lower limit
+ - st,wakeup-threshold:		set wakeup threshold
+ - st,wakeup2-{x,y,z}-{lo,hi}:	set wakeup condition on x/y/z axis for
+				upper/lower limit for second wakeup
+				engine.
+ - st,wakeup2-threshold:	set wakeup threshold for second wakeup
+				engine.
  - st,highpass-cutoff-hz=:	1, 2, 4 or 8 for 1Hz, 2Hz, 4Hz or 8Hz of
 				highpass cut-off frequency
  - st,hipass{1,2}-disable:	disable highpass 1/2.
  - st,default-rate=:		set the default rate
- - st,axis-{x,y,z}=:		set the axis to map to the three coordinates
+ - st,axis-{x,y,z}=:		set the axis to map to the three coordinates.
+				Negative values can be used for inverted axis.
  - st,{min,max}-limit-{x,y,z}	set the min/max limits for x/y/z axis
 				(used by self-test)
 
-- 
1.8.5.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
