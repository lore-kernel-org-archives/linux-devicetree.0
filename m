From: noman pouigt <variksla@gmail.com>
Subject: gpio_key.c device tree question
Date: Sun, 8 Jan 2017 19:42:19 -0800
Message-ID: <CAES_P+_SWsRQZFRJU37FJuXPEcZPgADbcdN8-9EXKGL990XpDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-input-owner@vger.kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

I am trying to see how to disable the sub device nodes in
gpio_keys device node.

I have this in my base dtsi file:

#include "vendor_file.dtsi"

        gpio_keys {
                compatible = "gpio-keys";
                input-name = "gpio-keys";
                pinctrl-names = "gpio_key_active","gpio_key_suspend";
                pinctrl-0 = <&key_active>;
                pinctrl-1 = <&key_suspend>;
                camera_snapshot {
                        label = "camera_snapshot";
                        //snip
                };
        };

I have this in vendor_file.dtsi:
       gpio_keys {
               source_key_1 {
                       label = "source_key_1";
                       //snip
               };
       };

In my current consolidated dtb file all nodes are getting
added i.e. camera_snapshot and source_key_1. How
can i remove camera_snapshot node from the
gpio_keys device node or disable it?


Thanks,
