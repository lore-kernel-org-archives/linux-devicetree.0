From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: How to inject fwnode/oftree/acpi data by platform driver ?
Date: Sat, 1 Jun 2019 16:14:09 +0200
Message-ID: <c15a9872-4ad4-1b7e-e34f-14549b5b55eb@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>, linux-acpi@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi folks,


I'm looking for a way to inject fwnode data from a platform driver,
in order to initialize generic drivers w/ board specific configuration.
The idea is getting rid of passing driver specific pdata structs
(which, IIRC, seem to be deprecated).

An example usecase is the APUv2/3 board, which have things like gpios
wired to buttons and LEDs. The board can only be detected via DMI
string, no way to probe the platform devices - have to be initialized
explicitly (that's how I'm already doing it now).

The nicest way, IMHO, would be if I could just write some piece of DTS
and some fancy magic all the rest under the hood. Such thing doesn't
seem to exist yet. Does it make sense to implement that ? How could
we do it ?

Which other options do we have ?

Or should we just leave everything as it is and stick w/ pdata structs ?


thx
--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
