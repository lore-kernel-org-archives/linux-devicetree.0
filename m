From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v3 0/1] Devicetree binding for ASPEED PWM/Fan Tach
Date: Mon, 13 Feb 2017 22:19:34 -0800
Message-ID: <20170214061935.17827-1-jaghu@google.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: joel@jms.id.au, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
List-Id: devicetree@vger.kernel.org

I received comments regarding devicetree documentation for
ASPEED AST2400/AST2500 PWM/Fan Tach controller driver.
I have addressed the comments in this patch. I want to work towards a common
devicetree structure and then proceed with implementation of the
corresponding hwmon driver.

Jaghathiswari Rankappagounder Natarajan (1):
  Documentation: dt-bindings: Document bindings for ASPEED
    AST2400/AST2500 PWM and Fan tach controller device driver

 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt

--
2.11.0.483.g087da7b7c-goog
