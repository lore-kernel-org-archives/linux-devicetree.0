From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/8] dt-bindings: move backlight bindings under leds
Date: Thu,  1 Oct 2015 17:12:28 -0500
Message-ID: <1443737554-10352-3-git-send-email-robh@kernel.org>
References: <1443737554-10352-1-git-send-email-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443737554-10352-1-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Backlights are generally a subtype of LEDs at least from a software
point of view if not always electrically. Move the bindings from the
video directory to underneath the leds dir.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 Documentation/devicetree/bindings/{video => leds}/backlight/88pm860x.txt  | 0
 .../devicetree/bindings/{video => leds}/backlight/gpio-backlight.txt      | 0
 Documentation/devicetree/bindings/{video => leds}/backlight/lp855x.txt    | 0
 .../devicetree/bindings/{video => leds}/backlight/max8925-backlight.txt   | 0
 .../devicetree/bindings/{video => leds}/backlight/pm8941-wled.txt         | 0
 .../devicetree/bindings/{video => leds}/backlight/pwm-backlight.txt       | 0
 .../devicetree/bindings/{video => leds}/backlight/sky81452-backlight.txt  | 0
 .../devicetree/bindings/{video => leds}/backlight/tps65217-backlight.txt  | 0
 8 files changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{video => leds}/backlight/88pm860x.txt (100%)
 rename Documentation/devicetree/bindings/{video => leds}/backlight/gpio-backlight.txt (100%)
 rename Documentation/devicetree/bindings/{video => leds}/backlight/lp855x.txt (100%)
 rename Documentation/devicetree/bindings/{video => leds}/backlight/max8925-backlight.txt (100%)
 rename Documentation/devicetree/bindings/{video => leds}/backlight/pm8941-wled.txt (100%)
 rename Documentation/devicetree/bindings/{video => leds}/backlight/pwm-backlight.txt (100%)
 rename Documentation/devicetree/bindings/{video => leds}/backlight/sky81452-backlight.txt (100%)
 rename Documentation/devicetree/bindings/{video => leds}/backlight/tps65217-backlight.txt (100%)

diff --git a/Documentation/devicetree/bindings/video/backlight/88pm860x.txt b/Documentation/devicetree/bindings/leds/backlight/88pm860x.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/backlight/88pm860x.txt
rename to Documentation/devicetree/bindings/leds/backlight/88pm860x.txt
diff --git a/Documentation/devicetree/bindings/video/backlight/gpio-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/backlight/gpio-backlight.txt
rename to Documentation/devicetree/bindings/leds/backlight/gpio-backlight.txt
diff --git a/Documentation/devicetree/bindings/video/backlight/lp855x.txt b/Documentation/devicetree/bindings/leds/backlight/lp855x.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/backlight/lp855x.txt
rename to Documentation/devicetree/bindings/leds/backlight/lp855x.txt
diff --git a/Documentation/devicetree/bindings/video/backlight/max8925-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/max8925-backlight.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/backlight/max8925-backlight.txt
rename to Documentation/devicetree/bindings/leds/backlight/max8925-backlight.txt
diff --git a/Documentation/devicetree/bindings/video/backlight/pm8941-wled.txt b/Documentation/devicetree/bindings/leds/backlight/pm8941-wled.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/backlight/pm8941-wled.txt
rename to Documentation/devicetree/bindings/leds/backlight/pm8941-wled.txt
diff --git a/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt
rename to Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
diff --git a/Documentation/devicetree/bindings/video/backlight/sky81452-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/sky81452-backlight.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/backlight/sky81452-backlight.txt
rename to Documentation/devicetree/bindings/leds/backlight/sky81452-backlight.txt
diff --git a/Documentation/devicetree/bindings/video/backlight/tps65217-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/tps65217-backlight.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/backlight/tps65217-backlight.txt
rename to Documentation/devicetree/bindings/leds/backlight/tps65217-backlight.txt
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
