From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH] arm64: allwinner: a64: a64-olinuxino: add usb otg
Date: Tue, 12 Dec 2017 14:57:01 +0530
Message-ID: <CAMty3ZDEhXjHTE4WsJK8=yAayuR=qvJQaZEjGq=LDS6Y4V7RFw@mail.gmail.com>
References: <1513058169-25516-1-git-send-email-jagan@amarulasolutions.com> <20171212081335.3qkqcofdbcfuu5zh@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171212081335.3qkqcofdbcfuu5zh@flea.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 12, 2017 at 1:43 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Hi,
>
> On Tue, Dec 12, 2017 at 11:26:09AM +0530, Jagan Teki wrote:
>> Add usb otg support for a64-olinuxino board,
>> - USB0-ID connected with PH9
>> - USB0-VBUSDET connected with PH6
>> - USB-DRVVBUS controlled by N_VBUSEN pin from PMIC
>>
>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> How was this tested? Did you test the OTG part, or only the peripheral
> part?

Yes peripheral.
