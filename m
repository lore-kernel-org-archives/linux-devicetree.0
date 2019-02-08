From: David Coles <coles.david@gmail.com>
Subject: Re: [PATCH] ARM: dts: add description of Netgear RN NV+v2 LCD
Date: Fri, 8 Feb 2019 07:23:55 -0800
Message-ID: <CAO82AsgwwmxMPAeU7TimFA-nZosqEgCRZV8A+36rq1hcWM5QzQ@mail.gmail.com>
References: <20190208045305.8759-1-coles.david@gmail.com> <20190208135650.GD26594@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190208135650.GD26594@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 8, 2019 at 5:56 AM Andrew Lunn <andrew@lunn.ch> wrote:
> Kirkwood! It has been a while since we had a kirkwood patch. Some NAS
> boxes seem to never die. Nice to see somebody still hacking on them.

Netgear firmware only supported SMBv1, Windows 10 does not. Luckily
Arnaud Ebalard had done most of the heavy lifting years ago. Getting
the LCD working with the new HD44780 driver was icing on the cake.

Thanks,
David
