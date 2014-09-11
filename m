Return-Path: <k.lugsden@lsirobway.com.au>
Message-ID: <5411205A.4080606@lsirobway.com.au>
Date: Thu, 11 Sep 2014 13:38:58 +0930
From: Keith Lugsden <keith@lsirobway.com.au>
MIME-Version: 1.0
Subject: FlexCAN driver triggers kernel BUG in BUSOFF restart
Content-Type: multipart/related;
 boundary="------------070700050506090909070105"
To: Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-can@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------070700050506090909070105
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi,<br>
    <br>
    I was asked by Freescale to post this kernel BUG to you and your
    email address appears in the kernel documentation, so please accept
    my apologies if you did not wish to see this.<br>
    <br>
    A kernel BUG is triggered during a CAN send operation (kernel
    version 3.15.7, stack trace follows below). A simple program, such
    as the one included in the kernel's CAN documentation, will cause
    this problem, as will the can-utils programs 'cangen' and 'cansend'.<br>
    <br>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    I have narrowed down the problem to restart timeouts after entering
    the BUSOFF state. My board is not yet physically connected to a CAN
    bus, so it goes into a BUSOFF state when sending. Normal CAN bus
    operation means that after the restart timeout, the driver should
    automatically come out of BUSOFF state. I can alter the timeout
    period and, no matter how long it is, the BUG is triggered
    immediately the timeout occurs. Clearly, the timeout code is being
    entered inappropriately from flexcan_chip_start() in flexcan.c.<br>
     <br>
    So a short term workaround is to not let the CAN bus go into BUSOFF,
    but this is not a viable real world solution. Another workaround is
    to detect the BUSOFF in code, then to cloes and reopen the CAN
    socket (I haven't tried exactly this, but doing 'ifconfig can0 down'
    followed by 'ifconfig can0 up' clears the BUSOFF state and avoids
    the problem). <br>
    <br>
    Thank you for reading this.<br>
    <br>
    Typical stack trace:<br>
    <br>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">BUG: scheduling while
        atomic: swapper/0/0/0x00000100</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">1 lock held by
        swapper/0/0:</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">#0:
        (((&amp;priv-&gt;restart_timer))){+.-...}, at:
        [&lt;8002fe60&gt;] call_timer_fn+0x0/0xe8</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">Modules linked in:</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">CPU: 0 PID: 0 Comm:
        swapper/0 Tainted: G W 3.15.7 #5</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">Backtrace:</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">[&lt;80011ba4&gt;]
        (dump_backtrace) from [&lt;80011d40&gt;] (show_stack+0x18/0x1c)</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">r6:00000000 r5:00000000
        r4:00000000 r3:00000000</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">[&lt;80011d28&gt;]
        (show_stack) from [&lt;805de120&gt;] (dump_stack+0x88/0xa4)</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">[&lt;805de098&gt;]
        (dump_stack) from [&lt;805db3ec&gt;] (__schedule_bug+0x64/0x7c)</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">r5:80867268 r4:80867268</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">[&lt;805db388&gt;]
        (__schedule_bug) from [&lt;805e09b0&gt;]
        (__schedule+0x540/0x5f8)</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">r4:bf7c7b00 r3:00000002</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">[&lt;805e0470&gt;]
        (__schedule) from [&lt;805e0b5c&gt;] (schedule+0x38/0x88)</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">r10:8085c000
        r9:00000000 r8:00000001 r7:00000000 r6:00004e20 r5:00000000</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">r4:00002710</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">[&lt;805e0b24&gt;]
        (schedule) from [&lt;805e03c4&gt;]
        (schedule_hrtimeout_range_clock+0xe0/0x158)</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">[&lt;805e02e4&gt;]
        (schedule_hrtimeout_range_clock) from [&lt;805e0450&gt;]
        (schedule_hrtimeout_range+0x14/0x18)</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">r10:808644c4
        r8:bf335e00 r7:00000000 r6:c09b8000 r5:c09b8000 r4:bf335800</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">[&lt;805e043c&gt;]
        (schedule_hrtimeout_range) from [&lt;8002fb58&gt;]
        (usleep_range+0x50/0x58)</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">[&lt;8002fb08&gt;]
        (usleep_range) from [&lt;803f2964&gt;]
        (flexcan_chip_start+0x7c/0x440)</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">[&lt;803f28e8&gt;]
        (flexcan_chip_start) from [&lt;803f3994&gt;]
        (flexcan_set_mode+0x28/0x54)</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">r10:bf335800
        r9:803f1680 r8:803f1680 r7:00000100 r6:00000001 r5:bf335800</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">r4:bf335800</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">[&lt;803f396c&gt;]
        (flexcan_set_mode) from [&lt;803f1718&gt;]
        (can_restart+0x98/0xd4)</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">r5:8085c000 r4:bf335800</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">[&lt;803f1680&gt;]
        (can_restart) from [&lt;8002fed0&gt;] (call_timer_fn+0x70/0xe8)</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">r5:8085c000 r4:8085de00</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">[&lt;8002fe60&gt;]
        (call_timer_fn) from [&lt;80030810&gt;]
        (run_timer_softirq+0x1b0/0x24c)</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">r10:8085e0c0
        r8:bf335800 r7:00000000 r6:8085de40 r5:808b3500 r4:bf335e74</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">[&lt;80030660&gt;]
        (run_timer_softirq) from [&lt;8002a1bc&gt;]
        (__do_softirq+0x128/0x26c)</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">r10:00000001
        r9:00000100 r8:00000001 r7:8085c000 r6:8085e080 r5:8085e084</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">r4:00000000</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">[&lt;8002a094&gt;]
        (__do_softirq) from [&lt;8002a5f8&gt;] (irq_exit+0xb0/0x104)</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">r10:805e82a8
        r9:8085c000 r8:00000000 r7:f4000100 r6:00000000 r5:0000001d</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">r4:8085c000</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">[&lt;8002a548&gt;]
        (irq_exit) from [&lt;8000f31c&gt;] (handle_IRQ+0x44/0x9c)</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">r4:80858ffc r3:00000182</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">[&lt;8000f2d8&gt;]
        (handle_IRQ) from [&lt;80008540&gt;] (gic_handle_irq+0x30/0x64)</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">r6:8085df20 r5:80864a98
        r4:f400010c r3:000000a0</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">[&lt;80008510&gt;]
        (gic_handle_irq) from [&lt;80012864&gt;] (__irq_svc+0x44/0x58)</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">Exception
        stack(0x8085df20 to 0x8085df68)</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">df20: 00000001 00000001
        00000000 80867268 8085c000 80864588 80864538 8085c000</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">df40: 00000000 8085c000
        805e82a8 8085df74 8085df38 8085df68 800633f0 8000f6a0</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">df60: 200e0013 ffffffff</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">r7:8085df54 r6:ffffffff
        r5:200e0013 r4:8000f6a0</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">[&lt;8000f678&gt;]
        (arch_cpu_idle) from [&lt;8005c72c&gt;]
        (cpu_startup_entry+0xfc/0x160)</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">[&lt;8005c630&gt;]
        (cpu_startup_entry) from [&lt;805d81e8&gt;]
        (rest_init+0xb0/0xd8)</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">r7:808045f8 r3:00000000</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">[&lt;805d8138&gt;]
        (rest_init) from [&lt;807d3b4c&gt;] (start_kernel+0x310/0x374)</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">r5:808b22c0 r4:80864638</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">[&lt;807d383c&gt;]
        (start_kernel) from [&lt;10008074&gt;] (0x10008074)</span></p>
    <p style="margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 12.8000001907349px;
      font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande',
      sans-serif; vertical-align: baseline; color: rgb(61, 61, 61);
      font-variant: normal; letter-spacing: normal; line-height:
      15.6000003814697px; orphans: auto; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><span style="margin: 0px;
        padding: 0px; border: 0px; font-weight: inherit; font-style:
        inherit; font-size: 12.8000001907349px; font-family: 'andale
        mono', times; vertical-align: baseline;">flexcan 2090000.flexcan
        can0: writing ctrl=0x0729a055</span></p>
    <br>
    <div class="moz-signature">-- <br>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <meta name="GENERATOR" content="GtkHTML/4.2.2">
      <p style="font-family:verdana;color:#808080;font-size:12pt;"> <b><font
            color="#195E47">Keith Lugsden</font></b><br>
        <b>Senior Software Engineer</b><br>
        LSI-Robway Pty Ltd – A Division of Load Systems International<br>
        <br>
        <img src="cid:part1.04030400.00000408@lsirobway.com.au"> </p>
      <table>
        <tbody>
          <tr>
            <td><font color="#808080">Direct:</font></td>
            <td><font color="#808080">+61 (0)8 8238 3540</font> </td>
          </tr>
          <tr>
            <td><font color="#808080">Mobile:</font></td>
            <td><font color="#808080">+61 (0) 420 307 157</font></td>
          </tr>
          <tr>
            <td><font color="#808080">Email:</font></td>
            <td><font color="#000080"><a
                  href="mailto:keith@lsirobway.com.au">k.lugsden@lsirobway.com.au</a></font></td>
          </tr>
          <tr>
            <td><font color="#808080">Web:</font></td>
            <td><font color="#000080"><a
                  href="http://www.lsirobway.com.au">www.lsirobway.com.au</a></font></td>
          </tr>
        </tbody>
      </table>
      <br>
    </div>
  </body>
</html>

--------------070700050506090909070105
Content-Type: image/png;
 name="5.png"
Content-Transfer-Encoding: base64
Content-ID: <part1.04030400.00000408@lsirobway.com.au>
Content-Disposition: inline;
 filename="5.png"

iVBORw0KGgoAAAANSUhEUgAAALQAAABICAIAAADQ/0gHAAAKRWlDQ1BJQ0MgcHJvZmlsZQAA
eNqdU2dUU+kWPffe9EJLiICUS29SFQggUkKLgBSRJiohCRBKiCGh2RVRwRFFRQQbyKCIA46O
gIwVUSwMigrYB+Qhoo6Do4iKyvvhe6Nr1rz35s3+tdc+56zznbPPB8AIDJZIM1E1gAypQh4R
4IPHxMbh5C5AgQokcAAQCLNkIXP9IwEA+H48PCsiwAe+AAF40wsIAMBNm8AwHIf/D+pCmVwB
gIQBwHSROEsIgBQAQHqOQqYAQEYBgJ2YJlMAoAQAYMtjYuMAUC0AYCd/5tMAgJ34mXsBAFuU
IRUBoJEAIBNliEQAaDsArM9WikUAWDAAFGZLxDkA2C0AMElXZkgAsLcAwM4QC7IACAwAMFGI
hSkABHsAYMgjI3gAhJkAFEbyVzzxK64Q5yoAAHiZsjy5JDlFgVsILXEHV1cuHijOSRcrFDZh
AmGaQC7CeZkZMoE0D+DzzAAAoJEVEeCD8/14zg6uzs42jrYOXy3qvwb/ImJi4/7lz6twQAAA
4XR+0f4sL7MagDsGgG3+oiXuBGheC6B194tmsg9AtQCg6dpX83D4fjw8RaGQudnZ5eTk2ErE
Qlthyld9/mfCX8BX/Wz5fjz89/XgvuIkgTJdgUcE+ODCzPRMpRzPkgmEYtzmj0f8twv//B3T
IsRJYrlYKhTjURJxjkSajPMypSKJQpIpxSXS/2Ti3yz7Az7fNQCwaj4Be5EtqF1jA/ZLJxBY
dMDi9wAA8rtvwdQoCAOAaIPhz3f/7z/9R6AlAIBmSZJxAABeRCQuVMqzP8cIAABEoIEqsEEb
9MEYLMAGHMEF3MEL/GA2hEIkxMJCEEIKZIAccmAprIJCKIbNsB0qYC/UQB00wFFohpNwDi7C
VbgOPXAP+mEInsEovIEJBEHICBNhIdqIAWKKWCOOCBeZhfghwUgEEoskIMmIFFEiS5E1SDFS
ilQgVUgd8j1yAjmHXEa6kTvIADKC/Ia8RzGUgbJRPdQMtUO5qDcahEaiC9BkdDGajxagm9By
tBo9jDah59CraA/ajz5DxzDA6BgHM8RsMC7Gw0KxOCwJk2PLsSKsDKvGGrBWrAO7ifVjz7F3
BBKBRcAJNgR3QiBhHkFIWExYTthIqCAcJDQR2gk3CQOEUcInIpOoS7QmuhH5xBhiMjGHWEgs
I9YSjxMvEHuIQ8Q3JBKJQzInuZACSbGkVNIS0kbSblIj6SypmzRIGiOTydpka7IHOZQsICvI
heSd5MPkM+Qb5CHyWwqdYkBxpPhT4ihSympKGeUQ5TTlBmWYMkFVo5pS3aihVBE1j1pCraG2
Uq9Rh6gTNHWaOc2DFklLpa2ildMaaBdo92mv6HS6Ed2VHk6X0FfSy+lH6JfoA/R3DA2GFYPH
iGcoGZsYBxhnGXcYr5hMphnTixnHVDA3MeuY55kPmW9VWCq2KnwVkcoKlUqVJpUbKi9Uqaqm
qt6qC1XzVctUj6leU32uRlUzU+OpCdSWq1WqnVDrUxtTZ6k7qIeqZ6hvVD+kfln9iQZZw0zD
T0OkUaCxX+O8xiALYxmzeCwhaw2rhnWBNcQmsc3ZfHYqu5j9HbuLPaqpoTlDM0ozV7NS85Rm
PwfjmHH4nHROCecop5fzforeFO8p4ikbpjRMuTFlXGuqlpeWWKtIq1GrR+u9Nq7tp52mvUW7
WfuBDkHHSidcJ0dnj84FnedT2VPdpwqnFk09OvWuLqprpRuhu0R3v26n7pievl6Ankxvp955
vef6HH0v/VT9bfqn9UcMWAazDCQG2wzOGDzFNXFvPB0vx9vxUUNdw0BDpWGVYZfhhJG50Tyj
1UaNRg+MacZc4yTjbcZtxqMmBiYhJktN6k3umlJNuaYppjtMO0zHzczNos3WmTWbPTHXMueb
55vXm9+3YFp4Wiy2qLa4ZUmy5FqmWe62vG6FWjlZpVhVWl2zRq2drSXWu627pxGnuU6TTque
1mfDsPG2ybaptxmw5dgG2662bbZ9YWdiF2e3xa7D7pO9k326fY39PQcNh9kOqx1aHX5ztHIU
OlY63prOnO4/fcX0lukvZ1jPEM/YM+O2E8spxGmdU5vTR2cXZ7lzg/OIi4lLgssulz4umxvG
3ci95Ep09XFd4XrS9Z2bs5vC7ajbr+427mnuh9yfzDSfKZ5ZM3PQw8hD4FHl0T8Ln5Uwa9+s
fk9DT4FntecjL2MvkVet17C3pXeq92HvFz72PnKf4z7jPDfeMt5ZX8w3wLfIt8tPw2+eX4Xf
Q38j/2T/ev/RAKeAJQFnA4mBQYFbAvv4enwhv44/Ottl9rLZ7UGMoLlBFUGPgq2C5cGtIWjI
7JCtIffnmM6RzmkOhVB+6NbQB2HmYYvDfgwnhYeFV4Y/jnCIWBrRMZc1d9HcQ3PfRPpElkTe
m2cxTzmvLUo1Kj6qLmo82je6NLo/xi5mWczVWJ1YSWxLHDkuKq42bmy+3/zt84fineIL43sX
mC/IXXB5oc7C9IWnFqkuEiw6lkBMiE44lPBBECqoFowl8hN3JY4KecIdwmciL9E20YjYQ1wq
Hk7ySCpNepLskbw1eSTFM6Us5bmEJ6mQvEwNTN2bOp4WmnYgbTI9Or0xg5KRkHFCqiFNk7Zn
6mfmZnbLrGWFsv7Fbou3Lx6VB8lrs5CsBVktCrZCpuhUWijXKgeyZ2VXZr/Nico5lqueK83t
zLPK25A3nO+f/+0SwhLhkralhktXLR1Y5r2sajmyPHF52wrjFQUrhlYGrDy4irYqbdVPq+1X
l65+vSZ6TWuBXsHKgsG1AWvrC1UK5YV969zX7V1PWC9Z37Vh+oadGz4ViYquFNsXlxV/2Cjc
eOUbh2/Kv5nclLSpq8S5ZM9m0mbp5t4tnlsOlqqX5pcObg3Z2rQN31a07fX2Rdsvl80o27uD
tkO5o788uLxlp8nOzTs/VKRU9FT6VDbu0t21Ydf4btHuG3u89jTs1dtbvPf9Psm+21UBVU3V
ZtVl+0n7s/c/romq6fiW+21drU5tce3HA9ID/QcjDrbXudTVHdI9VFKP1ivrRw7HH77+ne93
LQ02DVWNnMbiI3BEeeTp9wnf9x4NOtp2jHus4QfTH3YdZx0vakKa8ppGm1Oa+1tiW7pPzD7R
1ureevxH2x8PnDQ8WXlK81TJadrpgtOTZ/LPjJ2VnX1+LvncYNuitnvnY87fag9v77oQdOHS
Rf+L5zu8O85c8rh08rLb5RNXuFearzpfbep06jz+k9NPx7ucu5quuVxrue56vbV7ZvfpG543
zt30vXnxFv/W1Z45Pd2983pv98X39d8W3X5yJ/3Oy7vZdyfurbxPvF/0QO1B2UPdh9U/W/7c
2O/cf2rAd6Dz0dxH9waFg8/+kfWPD0MFj5mPy4YNhuueOD45OeI/cv3p/KdDz2TPJp4X/qL+
y64XFi9++NXr187RmNGhl/KXk79tfKX96sDrGa/bxsLGHr7JeDMxXvRW++3Bd9x3He+j3w9P
5Hwgfyj/aPmx9VPQp/uTGZOT/wQDmPP87zWUggAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0
SU1FB90BCwM1N5Df0gAAACAASURBVHja7b1nnB3VkT5cVae7b5icNCONNJoZJSRQACFkEDJB
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
--------------070700050506090909070105--
