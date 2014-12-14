Return-Path: <xerofoify@gmail.com>
Message-ID: <548E0634.4040604@gmail.com>
Date: Sun, 14 Dec 2014 16:50:44 -0500
From: nick <xerofoify@gmail.com>
MIME-Version: 1.0
Subject: Remove Function,ssi_waketest in omap_ssi.c
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: sre@kernel.org
Cc: grant.likely@linaro.org, robh+dt@kernel.org, carlos.chinea@nokia.com, rafael.j.wysocki@intel.com, yongjun_wei@trendmicro.com.cn, andrey.krieger.utkin@gmail.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Greetings Sebastian and the other maintainers,
I am assuming I can remove the function,ssi_waketest in the file,omap_ssi.c However please let me known if removing this
function breaks any omap boards supported by this driver file that you know of. In addition i would recommend testing 
my patch on a board supported by this file and unfortunately I don't have one lying around my house :(. So it would be
a huge favour if someone can test this out on a omap board supported by drivers in this file and send it with a tested
by with that maintainers name.
Thanks,
Nick
