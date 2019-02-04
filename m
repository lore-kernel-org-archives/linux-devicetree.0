From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFCv1 0/3] Odroid c1+ usb fixs
Date: Mon, 4 Feb 2019 21:38:48 +0100
Message-ID: <CAFBinCDj0jA9dT72J8RvfJtyL3bBKTy+PaRsHXukvTuKitaXqg@mail.gmail.com>
References: <20190123151209.2080-1-linux.amoon@gmail.com>
 <CAFBinCC1xjqogcLm94gu+iLS_b_zB8eNEXL+4bYhog==zN0S+A@mail.gmail.com>
 <CANAwSgT3tVss-hQ0jYzTaSvkfVkSQZtiRFhdq1KmUSL4idZmLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CANAwSgT3tVss-hQ0jYzTaSvkfVkSQZtiRFhdq1KmUSL4idZmLw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: devicetree <devicetree@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Anand,

On Mon, Feb 4, 2019 at 9:04 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> I dont have multi-meter to check this out on old and new kernel.
> As per my observation Amlogic 3.10 (32 bit) and 3.14 (64 bit)
> both use some state machine the tune the usb port.
>
> It's not clear that this will work with upstream kernel.
do you have a filename / line number in Amlogic's kernel regarding
this state machine and / or tuning logic?

> I just checked with board booted with usb device connected we are observing
> the bus and is getting power up and hot plugging of usb device is working fine.
>
> $ lsusb -v|egrep "^Bus|MaxPower"
> Couldn't open device, some information will be missing
> Bus 002 Device 003: ID 1b71:0056 Fushicai
>     MaxPower              500mA
> Couldn't open device, some information will be missing
> Bus 002 Device 004: ID 152d:0578 JMicron Technology Corp. / JMicron
> USA Technology Corp. JMS567 SATA 6Gb/s bridge
>     MaxPower               30mA
> Couldn't open device, some information will be missing
> Couldn't open device, some information will be missing
> Bus 002 Device 002: ID 05e3:0610 Genesys Logic, Inc. 4-port hub
>     MaxPower              100mA
> Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Couldn't open device, some information will be missing
>     MaxPower                0mA
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>     MaxPower                0mA
for me it stops at the Genesys Logic, Inc. 4-port hub (I see the root
hub, the 4-port hub and then nothing more) using the mainline kernel
(with or without your patches)

I'm not sure what to do with this information though.
currently we have no reliable way to tell if GPIOAO_5 is only for the
OTG port (usb0) or also for the host-only port (usb1).


Regards
Martin
